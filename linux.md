Linux (/ˈlinʊks/ (:sound:[listen](https://upload.wikimedia.org/wikipedia/commons/0/03/Linus-linux.ogg)) [LEEN-uuks](https://en.wikipedia.org/wiki/Help:Pronunciation_respelling_key) or /ˈlɪnʊks/ [LIN-uuks](https://en.wikipedia.org/wiki/Help:Pronunciation_respelling_key)) is a family of [open-source](https://en.wikipedia.org/wiki/Free_and_open-source_software) [Unix-like](https://en.wikipedia.org/wiki/Unix-like) operating systems based on the [Linux kernel](https://en.wikipedia.org/wiki/Linux_kernel), an [operating system kernel](https://en.wikipedia.org/wiki/Kernel_(computing)) first released on September 17, 1991, by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds). Linux is typically [packaged](https://en.wikipedia.org/wiki/Package_manager) in a [Linux distribution](https://en.wikipedia.org/wiki/Linux_distribution).



- 本页大部分内容也适用于其他 [Unix-like](https://en.wikipedia.org/wiki/Unix-like) 系统：[[BSD]], [[macOS]]
- [[shell]]
- [[OpenWrt]]



## Kernel
- [The Linux Kernel Archives](https://www.kernel.org/)
  - [HOWTO do Linux kernel development](https://www.kernel.org/doc/html/latest/process/howto.html), [zh-CN](https://www.kernel.org/doc/html/latest/translations/zh_CN/process/howto.html)
  - [Linux kernel coding style](https://www.kernel.org/doc/Documentation/process/coding-style.rst), [zh-CN](https://www.kernel.org/doc/html/latest/translations/zh_CN/process/coding-style.html)
- [linux-insides](https://github.com/0xAX/linux-insides) A book-in-progress about the linux kernel and its insides.
- [BCC](https://github.com/iovisor/bcc) - Tools for BPF-based Linux IO analysis, networking, monitoring, and more



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
- Date time
  - `date "+%Y-%m-%d %H:%M:%S"`
- Package Manager
  - CentOS:`yum update`
  - Debian/Ubuntu:`apt update`
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
- 进程信息树：`systemctl status PID`



## System 
- [neofetch](https://github.com/dylanaraps/neofetch): Fast, highly customisable system info script
  - `apt install neofetch`
- [6 Methods to check the Linux Kernel version running on your system](https://www.2daygeek.com/check-find-determine-running-installed-linux-kernel-version/)
  - `uname -a`
- [查看 Linux 发行版名称和版本号的 8 种方法](https://linux.cn/article-9586-1.html)
  - :star:`cat /etc/os-release`
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
- time zone switch
  - `cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime`
- `uptime`
  - [Linux Load Averages：什么是平均负载？](https://zhuanlan.zhihu.com/p/75975041)

### hostname
- `hostnamectl set-hostname XXXX`
- `hostname XXXX` 临时修改主机名为 XXXX
- `vi /etc/hostname` 永久修改主机名
  - `vi /etc/cloud/cloud.cfg` 将 `preserve_hostname` 为 `true`
  - `vi /etc/hosts` 添加新主机名回环地址映射

### [top](https://www.cnblogs.com/peida/archive/2012/12/24/2831353.html)
- 1 切换显示各逻辑CPU状况
- c 切换显示各进程完整命令行
- x 高亮排序属性列
- SHIFT + '<' / '>' 左右切换排序列
- M 按内存占用率排序
- P 按CPU占用率排序

### [htop](https://github.com/htop-dev/htop)
htop is an interactive system-monitor process-viewer and process-manager. It is designed as an alternative to the Unix program top

### [iftop](https://www.ex-parrot.com/pdw/iftop/)
iftop does for network usage what top(1) does for CPU usage. It listens to network traffic on a named interface and displays a table of current bandwidth usage by pairs of hosts. Handy for answering the question "why is our ADSL link so slow?".

### [glances](https://github.com/nicolargo/glances)
Glances is a cross-platform monitoring tool which aims to present a large amount of monitoring information through a curses or Web based interface. The information dynamically adapts depending on the size of the user interface.



## File 
- [Linux shell 之 提取文件名和目录名的一些方法](https://blog.csdn.net/ljianhui/article/details/43128465)
  ```shell
  echo dirname is $(dirname $file)
  echo filename is $(basename $file)
  echo extension is "${file##*.}"
  echo filename without ext "${file%.*}"
  ```
- `lsof -i:80` lsof is a command meaning "list open files", which is used in many Unix-like systems to report a list of all open files and the processes that opened them. 

### du
- `du -had1` 以 human readable 格式，浏览当前目录，所有文件及文件夹大小

### cp
- `cp -r xxx/. yyy/` 递归拷贝xxx至yyy，含隐藏文件

### [rsync](https://en.wikipedia.org/wiki/Rsync)
Similar to cp, rcp and scp, rsync requires the specification of a source and of a destination, of which at least one must be local.
- [rsync 用法教程](http://www.ruanyifeng.com/blog/2020/08/rsync.html)
  - `rsync -av SRC DEST` 将 SRC 内容递归复制到 DEST/SRC（不存在则创建）
  - `rsync -av SRC/ DEST` 将 SRC 内容递归复制到 DEST（不存在则创建）
  - `rsync -av SRC1 SRC2 ... SRCn DEST` 将 SRC1 ... SRCn 内容递归复制到 DEST/SRC1 ... DEST/SRCn（不存在则创建）
  - `rsync -av --exclude '.*' SRC/ DEST` 排除隐藏文件 `.*`
  - `rsync -av --exclude={'f1.txt','f2.txt'} SRC/ DEST` 多个排除选项
  - `rsync -av --include="*.txt" --exclude='f1.txt' SRC/ DEST` 指定复制规则，同时排除特定
  - `rsync -av --delete SRC/ DEST` 复制并删除 DEST 中，不存在于 SRC 中的文件（即：镜像同步）
- 用 ssh key 同步远程主机文件
  - `rsync -avzP -e "ssh -i ~/sshkey.pem" ubuntu@xx.xxx.xx.xxx:Projects/sample.csv ~/sample.csv`
- 设置 ssh config 后，操作基本同 [SCP](#SCP)，详见 [SSH](#SSH)
  - 例如：`rsync -av SRC REMOTE:/var/www/html`

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
- `tar -zxvf xxx.tar.gz -C ./dst/` 解压到指定**已存在目录** `dst`

### find
- https://man.linuxde.net/find
- 删除指定时间之前的文件\[夹\] （并约束递归深度）
  - `find . -maxdepth 1 -mtime +30 -exec rm -rf {} \;`

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



## User
- 修改用户密码：
  + 修改当前用户密码：passwd
  + 用root修改某个用户密码：passwd username
- 添加用户：adduser username
- 添加root权限：usermod -g root username
- 踢人 `who`/`w` then `pkill -kill -t XXX_TTY`



## [[networks]]

### [SSH](https://en.wikipedia.org/wiki/OpenSSH)
- [SSH 教程](https://wangdoc.com/ssh/index.html)
- 远程连接：`ssh -p12345 root@xxx.xxx.xxx.xxx`
  - 其中 12345 为端口，无 `-p` 选项则为默认 22 端口。
- ssh copy 文件至远端 `scp -P12345 xx.txt root@xxx.xxx.xxx.xxx:~/` 
  - 注意此处指定端口与 ssh 不同，需要大写 `-P`
- ssh key 免密连接配置
  - 生成密钥对 `ssh-keygen -t rsa -P ''`
  - 将公钥 `id_rsa.pub` 内容，写入远端文件 `~/.ssh/authorized_keys`
    - 可使用 `ssh-copy-id [-i ~/.ssh/id_rsa.pub] root@xxx.xxx.xxx.xxx` 自动写入
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
- 禁止密码登录（仅 RSA key 登录更安全）
  - `vi /etc/ssh/sshd_config`
  - `PasswordAuthentication no`
  - `service sshd restart`
- [ssh免密码登录](http://chenlb.iteye.com/blog/211809)
- [SSH设置别名访问远程服务器](http://blog.csdn.net/xlgen157387/article/details/50282483)  
- [linux管理多个ssh公钥密钥](https://blog.csdn.net/qq_23827747/article/details/54986905)
- [VPS 防止 SSH 暴力登录尝试攻击](http://www.lovelucy.info/vps-anti-ssh-login-attempts-attack.html)
- SSH Broken pipe
  ```sh
  # vi /etc/ssh/sshd_config (server side)
  ClientAliveInterval 10
  ClientAliveCountMax 6
  ```
- [Mosh](https://github.com/mobile-shell/mosh) is a remote terminal application that supports intermittent connectivity, allows roaming, and provides speculative local echo and line editing of user keystrokes. It aims to support the typical interactive uses of SSH, plus ... https://mosh.org/
  - Mosh will log the user in via SSH, then start a connection on a UDP port between 60000 and 61000.
  - install `mosh` on both client and server side. let server `ufw allow 60000:61000/udp`
- [GlobalSSH](https://docs.ucloud.cn/pathx/globalssh) 是一款致力于提高跨国远程管理服务器效率的产品，旨在解决由于跨国网络不稳定导致的远程管理出现的卡顿、连接失败、传输速度较慢等现象。本产品可极大程度的减少卡顿、连接失败的情况发生，提高运维工作的效率。

### [SCP](https://en.wikipedia.org/wiki/Secure_copy_protocol)
According to OpenSSH developers in April 2019, SCP is outdated, inflexible and not readily fixed; they recommend the use of more modern protocols like sftp and rsync for file transfer. https://www.openssh.com/txt/release-8.0
- 推荐使用 [rsync](#rsync)

## FTP
- [vsftp](http://www.krizna.com/centos/setup-ftp-server-centos-7-vsftp/)  
  注：Step2中备份不要用mv，用cp  
- [vsftpd允许root用户登录](http://blog.itpub.net/196700/viewspace-745364/)  
- [修改 vsftpd 的默认根目录](http://blog.chinaunix.net/uid-22141042-id-1789602.html)  
- 创建用户 `useradd -d /var/www/html -M ftpuser`
  - `passwd ftpuser`
  - `chown -R ftpuser /var/www/html`
- 命令行连接 `ftp [OPTION...] [HOST [PORT]]`

### netstat
- [查看当前所有tcp端口使用情况](https://blog.csdn.net/wade3015/article/details/90779669)：`netstat -ntlp`

### iptables
- [iptables 添加，删除，查看，修改](http://blog.51yip.com/linux/1404.html)

### [UFW](https://help.ubuntu.com/community/UFW)
- `ufw allow ssh` 生效前最好先放行 ssh
- `ufw enable`  生效，执行后，未 allow 的端口均无法访问
- `ufw status [numbered]` 列出状态(规则列表）[是否加上编号以便删除]
- `ufw allow 80`  允许端口外部访问
- `ufw allow xxx:yyy/tcp` 开放 [xxx, yyy] 端口范围
- `ufw allow from 192.168.0.1` 允许特定 ip 访问全部端口
- `ufw allow from 192.168.0.1 to any port 80`  允许特定 ip 访问指定端口
- `ufw deny 80`    禁止端口外部访问
- `ufw delete XXX` 删除指定规则（其中 XXX 为之前 ufw 后跟的表达式）

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



## [Terminal multiplexer](https://en.wikipedia.org/wiki/Terminal_multiplexer)

### [screen](https://www.gnu.org/software/screen/)
Screen is a full-screen window manager that multiplexes a physical terminal between several processes, typically interactive shells.
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

### [tmux](https://github.com/tmux/tmux)
[tmux](https://en.wikipedia.org/wiki/Tmux) is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.

### [Zellij](https://github.com/zellij-org/zellij)
[Zellij](https://en.wikipedia.org/wiki/Zellij) is a workspace aimed at developers, ops-oriented people and anyone who loves the terminal. At its core, it is a terminal multiplexer (similar to tmux and screen), but this is merely its infrastructure layer.



## Service 
- [Ubuntu Service系统服务说明与使用方法](http://www.mikewootc.com/wiki/linux/usage/ubuntu_service_usage.html)



## Schedule
- [定时任务crontab](http://www.cnblogs.com/peida/archive/2013/01/08/2850483.html)
- [如何在重启或启动时执行命令或脚本](https://zhuanlan.zhihu.com/p/145739918)
  - 添加脚本至 `/etc/rc.d/rc.local`，确保该文件有运行权限 `chmod a+x /etc/rc.d/rc.local`
    - [在Ubuntu 18.04 中设置开机自动执行脚本](https://blog.csdn.net/weicao1990/article/details/101121085)
  - 使用 `crontab -e` 添加
    - `@reboot (sleep 30; bash ~/xx.sh)`
    - 执行 `select-editor` 可重新选择编辑器
    - 也可以添加在 `/etc/crontab`，但是注意需要指定 user，如：`@reboot root (sleep 30; bash ~/xx.sh)`



## FAQs
- [服务器操作系统应该选择 Debian/Ubuntu 还是 CentOS？](https://www.zhihu.com/question/19599986/answer/26359309)
- [CentOS: 永远有多远就离它多远](https://feng.si/posts/2019/07/centos-the-last-linux-distro-you-should-ever-consider/)
- [在linux上做机器学习，请问centos和ubuntu有区别吗？](https://www.zhihu.com/question/334455564)
  - TensorFlow 用 Ubuntu
- [Linux 配置 history 命令显示操作时间、用户和登录 IP](https://blog.csdn.net/m0_37886429/article/details/78520434)
  ```bash
  export HISTSIZE=4096
  export HISTFILESIZE=$HISTSIZE
  USER_IP=`who -u am i 2>/dev/null| awk '{print $NF}'|sed -e 's/[()]//g'`
  if [ -z $USER_IP ]; then
    USER_IP=`hostname`
  fi
  export HISTTIMEFORMAT="%F %T $USER_IP:`whoami` "
  ```



## Resources
- [Awesome Linux](https://github.com/aleksandar-todorovic/awesome-linux), A list of awesome projects and resources that make Linux even more awesome
- [ArchWiki](https://wiki.archlinux.org/)

