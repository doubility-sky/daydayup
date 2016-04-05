# CentOS 7 搭建服务器环境

## 用户
- 修改用户密码：
  + 修改当前用户密码：passwd
  + 用root修改某个用户密码：passwd username
- 添加用户：adduser username
- 添加root权限：usermod -g root username

## 安装软件
- [Centos 7图形化与安装中文支持与修改时区方法](https://www.wanghailin.cn/centos-7-install-desktop-timezone/) 注：其中安装中文语言包的命令应为 yum install kde-l10n-Chinese
- 安装FTP：[vsftp](http://www.krizna.com/centos/setup-ftp-server-centos-7-vsftp/) 注：Step2中备份不要用mv，用cp
- 安装mysql：[mysql](http://www.mamicode.com/info-detail-503994.html)

## 安装skynet相关问题
- [linux安装skynet问题总结](http://www.tuicool.com/articles/6JnAfar)

## 其他
- 添加开机启动脚本：修改/etc/rc.d/rc.local，最后添加脚本命令。在修改它可执行：chmode a+x /etc/rc.d/rc.local