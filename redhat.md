[Red Hat Linux](https://en.wikipedia.org/wiki/Red_Hat_Linux) was a widely used commercial open-source Linux distribution created by Red Hat until its discontinuation in 2004.

- https://www.redhat.com




### [firewall-cmd](https://fedoraproject.org/wiki/Features/FirewalldRichLanguage)
- [CentOS 上的 FirewallD 简明指南](https://linux.cn/article-8098-1.html)
- 启动/开机启动 
  - `systemctl start firewalld` / `systemctl enable firewalld`
- 停止/禁用 
  - `systemctl stop firewalld` / `systemctl disable firewalld`
- 查看状态 
  - `firewall-cmd --state`
- 开放指定端口 
  - `firewall-cmd --zone=public --add-port=12345/tcp --permanent`
- 关闭指定端口 
  - `firewall-cmd --zone=public --remove-port=12345/tcp --permanent`
- 查看配置
  - `firewall-cmd --zone=public --list-all`
  - `firewall-cmd --list-all-zones` 所有区域的配置
- 端口转发 local:80 => local:12345
  - `firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=12345` 
- 转发远程主机 local:80 => 123.456.78.9:8080
  - `firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=123.456.78.9` 
  - 在需要的区域中激活 masquerade `firewall-cmd --zone=public --add-masquerade`
  - 删除规则 `firewall-cmd --zone=public --remove-masquerade`
- 应急模式，阻断或放开所有网络 
  - `firewall-cmd --panic-on` / `firewall-cmd --panic-off`
- :star:令修改生效（重新加载 FirewallD 配置） `firewall-cmd --reload`
- Rich Rules
  ```bash
  # 允许来自指定远程主机的所有 IPv4 流量
  firewall-cmd --zone=public --add-rich-rule 'rule family="ipv4" source address=123.456.78.9 accept'
  # 拒绝来自指定主机到 22 端口的 IPv4 的 TCP 流量
  firewall-cmd --zone=public --add-rich-rule 'rule family="ipv4" source address=123.456.78.9 port port=22 protocol=tcp reject'
  # 允许来自指定主机到 80 端口的 IPv4 的 TCP 流量，并将流量转发到 6532 端口上
  firewall-cmd --zone=public --add-rich-rule 'rule family=ipv4 source address=123.456.78.9 forward-port port=80 protocol=tcp to-port=6532'
  # 移除相应 rich rule 
  firewall-cmd --zone=public --remove-rich-rule '... XXXX ...'
  ```
