[Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) is a [[Linux]] distribution based on Debian and composed mostly of free and open-source software.

- https://ubuntu.com



## Common
- Debian/Ubuntu: `apt update`
  ```bash
  dpkg –l | grep package # 查询deb包的详细信息，没有指定包则显示全部已安装包
  dpkg -s package        # 查看已经安装的指定软件包的详细信息
  dpkg -L package        # 列出一个包安装的所有文件清单
  dpkg -S file           # 查看系统中的某个文件属于哪个软件包,搜索已安装的软件包
  dpkg -i                # 安装指定deb包
  dpkg -R                # 后面加上目录名，用于安装该目录下的所有deb安装包
  dpkg -r                # remove，移除某个已安装的软件包
  dpkg -P                # 彻底的卸载，包括软件的配置文件
  dpkg -c                # 查询deb包文件中所包含的文件
  dpkg -L                # 查看系统中安装包的的详细清单，同时执行 -c
  ```



## Service 
- [Ubuntu Service系统服务说明与使用方法](http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html)



## [UFW](https://help.ubuntu.com/community/UFW)
- `ufw allow ssh` 生效前最好先放行 ssh
- `ufw enable`  生效，执行后，未 allow 的端口均无法访问
- `ufw status [numbered]` 列出状态(规则列表）[是否加上编号以便删除]
- `ufw allow 80`  允许端口外部访问
- `ufw allow xxx:yyy/tcp` 开放 [xxx, yyy] 端口范围
- `ufw allow from 192.168.0.1` 允许特定 ip 访问全部端口
- `ufw allow from 192.168.0.1 to any port 80`  允许特定 ip 访问指定端口
- `ufw deny 80`    禁止端口外部访问
- `ufw delete XXX` 删除指定规则（其中 XXX 为之前 ufw 后跟的表达式）



# FAQ
- 默认账号 ubuntu, `sudo passwd` 设置 root 密码
