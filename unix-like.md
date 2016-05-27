# 搭建 CentOS 7 服务器环境

## User
- 修改用户密码：
  + 修改当前用户密码：passwd
  + 用root修改某个用户密码：passwd username
- 添加用户：adduser username
- 添加root权限：usermod -g root username

## SSH
mac/linux 远程连接命令类似： `ssh root@xxx.xxx.xxx.xxx`
- [ssh免密码登录](http://chenlb.iteye.com/blog/211809)
- [SSH设置别名访问远程服务器](http://blog.csdn.net/xlgen157387/article/details/50282483)  
修改本地文件 `~/.ssh/config` (没有则用命令 touch 创建)  
按如下格式添加内容 
```
Host rjn
HostName 114.55.26.144
User root
IdentitiesOnly yes
```
## Firewall
- [firewall防火墙教程](https://blog.linuxeye.com/406.html)
- [man firewall](https://fedoraproject.org/wiki/Features/FirewalldRichLanguage)
- 添加rule例子
```
#指定192.168.0.X可以连接8080, 10秒后失效
firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" port port="8080" protocol="tcp" accept' --timeout=10
#指定192.168.0.1不可以连接8080
firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="192.168.0.1" port port="8080" protocol="tcp|udp" reject'
#取消rule
firewall-cmd --permanent --zone=public --remove-rich-rule 'rule family="ipv4" source address="192.168.0.1" port port="8080" protocol="tcp|udp" reject'

## FTP
- [vsftp](http://www.krizna.com/centos/setup-ftp-server-centos-7-vsftp/)  
  注：Step2中备份不要用mv，用cp  
- [vsftpd允许root用户登录](http://blog.itpub.net/196700/viewspace-745364/)  
- [修改 vsftpd 的默认根目录](http://blog.chinaunix.net/uid-22141042-id-1789602.html)  

## MySQL
- [mysql](http://www.mamicode.com/info-detail-503994.html)  
- [打开mysql外网访问权限](http://www.cnblogs.com/ycsfwhh/archive/2012/08/07/2626597.html)  

## Screen
[linux screen 命令详解](http://www.cnblogs.com/mchina/archive/2013/01/30/2880680.html)  
Frequently Command:
```
screen -ls             列出当前所有的session
       -r <作业名称> 　  恢复离线的screen作业。
```
In Session Command:
```
C-a n -> Next，切换到下一个 window 
C-a p -> Previous，切换到前一个 window 
C-a d -> detach，暂时离开当前session，
        将目前的 screen session (可能含有多个 windows) 丢到后台执行，
        并会回到还没进 screen 时的状态，此时在 screen session 里，
        每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
```

## Shell & Script
- 添加开机启动脚本：修改/etc/rc.d/rc.local，最后添加脚本命令。  
  在修改它可执行：chmod a+x /etc/rc.d/rc.local 
- [定时任务crontab](http://www.cnblogs.com/peida/archive/2013/01/08/2850483.html)

## GUI
- [Centos 7图形化与安装中文支持与修改时区方法](https://www.wanghailin.cn/centos-7-install-desktop-timezone/)  
  注：其中安装中文语言包的命令应为 yum install kde-l10n-Chinese

## 其他
- [linux安装skynet问题总结](http://www.tuicool.com/articles/6JnAfar)
