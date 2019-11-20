- [Awesome Linux](https://github.com/aleksandar-todorovic/awesome-linux), A list of awesome projects and resources that make Linux even more awesome
- 本页wiki大部分基础内容也适用于其他类Unix系统：[[BSD]], [[macOS]]


## Learn
- [The Linux Command Line](http://billie66.github.io/TLCL/)
- [Linux工具快速教程](https://github.com/me115/linuxtools_rst)
- [Linux命令大全](https://man.linuxde.net/)



## Shell
- [bash cheatsheet](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/bash.sh), [中文速查表](https://github.com/skywind3000/awesome-cheatsheets/blob/master/languages/bash.sh)
- [Shell脚本编程30分钟入门](https://github.com/qinjx/30min_guides/blob/master/shell.md)
- [pure sh bible](https://github.com/dylanaraps/pure-sh-bible)
- [pure bash bible](https://github.com/dylanaraps/pure-bash-bible)
- [Shell 脚本传参方法总结](https://www.jianshu.com/p/d3cd36c97abc)
  ```shell
  echo $0    # 当前脚本的文件名（间接运行时还包括绝对路径）。
  echo $n    # 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1 。
  echo $#    # 传递给脚本或函数的参数个数。
  echo $*    # 传递给脚本或函数的所有参数。
  echo $@    # 传递给脚本或函数的所有参数。被双引号 (" ") 包含时，与 $* 不同，下面将会讲到。
  echo $?    # 上个命令的退出状态，或函数的返回值。
  echo $$    # 当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。
  echo $_    # 上一个命令的最后一个参数
  echo $!    # 后台运行的最后一个进程的 ID 号
  ```


## Shortcuts
- ctrl + w 往回删除一个单词，光标放在最末尾
- ctrl + u 删除光标以前的字符
- ctrl + k 删除光标以后的字符
- ctrl + a 移动光标至的字符头
- ctrl + e 移动光标至的字符尾
- ctrl + l 清屏


## Common
- `whatis XXX`
  ```
  whatis whatis
    whatis (1)           - display one-line manual page descriptions
  whatis df
    df (1)               - report file system disk space usage
  whatis du
    du (1)               - estimate file space usage
  whatis free
    free (1)             - Display amount of free and used memory in the system
  ```
- Package Manager
  - Ubuntu:`apt update`
  - CentOS:`yum update`



## System Infomation
- 查询 CPU 信息
  - 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数
  - 查看物理CPU个数
    - `cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l`
  - 查看每个物理CPU中core的个数(即核数)
    - `cat /proc/cpuinfo| grep "cpu cores"| uniq`
  - 查看逻辑CPU的个数
    - `cat /proc/cpuinfo| grep "processor"| wc -l`
  - 查看是否为超线程，如 `cpu cores` 数量和 `siblings` 一致，则未启用超线程
    - `cat /proc/cpuinfo | grep -e "cpu cores"  -e "siblings" | sort | uniq`




## File 
- [Linux shell 之 提取文件名和目录名的一些方法](https://blog.csdn.net/ljianhui/article/details/43128465)
- `lsof -i:80` lsof is a command meaning "list open files", which is used in many Unix-like systems to report a list of all open files and the processes that opened them. 
### du
- `du -had1` 以 human readable 格式，浏览当前目录，所有文件及文件夹大小
### cp
- `cp -r xxx/. yyy/` 递归拷贝xxx至yyy，含隐藏文件
### tar
- `tar -zcvf xxx.tar.gz [FILE]...`
  -  -z ：压缩类型为 .tar.gz
  -  -c ：打包 (建立压缩档案)
  -  -v ：显示过程
  -  -f ：指定打包后的文件名
- `tar -zxvf xxx.tar.gz`
  -  -z ：解压缩类型为 .tar.gz
  -  -x ：解压
  -  -v ：显示过程
  -  -f ：指定打包后的文件名
### find
- https://man.linuxde.net/find
### links
- Linux链接分两种，一种被称为硬链接（Hard Link），另一种被称为符号链接（Symbolic Link）。默认情况下，ln命令产生硬链接。
  - 硬连接指通过索引节点来进行连接。在Linux的文件系统中，保存在磁盘分区中的文件不管是什么类型都给它分配一个编号，称为索引节点号(Inode Index)。在Linux中，多个文件名指向同一索引节点是存在的。一般这种连接就是硬连接。硬连接的作用是允许一个文件拥有多个有效路径名，这样用户就可以建立硬连接到重要文件，以防止“误删”的功能。其原因如上所述，因为对应该目录的索引节点有一个以上的连接。只删除一个连接并不影响索引节点本身和其它的连接，只有当最后一个连接被删除后，文件的数据块及目录的连接才会被释放。也就是说，文件真正删除的条件是与之相关的所有硬连接文件均被删除。
  - 软连接，也叫符号连接（Symbolic Link）。软链接文件有类似于Windows的快捷方式。它实际上是一个特殊的文件。在符号连接中，文件实际上是一个文本文件，其中包含的有另一文件的位置信息。
  ```shell
  touch f1          # 创建一个测试文件f1
  ln f1 f2          # 创建f1的一个硬连接文件f2
  ln -s f1 f3       # 创建f1的一个符号连接文件f3
  ls -li            # -i参数显示文件的inode节点信息
  # 1). 删除符号连接f3,对f1,f2无影响；
  # 2). 删除硬连接f2，对f1,f3也无影响；
  # 3). 删除原文件f1，对硬连接f2没有影响，导致符号连接f3失效；
  # 4). 同时删除原文件f1,硬连接f2，整个文件会真正的被删除。
  ```
- [理解 Linux 的硬链接与软链接](https://www.ibm.com/developerworks/cn/linux/l-cn-hardandsymb-links/index.html)



## Hostname
- `hostname XXXX` 临时修改主机名为 XXXX
- `vi /etc/hostname` 永久修改主机名
- `vi /etc/cloud/cloud.cfg` 将 `preserve_hostname` 为 `true`
- `vi /etc/hosts` 添加新主机名回环地址映射



## User
- 修改用户密码：
  + 修改当前用户密码：passwd
  + 用root修改某个用户密码：passwd username
- 添加用户：adduser username
- 添加root权限：usermod -g root username



## SSH
- 远程连接：`ssh -p12345 root@xxx.xxx.xxx.xxx`
  - 其中 12345 为端口，无 `-p` 选项则为默认 22 端口。
- ssh copy 文件至远端 `scp -P12345 xx.txt root@xxx.xxx.xxx.xxx:~/` 
  - 注意此处指定端口与 ssh 不同，需要大写 `-P`
- ssh key 免密连接配置
  - 生成 ssh key `ssh-keygen -t rsa -P ''`
  - 将公钥 `id_rsa.pub` 内容，写入远端文件 `~/.ssh/authorized_keys`
    - 可使用 `ssh-copy-id root@xxx.xxx.xxx.xxx` 自动写入
- ssh 设置远端别名
  - 修改本地文件 `~/.ssh/config` (没有则用 `touch` 创建), 按如下格式添加内容，其中 Port 默认为 22 
    ```
    Host Xsvr
    HostName 172.217.31.238
    Port 12345
    User root
    IdentityFile ~/.ssh/id_rsa
    ```
  - 即可 `ssh Xsvr`
- [ssh免密码登录](http://chenlb.iteye.com/blog/211809)
- [SSH设置别名访问远程服务器](http://blog.csdn.net/xlgen157387/article/details/50282483)  
- [linux管理多个ssh公钥密钥](https://blog.csdn.net/qq_23827747/article/details/54986905)
- [VPS 防止 SSH 暴力登录尝试攻击](http://www.lovelucy.info/vps-anti-ssh-login-attempts-attack.html)



## Firewall
### iptables
- [iptables 添加，删除，查看，修改](http://blog.51yip.com/linux/1404.html)

### ufw
- `ufw allow ssh` 生效前最好先放行 ssh
- `ufw enable`
- `ufw allow 80`
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
- 创建用户 `useradd -d /var/www/html -M XXXnewuser`



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



## Top
- [top](https://www.cnblogs.com/peida/archive/2012/12/24/2831353.html)
  - 1 切换显示各逻辑CPU状况
  - c 切换显示各进程完整命令行
  - x 高亮排序属性列
  - SHIFT + '<' / '>' 左右切换排序列
  - M 按内存占用率排序
  - P 按CPU占用率排序



## Service 
- http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html



## Schedule
- 添加开机启动脚本：修改/etc/rc.d/rc.local，最后添加脚本命令。  
  再修改它为可执行：chmod a+x /etc/rc.d/rc.local 
- [定时任务crontab](http://www.cnblogs.com/peida/archive/2013/01/08/2850483.html)



## GUI
- [Centos 7图形化与安装中文支持与修改时区方法](https://www.wanghailin.cn/centos-7-install-desktop-timezone/)  
  注：其中安装中文语言包的命令应为 yum install kde-l10n-Chinese

