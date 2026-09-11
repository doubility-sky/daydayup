[Caddy](https://caddyserver.com/)：使用 Go 编写的 Web 服务器与反向代理，支持自动申请和续期 HTTPS 证书。以下使用 Caddy 2 的 Caddyfile 配置。

- [Documentation](https://caddyserver.com/docs/)，官方文档
- [github.com/caddyserver/caddy](https://github.com/caddyserver/caddy)，官方 Git 仓库
- [Caddyfile Directives](https://caddyserver.com/docs/caddyfile/directives)，常用指令速查
- 对照：[[nginx]]



## Learn
- [Caddyfile Tutorial](https://caddyserver.com/docs/caddyfile-tutorial)，Caddyfile 入门教程
- [How Caddy Works](https://caddyserver.com/docs/architecture)，底层架构与适配器工作原理
- [Common Caddyfile Patterns](https://caddyserver.com/docs/caddyfile/patterns)，常见场景配置模式
- [Automatic HTTPS](https://caddyserver.com/docs/automatic-https)，证书自动获取、续期与本地信任机制



## Installation

### Ubuntu / Debian
- 按 [官方安装说明](https://caddyserver.com/docs/install#debian-ubuntu-raspbian) 添加 stable 软件源，再安装 `caddy`；发行版自带版本可能不同，不混用多个来源
- 官方 Debian/Ubuntu 软件包会安装 systemd 服务，配置文件为 `/etc/caddy/Caddyfile`

### macOS
- [Homebrew](https://formulae.brew.sh/formula/caddy)：
  ```sh
  brew install caddy
  brew services start caddy
  ```
- 插件与定制构建：需要 DNS 校验等扩展模块时，使用 [xcaddy](https://github.com/caddyserver/xcaddy) 编译，或在 [Download Caddy](https://caddyserver.com/download) 下载包含指定插件的二进制
- 查看版本和模块：`caddy version`、`caddy list-modules`；第三方指令报错时先确认模块是否包含在当前二进制里



## Run/Stop
- systemd：`sudo systemctl start/stop/restart/status caddy`，斜杠分隔的是可选操作
  - 默认以 `caddy` 用户运行，数据保存在 `/var/lib/caddy` 下；证书私钥和内部 CA 数据不要随意删除
- Homebrew：`brew services start/stop/restart caddy`；配置通常为 `$(brew --prefix)/etc/Caddyfile`，用 `brew services info caddy` 确认服务信息
- 手动调试用 `caddy run --config Caddyfile --adapter caddyfile` 前台运行，Ctrl+C 退出；不要与已有服务占用相同的站点端口或 Admin 端口
- 格式化与配置校验：
  - `caddy fmt --diff Caddyfile`：查看格式化前后的 diff
  - `caddy fmt --overwrite Caddyfile`：直接按官方风格就地格式化并保存
  - `caddy validate --config Caddyfile --adapter caddyfile`：解析并加载模块，能检查证书文件缺失等错误，但不会监听端口，也不验证后端健康
  - `caddy adapt --config Caddyfile --adapter caddyfile --pretty`：转换成 JSON；转换成功不等于加载配置成功
- 修改服务配置后，先校验再重载：
  ```sh
  sudo -u caddy caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile && sudo systemctl reload caddy
  ```
- 手动实例使用 `caddy reload --config Caddyfile --adapter caddyfile`，不必 stop/start；WebSocket 等长连接的保留还取决于相关模块配置
- reload 通过 Admin API 更新运行配置，默认地址为 `localhost:2019`；接口能控制整个进程，不要对外开放
- 自定义 Admin 地址时，reload / stop 指定对应 `--address`；不要误操作另一个实例。直接通过 API 改配置也不会自动回写 Caddyfile



## Quick start
- 在空目录准备文件，不修改系统服务；先确认 8081 和示例 Admin 端口 2020 可用：
  ```sh
  mkdir -p /tmp/caddy-local-demo
  cd /tmp/caddy-local-demo
  mkdir -p site
  printf 'hello caddy\n' > site/index.html
  ```
- 创建 `Caddyfile.local`。`http://` 禁用本站自动 HTTPS，`bind` 才是限制监听接口；只写站点地址中的 `127.0.0.1` 不代表只监听本机：
  ```caddyfile
  {
  	admin 127.0.0.1:2020
  }

  http://127.0.0.1:8081 {
  	bind 127.0.0.1
  	root * site
  	file_server
  }
  ```
- 在同一目录检查并前台启动，`site` 相对于进程工作目录，不是配置文件目录：
  ```sh
  caddy validate --config Caddyfile.local --adapter caddyfile
  caddy run --config Caddyfile.local --adapter caddyfile
  ```
- 在另一终端执行 curl 验证：
  ```sh
  curl -i http://127.0.0.1:8081/
  ```
- 修改示例配置后：`caddy reload --config Caddyfile.local --adapter caddyfile --address 127.0.0.1:2020`；前台 Ctrl+C 退出，或用 `caddy stop --address 127.0.0.1:2020`



## Configuration
- Caddyfile 通常按指令的预设顺序执行，不是逐行执行；需要固定顺序时用 [route](https://caddyserver.com/docs/caddyfile/directives/route)
- 以下场景互为替代，替换 `/srv/www/example` 和后端地址。独立运行时占用默认 Admin 端口 2019；若接着 Quick start 练习，保留其全局 Admin 配置，只替换站点块

### Static Site
- 基础静态文件服务，静态文件根目录为 `/srv/www/example`：
  ```caddyfile
  http://127.0.0.1:8081 {
  	bind 127.0.0.1
  	root * /srv/www/example
  	file_server
  }
  ```

### SPA
- 用互斥的 `handle` 分开 API 和页面回退；`try_files` 是内部改写，不是 HTTP 重定向：
  ```caddyfile
  http://127.0.0.1:8081 {
  	bind 127.0.0.1
  	root * /srv/www/example

  	# 同时匹配 /api 和 /api/ 下的路径，不匹配 /apibar
  	@api path /api /api/*
  	handle @api {
  		reverse_proxy 127.0.0.1:9000
  	}

  	# 其余请求交给静态站和前端路由
  	handle {
  		try_files {path} {path}/ /index.html
  		file_server
  	}
  }
  ```

### Reverse Proxy
- 基础反代至后端 `127.0.0.1:9000`：
  ```caddyfile
  http://127.0.0.1:8081 {
  	bind 127.0.0.1
  	reverse_proxy 127.0.0.1:9000
  }
  ```
- 默认代理行为与代理头：
  - 没有额外 rewrite 时，`reverse_proxy` 保留请求方法、路径和查询参数
  - 上例的 HTTP 后端收到原始 `Host`，Caddy 设置 `X-Forwarded-For`、`X-Forwarded-Proto`、`X-Forwarded-Host`
  - WebSocket 自动处理协议升级，无需手动设置 `Upgrade` / `Connection`
  - 默认忽略客户端传入的上述 `X-Forwarded-*` 值，防止伪造；前置 CDN / 反代时才按实际网段配置 [trusted_proxies](https://caddyserver.com/docs/caddyfile/options#trusted-proxies)，不是默认信任整条链
- 路径剥离与保留：
  - 下列片段放在站点块内。`handle_path /api/*` 剥离 `/api`，后端收到 `/users` 而不是 `/api/users`：
    ```caddyfile
    handle_path /api/* {
    	reverse_proxy 127.0.0.1:9000
    }
    ```
  - `/api/*` 不匹配裸 `/api`；可单独加 `redir /api /api/ 308`。不要改成 `/api*`，那样也会匹配 `/apibar`
  - `handle /api/*`：保留完整请求路径（后端收到 `/api/users`）：
    ```caddyfile
    handle /api/* {
    	reverse_proxy 127.0.0.1:9000
    }
    ```
- 固定执行顺序（route）：
  - 下例放在站点块内，按书写顺序改路径再代理。这里只演示顺序；单独使用 `uri` 时，默认顺序本来也在 `reverse_proxy` 之前：
    ```caddyfile
    route {
    	uri strip_prefix /v1
    	reverse_proxy 127.0.0.1:9000
    }
    ```
- 负载均衡：
  - 支持多后端故障转移与健康检查（轮询、最少连接、IP 哈希等），参考 [reverse_proxy Load Balancing](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy#load-balancing)



## HTTPS
- 自动证书申请与重定向：
  - 把站点地址换成自己控制的公网域名即可启用自动 HTTPS；显式 `http://` 则使用明文 HTTP，自定义非 HTTP 端口不一定关闭 HTTPS
  - Caddy 自动申请和续期证书，并把 HTTP 请求重定向到 HTTPS；具体续期时机取决于证书及 CA 策略
  ```caddyfile
  example.com {
  	root * /srv/www/example
  	file_server
  }
  ```
- 公网部署前检查：
  - A / AAAA 记录指向正确服务器，尤其不要留下指向旧机器的 AAAA；示例 `example.com` 需替换
  - 通常放行 TCP 80 / 443，并确保 Caddy 能监听。HTTP-01 验证走 80，TLS-ALPN-01 走 443；DNS-01 不要求入站验证端口，但需要 DNS 插件和凭据
  - UDP 443 用于 HTTP/3，不是 HTTPS 证书申请的必要条件
  - 数据目录必须可写且持久化。官方 Docker 镜像应持久化 `/data`，不要只保留 Caddyfile，否则重建后可能重复申请证书、触发限额
- 本地开发与私有 CA：
  - 当域名配置为 `localhost` 或 `*.localhost` 时，Caddy 不请求公网 ACME，而是使用内置私有 CA 签发证书
  - `caddy trust` 安装的是本机 Caddy CA 的根证书，可能需要管理员权限；访问站点的每台客户端都要信任该 CA，不是服务器自己信任就够了
  - 不要为绕过报错关闭生产 TLS 校验；排查证书链、域名和客户端信任库
- 手动指定证书：
  - 已有证书可用 `tls` 指定，证书续期由外部工具负责；文件更新后可用 `caddy reload --force` 配合正确配置路径重新加载：
    ```caddyfile
    example.com {
    	tls /path/to/cert.pem /path/to/key.pem
    	reverse_proxy 127.0.0.1:9000
    }
    ```



## Logs
- 开启访问日志：
  - 访问日志默认不开启。站点内单写 `log` 即可输出到 stderr；要写文件并轮转可用：
  ```caddyfile
  example.com {
  	root * /srv/www/example
  	file_server

  	log {
  		output file /var/log/caddy/example.access.log {
  			roll_size 50mb
  			roll_keep 5
  		}
  		format json
  	}
  }
  ```
- 服务日志查看：
  - 由 systemd 托管运行时，标准输出与错误日志进入 systemd journal：
  ```sh
  sudo journalctl -u caddy -e --no-pager
  sudo journalctl -u caddy -f
  ```
- 运行身份与目录权限：
  - 默认服务用户 `caddy` 需要对父目录有遍历权限、对静态文件有读取权限、对日志目录有写入权限；服务的 systemd 沙箱还可能限制 `/home` 等路径，站点放 `/srv` 更省事
- DNS 切换前的主机与 SNI 验证：
  - 使用 `curl --resolve` 直接指定目标 IP 发起请求，无需修改 `/etc/hosts`：
  ```sh
  curl -Iv --resolve example.com:443:127.0.0.1 https://example.com/
  ```



## FAQs
- 路径没匹配：`/api` 是精确匹配，`/api/*` 匹配 `/api/` 及子路径，`/api*` 还会匹配 `/apibar`
- API 返回了 `index.html`：按 SPA 示例用 `@api` 和 `handle` 分流，包含裸 `/api`；不要让 API 参与前端回退
- 改配置没生效：`systemctl cat caddy` 查看实际 ExecStart / ExecReload 路径，确认 validate 和 reload 用的是同一份文件；校验成功不等于运行进程已更新
- reload 连接拒绝：检查进程、Admin 地址和是否配置了 `admin off`；本地示例用 2020，不是默认 2019
- 403 / 文件读不到：检查运行用户、文件及父目录权限；`sudo -u caddy test -r /srv/www/example/index.html` 可检查文件可读性，之后再看服务沙箱和日志，不用 `chmod 777`
- 502：先 `curl -v http://127.0.0.1:9000/` 直连后端，再查服务日志里的连接拒绝、超时或 TLS 错误；后端为 HTTPS 时还要核对 SNI 和证书
- ACME 失败：检查 DNS、80 / 443 监听冲突、防火墙及前置 CDN。HTTP 验证与 TLS-ALPN 验证的排查方式不同，按日志里实际使用的 challenge 查
- Nginx 与 Caddy 同机：同一个地址端口只能由一个服务监听，先在高端口联调；切换公网入口前同时安排证书、端口和 DNS



## Resources
- [Caddy Community Forum](https://caddy.community/)，官方社区论坛
- [Caddy GitHub Releases](https://github.com/caddyserver/caddy/releases)，发行版安装包与更新说明
- [caddyserver/dist](https://github.com/caddyserver/dist)，官方 systemd 服务单元及发行版集成脚本
