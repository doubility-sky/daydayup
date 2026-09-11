[nginx](https://nginx.org/)：Web 服务器与反向代理，也可代理 TCP/UDP 流量。日常主要用来放静态文件、转发应用请求和终止 TLS。

- [Documentation](https://nginx.org/en/docs/)
- [Alphabetical index of directives](https://nginx.org/en/docs/dirindex.html)
- [Alphabetical index of variables](https://nginx.org/en/docs/varindex.html)
- [[openresty]]
- 对照：[[caddy]]



## Learn
- [Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)，官方入门指南与基本架构
- [Understanding the Nginx Configuration File Structure and Contexts](https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-contexts)，配置上下文层级详解
- [Nginx Tuning For Best Performance](https://www.nginx.com/blog/tuning-nginx/)，官方性能调优指南



## Installation

### Ubuntu / Debian
- 发行版软件源：
  ```sh
  sudo apt update
  sudo apt install nginx
  sudo systemctl enable --now nginx
  ```
- 需要指定版本时再配置 [Official Nginx packages](https://nginx.org/en/linux_packages.html)，服务文件和目录布局可能与发行版软件包不同
- 检查版本与已编译模块：`nginx -V`

### macOS
- Homebrew：
  ```sh
  brew install nginx
  brew services start nginx
  ```
- 默认安装与配置前缀：Apple Silicon 为 `/opt/homebrew`，Intel 为 `/usr/local`；配置文件位于 `$(brew --prefix)/etc/nginx/nginx.conf`
- Homebrew 默认监听 8080，站点配置通常从 `$(brew --prefix)/etc/nginx/servers/` 加载，以本机 `nginx.conf` 为准



## Run/Stop
- Ubuntu / Debian：`sudo systemctl start/stop/restart/status nginx`，斜杠分隔的是可选操作
- macOS：`brew services start/stop/restart nginx`，修改配置用 Nginx 自己的 reload
- 先检查，再重载；失败时看错误日志，Nginx 通常会继续使用原配置：
  ```sh
  # systemd 托管的实例
  sudo nginx -t && sudo systemctl reload nginx
  # Homebrew 默认实例，不加 sudo
  nginx -t && nginx -s reload
  ```
  - `nginx -t`：检查语法，并尝试打开配置引用的文件；不验证后端是否健康
  - `nginx -T`：检查并输出磁盘上的配置及 include 内容，不是读取运行进程的内存配置；输出可能含敏感配置，不直接贴到公开位置
  - `nginx -V`：输出版本、编译参数和模块；`nginx -v` 只看版本
  - reload 启动新 worker，旧 worker 处理完已有请求后退出，通常不需要 restart
- 手动运行与信号控制（避免与系统服务混用）：
  - 指定配置文件启动：`nginx -c /path/to/nginx.conf`
  - 平滑退出：`nginx -s quit`（等待工作进程处理完当前请求后退出）
  - 快速停止：`nginx -s stop`（不等待已有请求完成）
  - 使用自定义 `-p` / `-c` 启动时，测试、reload、quit 也传相同参数，避免操作错实例

### Configuration Hierarchy
- 上下文层级关系：
  - `main`：全局指令（如 `worker_processes`, `pid`, `error_log`）
  - `events`：网络连接处理机制（如 `worker_connections`, `use epoll`）
  - `http`：HTTP 核心服务层（MIME 类型、日志格式、Gzip、upstream、map）
  - `server`：虚拟主机配置（`listen`, `server_name`, `ssl_certificate`）
  - `location`：请求 URI 路由与处理策略（反向代理、静态文件、重定向）
- 站点 include 与目录规范：
  - Debian/Ubuntu 传统模式使用 `sites-available/`（存放全部可用配置）与 `sites-enabled/`（仅存放启用的软链接），在 `nginx.conf` 中通过 `include /etc/nginx/sites-enabled/*;` 载入
  - 另一些软件包使用 `conf.d/*.conf`，沿用已安装的布局，不必另起一套
  - `server` 文件要由 `http` 块 include；不要把同一份站点同时放进 `conf.d` 和 `sites-enabled`，也不要直接 include `sites-available` 来绕过启用操作



## Quick start
- 在空目录下使用独立配置前台运行，不改系统配置；先确认 8080 没被已有服务占用
  ```sh
  mkdir -p /tmp/nginx-local-demo/site
  cd /tmp/nginx-local-demo
  printf '<h1>Hello Nginx Local</h1>\n' > site/index.html
  ```
- 创建独立配置文件 `nginx.local.conf`（设置日志与临时文件可写目录，`daemon off;` 便于前台观察与 Ctrl+C 退出）：
  ```nginx
  daemon off;
  worker_processes 1;
  pid ./nginx.pid;
  error_log ./error.log warn;

  events {
      worker_connections 1024;
  }

  http {
      access_log ./access.log;
      client_body_temp_path ./client_body_temp;
      proxy_temp_path ./proxy_temp;
      fastcgi_temp_path ./fastcgi_temp;
      uwsgi_temp_path ./uwsgi_temp;
      scgi_temp_path ./scgi_temp;
      types { text/html html; }

      server {
          listen 127.0.0.1:8080;
          server_name localhost;

          location / {
              root ./site;
              index index.html;
          }
      }
  }
  ```
- 相对路径按 `-p` 指定的前缀解析。先检查再启动，在另一终端验证：
  ```sh
  nginx -p "$PWD/" -c nginx.local.conf -t
  # 前台运行，Ctrl+C 退出
  nginx -p "$PWD/" -c nginx.local.conf

  # 另开终端验证
  curl -i http://127.0.0.1:8080/
  ```



## Configuration
- 以下片段按场景选择，不是全部粘在一起。`server` 放在 `http` 内，`location` 放在 `server` 内。替换域名 `example.com`、静态目录 `/srv/www/example` 和后端 `127.0.0.1:9000`

### Static Site & SPA
- 普通静态站：找不到文件返回 404；主配置的 `http` 块保留软件包自带的 `include mime.types;`，避免 CSS / JavaScript 类型不正确
  ```nginx
  server {
      listen 80;
      server_name example.com;
      root /srv/www/example;
      index index.html;

      location / {
          try_files $uri $uri/ =404;
      }
  }
  ```
- SPA（单页应用）：前端路由接管，文件不存在时回退到 `index.html`
  ```nginx
  server {
      listen 80;
      server_name example.com;
      root /srv/www/example;
      index index.html;

      # API 不参与前端页面回退，保留 /api/ 前缀
      location = /api { return 308 /api/; }
      location /api/ {
          proxy_pass http://127.0.0.1:9000;
          proxy_http_version 1.1;
          proxy_set_header Host $host;
      }

      location / {
          try_files $uri $uri/ /index.html;
      }
  }
  ```

### Reverse Proxy
- 放在 `server` 中，反代本地应用。以下假设 Nginx 是客户端直接访问的第一层代理：
  ```nginx
  location / {
      proxy_pass http://127.0.0.1:9000;
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $remote_addr;
      proxy_set_header X-Forwarded-Proto $scheme;
  }
  ```
- 上例覆盖客户端传入的 `X-Forwarded-For`，后端只信任来自这台 Nginx 的转发头，并限制后端端口的访问来源
- 多层代理才考虑 `$proxy_add_x_forwarded_for`，它会追加地址而非清洗整条链；不能直接把最左侧值当真实 IP
- 前置 CDN / 负载均衡时，按其文档配置 [realip](https://nginx.org/en/docs/http/ngx_http_realip_module.html) 的受信 IP 段、头字段及递归规则；外部 HTTPS 在前置层终止时，Nginx 的 `$scheme` 可能已是 `http`

### proxy_pass URI Trailing Slash
- 下面两种 `location /api/` 二选一，不能同时放进同一个 `server`；这里比较的是普通前缀 location、未额外 rewrite 的情况：
  ```nginx
  # 场景 A：无尾部 URI，原样转发请求路径（保留 /api/ 前缀）
  # 请求 /api/v1/users -> 后端接收 /api/v1/users
  location /api/ {
      proxy_pass http://127.0.0.1:9000;
  }

  # 场景 B：有尾部 URI（此处为 /），去除匹配前缀（剥离 /api/）
  # 请求 /api/v1/users -> 后端接收 /v1/users
  location /api/ {
      proxy_pass http://127.0.0.1:9000/;
  }
  ```
- 正则 location 或命名 location 中不能直接使用带 URI 部分的 `proxy_pass`。需要改路径时另用 `rewrite`，不要把普通前缀 location 的替换规则套过去

### WebSocket & SSE
- WebSocket 要显式转发升级头；`map` 放在 `http` 中，下面的 `location` 放在目标 `server` 中：
  ```nginx
  # 置于 http 块中
  map $http_upgrade $connection_upgrade {
      default upgrade;
      ''      close;
  }

  # 置于 server 块中
  location /ws {
      proxy_pass http://127.0.0.1:9000;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      proxy_set_header Host $host;
      proxy_read_timeout 3600s;
  }
  ```
- SSE 若出现事件攒在一起才到达，检查应用是否及时 flush、响应缓冲和压缩。以下 `location` 关闭代理响应缓冲；应用也可返回 `X-Accel-Buffering: no`：
  ```nginx
  location /events/ {
      proxy_pass http://127.0.0.1:9000;
      proxy_http_version 1.1;
      proxy_set_header Connection '';
      proxy_buffering off;
      proxy_cache off;
  }
  ```



## HTTPS
- 以下两个 `server` 放在 `http` 中。先准备覆盖 `example.com`、`www.example.com` 的证书和私钥，再加载配置；私钥不能放进站点根目录
  ```nginx
  # HTTP 自动跳转 HTTPS
  server {
      listen 80;
      listen [::]:80;
      server_name example.com www.example.com;
      return 301 https://$host$request_uri;
  }

  # HTTPS 虚拟主机
  server {
      listen 443 ssl;
      listen [::]:443 ssl;
      server_name example.com www.example.com;

      ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
      ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

      ssl_protocols TLSv1.2 TLSv1.3;
      ssl_session_cache shared:SSL:10m;
      ssl_session_timeout 1d;
      ssl_session_tickets off;

      root /srv/www/example;
      index index.html;

      location / {
          try_files $uri $uri/ =404;
      }
  }
  ```
- 需要 HTTP/2 时，Nginx 1.25.1+ 可在 HTTPS `server` 加 `http2 on;`；旧版用 `listen 443 ssl http2;`，并确认编译了 HTTP/2 模块
- 证书获取与续期用 [Certbot](https://certbot.eff.org/) 等 ACME 客户端。先确认 DNS、验证端口及选用的验证方式；上面的配置本身不会签发证书
- 使用 Certbot 的 Nginx installer 时可自动部署证书；仅用 `certonly` / webroot 时需配置成功续期后的 deploy hook，如 `nginx -t && systemctl reload nginx`。按 [续期说明](https://eff-certbot.readthedocs.io/en/stable/using.html#renewing-certificates) 检查定时任务和 hook，不只看磁盘文件日期



## Logs
- 常见路径，以配置里的 `access_log` / `error_log` 为准；本地示例写入工作目录：
  - Ubuntu / Debian：`/var/log/nginx/access.log`、`/var/log/nginx/error.log`
  - macOS (Homebrew)：`$(brew --prefix)/var/log/nginx/access.log`、`error.log`
- 实时看请求与错误：`sudo tail -f /var/log/nginx/access.log /var/log/nginx/error.log`；日志可能含 URL 参数等业务数据，注意权限与轮转
- systemd 服务排查启动与重载错误：
  - 查看最近错误输出：`sudo journalctl -u nginx -e --no-pager`
  - 查看本次开机完整日志：`sudo journalctl -u nginx -b`
- 自定义 JSON 访问日志格式（置于 `http` 块）：
  ```nginx
  log_format json_combined escape=json
      '{"time_local":"$time_iso8601",'
      '"client_ip":"$remote_addr",'
      '"remote_user":"$remote_user",'
      '"request":"$request",'
      '"status": "$status",'
      '"body_bytes_sent":"$body_bytes_sent",'
      '"request_time":"$request_time",'
      '"http_referrer":"$http_referer",'
      '"http_user_agent":"$http_user_agent"}';

  access_log /var/log/nginx/access.log json_combined;
  ```
- 联调排查技巧（无需改动本地 hosts 或远程 DNS 解析）：
  - 指定 Host 请求头直连 IP 测试虚拟主机路由：
    ```sh
    curl -v -H "Host: example.com" http://127.0.0.1/
    ```
  - 使用 `--resolve` 参数强制定向域名到指定 IP 及端口：
    ```sh
    curl -v --resolve example.com:443:127.0.0.1 https://example.com/
    ```



## FAQs
- 访问始终显示默认页面或新配置不生效
  - 核对请求的 Host、监听端口和 `server_name`；未匹配域名的请求会落到该监听地址的默认 server，不是默认站点优先于一切
  - 检查主配置文件中是否包含目标配置文件的目录（如 `include /etc/nginx/conf.d/*.conf;`）
  - 用 `sudo nginx -T` 确认磁盘配置被 include，再检查 reload 结果和日志；它不能证明运行中的 worker 已加载新配置
- 403 Forbidden 权限拒绝
  - 禁止粗暴使用 `chmod 777`。Nginx 工作进程用户（Debian/Ubuntu 默认为 `www-data`）必须对静态资源路径下的所有上级父目录拥有执行权限（`+x`），对目标文件拥有读取权限（`+r`）
  - 目录中没有可用的 index 文件且未开启目录列表时也会报 403；不要为解决缺文件而随意启用 `autoindex`
  - 参考：[How to Solve 13: Permission denied browse for file in nginx centos](https://caradede.blogspot.com/2017/12/how-to-solve-13-permission-denied.html)
- 502 Bad Gateway 与 504 Gateway Timeout
  - `502`：连接拒绝、后端提前断开或响应无效等。先 `curl -v http://127.0.0.1:9000/`，再对照 error log；Unix socket 还要看属主和权限
  - `504`：连接或等待后端响应超时。`proxy_read_timeout` 是两次读取之间的等待上限，不是整个请求时限；先查后端耗时，不要只加大 timeout
- 413 Request Entity Too Large
  - 客户端请求体大小超出限制。Nginx 默认 `client_max_body_size` 仅为 `1m`
  - 需在 `http`、`server` 或对应文件上传的 `location` 中按需调大，例如 `client_max_body_size 50m;`
- 端口冲突 `bind() to 0.0.0.0:80 failed (98: Address already in use)`
  - Linux 用 `sudo ss -ltnp 'sport = :80'`，macOS 用 `sudo lsof -nP -iTCP:80 -sTCP:LISTEN`
  - 确认进程属于哪个服务，再通过其服务管理器处理；Nginx 与 Caddy 不能同时占用同一个地址端口
- 性能优化参考：
  - [Nginx性能优化的那些事](https://cloud.tencent.com/developer/article/1151168)



## Resources
- [Nginx Resources](https://github.com/fcambus/nginx-resources): A collection of resources covering Nginx, Nginx + Lua, OpenResty and Tengine
- [NGINX Documentation](https://nginx.org/en/docs/)：官方指令与模块参考手册
- [Mozilla SSL Configuration Generator](https://ssl-config.mozilla.org/)：Mozilla 官方 Web 服务器安全 TLS 配置生成器
- [Certbot](https://certbot.eff.org/)：ACME 证书申请与续期工具
