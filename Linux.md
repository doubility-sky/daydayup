## Learn
- [The Linux Command Line](http://billie66.github.io/TLCL/)
- [Linux工具快速教程](https://github.com/me115/linuxtools_rst)
- [Shell脚本编程30分钟入门](https://github.com/qinjx/30min_guides/blob/master/shell.md)
- [pure bash bible](https://github.com/dylanaraps/pure-bash-bible)
- [跟我一起写Makefile](https://github.com/seisman/how-to-write-makefile)


## Common
- 包管理 Ubuntu:`apt update`, CentOS:`yum update`
- `cp -r xxx/. yyy/` 递归拷贝xxx至yyy，含隐藏文件
- `lsof -i:80` lsof is a command meaning "list open files", which is used in many Unix-like systems to report a list of all open files and the processes that opened them. 
- [Linux shell 之 提取文件名和目录名的一些方法](https://blog.csdn.net/ljianhui/article/details/43128465)
- `hostname XXXX` 临时修改主机名为 XXXX
  - `vi /etc/hostname` 永久修改主机名
  - `vi /etc/hosts` 添加新主机名回环地址映射
- [top 命令](https://www.cnblogs.com/peida/archive/2012/12/24/2831353.html)
  - 1 切换显示各逻辑CPU状况
  - c 切换显示各进程完整命令行
  - x 高亮排序属性列
  - SHIFT + '<' / '>' 左右切换排序列
  - M 按内存占用率排序
  - P 按CPU占用率排序


## User
- 修改用户密码：
  + 修改当前用户密码：passwd
  + 用root修改某个用户密码：passwd username
- 添加用户：adduser username
- 添加root权限：usermod -g root username


## Safe
- [VPS 防止 SSH 暴力登录尝试攻击](http://www.lovelucy.info/vps-anti-ssh-login-attempts-attack.html)


## SSH
- mac/linux 远程连接命令类似：`ssh -p 12345 root@xxx.xxx.xxx.xxx`
  - 其中 12345 为端口，无 `-p` 选项则为默认 22 端口。
  - ssh copy 文件至远端 `scp -P xx.txt root@xxx.xxx.xxx.xxx:~/` 注意 -P 为大写
- [ssh免密码登录](http://chenlb.iteye.com/blog/211809)
- [SSH设置别名访问远程服务器](http://blog.csdn.net/xlgen157387/article/details/50282483)  
  修改本地文件 `~/.ssh/config` (没有则用命令 touch 创建)  
  按如下格式添加内容，其中 Port 默认为 22 
  ```
  Host alias
  HostName 172.217.31.238
  Port 12345
  User root
  IdentityFile ~/.ssh/xxx_rsa
  ```
- [linux管理多个ssh公钥密钥](https://blog.csdn.net/qq_23827747/article/details/54986905)


## iptables
- [iptables 添加，删除，查看，修改](http://blog.51yip.com/linux/1404.html)



## Firewall
## ufw
- `ufw allow xxx:yyy/tcp` 开放 xxx 到 yyy 端口段
 
### firewall-cmd
- [firewall防火墙教程](https://blog.linuxeye.com/406.html)
- [man firewall](https://fedoraproject.org/wiki/Features/FirewalldRichLanguage)
- [CentOS 上的 FirewallD 简明指南](https://linux.cn/article-8098-1.html)
- [firewalld对指定IP开放指定端口的配置](http://blog.csdn.net/Qguanri/article/details/51673845)
- 添加rule例子
  ```
  # 指定192.168.0.X可以连接8080, 10秒后失效
  firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" port port="8080" protocol="tcp" accept' --timeout=10
  # 指定192.168.0.1不可以连接8080
  firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="192.168.0.1" port port="8080" protocol="tcp|udp" reject'
  # 取消rule
  firewall-cmd --permanent --zone=public --remove-rich-rule 'rule family="ipv4" source address="192.168.0.1" port port="8080" protocol="tcp|udp" reject'
  # 重启防火墙服务，令规则生效
  systemctl restart firewalld.service
  ```
- 应急模式，阻断或放开所有网络
  ```
  # 启动应急模式，阻止所有网络
  firewall-cmd --panic-on
  # 解除应急模式
  firewall-cmd --panic-off 
  ```

## FTP
- [vsftp](http://www.krizna.com/centos/setup-ftp-server-centos-7-vsftp/)  
  注：Step2中备份不要用mv，用cp  
- [vsftpd允许root用户登录](http://blog.itpub.net/196700/viewspace-745364/)  
- [修改 vsftpd 的默认根目录](http://blog.chinaunix.net/uid-22141042-id-1789602.html)  


## [[MySQL]]
- [centos7 mysql数据库安装和配置](http://www.cnblogs.com/starof/p/4680083.html)  
  - 下载mysql的repo源   
    `$ wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm`
  - 安装mysql-community-release-el7-5.noarch.rpm包  
    `$ sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm`
  - `$ sudo yum install mysql-server`
  - `$ service mysqld restart`
  - 开放端口，使用 firewall-cmd 或如下  
    - `$ sudo vim /etc/sysconfig/iptables`
    - 添加以下内容  
      `-A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT`
    - `$ sudo service iptables restart`
- 修改密码
    ```
    $ mysql -u root
    mysql > use mysql;
    mysql > update user set password=password('123456') where user='root';
    mysql > exit;
    ```
- 修改权限，允许远程访问
  ```
  use mysql;
  update user set host = '%' where user = 'root';
  flush privileges;
  ```

## screen
- [linux screen 命令详解](http://www.cnblogs.com/mchina/archive/2013/01/30/2880680.html)  
- Frequently Command:
  ```
  screen -ls             列出当前所有的session
         -r <作业名称> 　  恢复离线的screen作业。
  ```
- In Session Command:
  ```
  C-a n -> Next，切换到下一个 window 
  C-a p -> Previous，切换到前一个 window 
  C-a d -> detach，暂时离开当前session，
          将目前的 screen session (可能含有多个 windows) 丢到后台执行，
          并会回到还没进 screen 时的状态，此时在 screen session 里，
          每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
  ```
- [man screen](https://www.gnu.org/software/screen/manual/screen.html)


## [tmux](https://github.com/tmux/tmux)
与 screen 类似
- https://en.wikipedia.org/wiki/Tmux


## schedule
- 添加开机启动脚本：修改/etc/rc.d/rc.local，最后添加脚本命令。  
  再修改它为可执行：chmod a+x /etc/rc.d/rc.local 
- [定时任务crontab](http://www.cnblogs.com/peida/archive/2013/01/08/2850483.html)


## GUI
- [Centos 7图形化与安装中文支持与修改时区方法](https://www.wanghailin.cn/centos-7-install-desktop-timezone/)  
  注：其中安装中文语言包的命令应为 yum install kde-l10n-Chinese

