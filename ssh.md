The [Secure Shell Protocol](https://en.wikipedia.org/wiki/Secure_Shell) (SSH Protocol) is a cryptographic network protocol for operating network services securely over an unsecured network.[1] Its most notable applications are remote login and command-line execution.

- [[linux]]


## Learn
- :star:[SSH 教程](https://wangdoc.com/ssh/index.html)


## Common
- 远程连接：`ssh -p12345 root@xxx.xxx.xxx.xxx`, 其中 12345 为端口，无 `-p` 选项则为默认 22 端口


## SSH Key
- ssh key 免密连接配置
  - 生成密钥对 `ssh-keygen -t rsa -P ''`
  - 将公钥 `id_rsa.pub` 内容，写入远端文件 `~/.ssh/authorized_keys`
    - 可使用 `ssh-copy-id [-i ~/.ssh/id_rsa.pub] root@xxx.xxx.xxx.xxx` 自动写入
  - 修改本地文件 `~/.ssh/config` (没有则创建), 按如下格式添加内容，其中 Port 默认为 22 
    ```shell
    Host Xsvr
    HostName 172.217.31.238
    Port 12345
    User root
    IdentityFile ~/.ssh/id_rsa
    ```
  - 即可远端别名登录 `ssh Xsvr`


## SSH Config
- 禁止密码登录（仅 RSA key 登录更安全）`vi /etc/ssh/sshd_config`
  - `PasswordAuthentication no`
  - `service sshd restart`/`systemctl restart ssh`


## SSH Tunnel
- 创建 SSH 账号，仅供打开 SSH 隧道使用，禁止其登录服务器
  - adduser --shell /usr/sbin/nologin some_tunnel_user
- 创建仅能访问服务器某目录的用户
  - docker run -d --name log_reader_jail --restart always -v /root/logs:/logs:ro -w /logs ubuntu:22.04 tail -f /dev/null
  - 创建用户 `someone`，并设置其密码
    ```shell
    useradd -m -s /bin/bash someone
    passwd someone
    ```
  - `vi /etc/ssh/sshd_config` 末尾添加如下内容，令 `someone` 用户登录后直接进入 docker 容器的 bash 环境
    ```shell
    Match User someone
      ForceCommand docker exec -it log_reader_jail /bin/bash
    ```
  - systemctl restart sshd


## SSH Port Forwarding
- [ssh 鲜为人知的三种用法](https://www.yanxurui.cc/posts/tool/2017-07-14-ssh-port-forward/)
  - `vi /etc/ssh/sshd_config` 打开 `GatewayPorts yes`
  - 远程端口转发至本地端口 `ssh -N -R [REMOTE_BIND:]REMOTE_PORT:LOCAL_IP:LOCAL_PORT user@remote_host`
- [使用 SSH TUNNEL 打通公司和家里的网络](https://www.jianshu.com/p/388a93b1e7f7)
- [linux管理多个ssh公钥密钥](https://blog.csdn.net/qq_23827747/article/details/54986905)


## FAQs
- SSH Broken pipe
  ```sh
  # vi /etc/ssh/sshd_config (server side)
  ClientAliveInterval 10
  ClientAliveCountMax 6
  ```
- [HowTo: Disable SSH Host Key Checking](https://www.shellhacks.com/disable-ssh-host-key-checking/)
  ```sh
  Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  ```
- [How to Keep SSH Session Alive](https://linuxiac.com/how-to-keep-ssh-session-alive/)


## Tools
- [Mosh](https://github.com/mobile-shell/mosh) is a remote terminal application that supports intermittent connectivity, allows roaming, and provides speculative local echo and line editing of user keystrokes. It aims to support the typical interactive uses of SSH, plus ... https://mosh.org/
  - Mosh will log the user in via SSH, then start a connection on a UDP port between 60000 and 61000.
  - install `mosh` on both client and server side. 
  - let server `ufw allow 60000:61000/udp` and run mosh-server.
- [GlobalSSH](https://docs.ucloud.cn/pathx/globalssh) 是一款致力于提高跨国远程管理服务器效率的产品，旨在解决由于跨国网络不稳定导致的远程管理出现的卡顿、连接失败、传输速度较慢等现象。本产品可极大程度的减少卡顿、连接失败的情况发生，提高运维工作的效率。
