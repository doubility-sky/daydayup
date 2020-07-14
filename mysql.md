The [MySQL](https://www.mysql.com)™ software delivers a very fast, multithreaded, multi-user, and robust SQL (Structured Query Language) database server. MySQL Server is intended for mission-critical, heavy-load production systems as well as for embedding into mass-deployed software. 



- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL 5.7 Reference Manual](https://dev.mysql.com/doc/refman/5.7/en/)



## Installation
- Ubuntu 16.04 +
  - `apt update && apt install mysql-server`
- [CentOS 7 安装 Mysql5.5 或自定义版本 RPM 方式](https://my.oschina.net/u/3767256/blog/1647976)
- [Install MySQL on CentOS 7 Operating System](https://linuxconcept.com/install-mysql-on-centos-7-operating-system/)
- [centos7 mysql数据库安装和配置](http://www.cnblogs.com/starof/p/4680083.html)  
  - 下载 mysql 的 repo 源
    `wget https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm`
  - 安装 mysql-community-release
    `sudo rpm -ivh mysql57-community-release-el7-8.noarch.rpm`
  - `sudo yum install mysql-server`
  - [辣鸡 CentOS](https://feng.si/posts/2019/07/centos-the-last-linux-distro-you-should-ever-consider/)，多此一举：
    - 获取临时密码 `grep "temporary password" /var/log/mysqld.log`
    - `mysql -uroot -p`
    - 执行任何操作前，必须修改密码。那你 TM 还让我获取个 JB 的临时密码？？？
    - 关闭强密码验证，WTF!
      - `vi /etc/my.cnf` 添加 `validate-password=OFF` 至末尾
    - `ALTER USER 'root'@'localhost' IDENTIFIED BY 'XXX_NEW_PASSWORD';`
  - `service mysqld restart`
  - 开放端口，使用 [firewall-cmd](linux#firewall-cmd) 或如下
    - `$ sudo vim /etc/sysconfig/iptables`
    - 添加以下内容  
      `-A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT`
    - `$ sudo service iptables restart`



## Run/Stop
- As a service 
  - RPM package platforms `service mysql {start|stop|restart|status}`
  - Debian package platforms `systemctl {start|stop|restart|status} mysqld`
- Command line
  - Run `mysqld/mysqld_safe &`
  - Stop `mysqladmin -uroot -p shutdown`

### Configuration
- [interactive_timeout和wait_timeout](http://www.cnblogs.com/jiunadianshi/articles/2475475.html)
- 开启binlog：配置文件中设置 `log-bin=mysql-bin`
- 查找配置文件路径 `mysqld --verbose --help |grep -A 1 'Default options'`




## User
- 创建用户：`CREATE USER 'username'@'host' IDENTIFIED BY 'password'; `
  ```
  CREATE USER 'test'@'localhost' IDENTIFIED BY '123456'; -- 本地登陆
  CREATE USER 'test'@'192.168.1.101_' IDENTIFIED BY '123456';
  CREATE USER 'test'@'%' IDENTIFIED BY '123456'; -- 全部主机
  CREATE USER 'test'@'%';
  ```
- 删除用户：`DROP USER 'username'@'host';`
- 修改密码：
  ```
  mysqladmin -u root password -p;
  SET PASSWORD FOR 'root'@'%' = PASSWORD('123456'); 
  SET PASSWORD = PASSWORD('123456');  --设置当前登陆用户
  ```
- 修改密码
  ```
  $ mysql -u root
  mysql > use mysql;
  mysql > update user set password=password('123456') where user='root';
  mysql > exit;
  mysql > flush privileges;
  ```



## Privileges
- 权限列表：http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html
- 查询权限：`show grants for root@'localhost';`
- 改表法：`update user set host = '%' where user = 'root';`
- 修改数据库权限
  ```
  GRANT privileges ON databasename.tablename TO 'username'@'host' IDENTIFIED BY 'mypassword'; -- 该用户不能给其他用户授权
  GRANT privileges ON databasename.tablename TO 'username'@'host' IDENTIFIED BY 'mypassword' WITH GRANT OPTION; -- 该用户可以给其他用户授权
  GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password';
  GRANT SELECT,UPDATE,INSERT,DELETE ON testdb.* TO 'test'@'localhost' IDENTIFIED BY 'password';
  ```
- 取消权限
  ```
  REVOKE privilege ON databasename.tablename FROM 'username'@'host';
  REVOKE SELECT ON testdb.* FROM 'test'@'localhost'; 
  ```
- 刷新生效：`flush privileges;`
- 修改权限，允许远程访问
  ```
  use mysql;
  update user set host = '%' where user = 'root';
  flush privileges;
  ```



## Backup/Restore
- [解锁MySQL备份恢复的4种正确姿势](https://dbaplus.cn/news-11-1267-1.html)

#### bin-log
- [利用mysql的binlog恢复数据](http://orangeholic.iteye.com/blog/1698736)
- [mysql的binlog详解](http://blog.csdn.net/wyzxg/article/details/7412777)

#### [mysqldump](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
- [Mysqldump备份说明及数据库备份脚本分享](https://www.cnblogs.com/kevingrace/p/9403353.html)
- [基于mysqldump做备份恢复](https://jkzhao.github.io/2018/04/21/%E5%9F%BA%E4%BA%8Emysqldump%E5%81%9A%E5%A4%87%E4%BB%BD%E6%81%A2%E5%A4%8D/)

#### [mysqlpump](https://dev.mysql.com/doc/refman/5.7/en/mysqlpump.html)
  - [mysqlpump 使用说明](https://www.cnblogs.com/kevingrace/p/9760185.html)

#### [xtrabackup](https://www.percona.com/software/mysql-database/percona-xtrabackup)
- [Percona XtraBackup 2.4 Documentation](https://www.percona.com/doc/percona-xtrabackup/2.4/index.html)
  - Percona XtraBackup is a set of following tools:
  - `innobackupex` is the symlink for xtrabackup. innobackupex still supports all features and syntax as 2.2 version did, but is now **deprecated** and will be removed in next major release.
  - `xtrabackup` a compiled C binary that provides functionality to backup a whole MySQL database instance with MyISAM, InnoDB, and XtraDB tables.
  - `xbcrypt` utility used for encrypting and decrypting backup files.
  - `xbstream` utility that allows streaming and extracting files to/from the xbstream format.
  - `xbcloud` utility used for downloading and uploading full or part of xbstream archive from/to cloud.
  - After Percona XtraBackup 2.3 release the recommend way to take the backup is using the xtrabackup script. More information on script options can be found in [how to use xtrabackup](https://www.percona.com/doc/percona-xtrabackup/2.4/xtrabackup_bin/xtrabackup_binary.html).
- [xtrabackup备份 - 原理与应用](https://blog.csdn.net/fanren224/article/details/79693863)
- [热备工具Xtrabackup简介](http://www.opcai.top/post/2019-04/mysql_xtrabackup/)
  - [xtrabackup安装及使用](http://www.opcai.top/post/2019-04/mysql_xtrabackup_install_use/)
- [使用percona xtraback实施物理备份](https://www.jianshu.com/p/af4260de624a)
- [Xtrabackup备份还原](https://www.centos.bz/2018/08/mysql-xtrabackup%e5%a4%87%e4%bb%bd%e8%bf%98%e5%8e%9f/)
  - [Xtrabackup备份和恢复应用](https://www.centos.bz/2018/06/mysql%E4%B8%AD-xtrabackup%E5%A4%87%E4%BB%BD%E5%92%8C%E6%81%A2%E5%A4%8D%E5%BA%94%E7%94%A8/), shell 自动化
  - [从Xtrabackup完整备份中恢复单个表](https://www.centos.bz/2018/12/mysql%E5%A4%87%E4%BB%BD%E6%81%A2%E5%A4%8D%EF%BC%9A%E4%BB%8Extrabackup%E5%AE%8C%E6%95%B4%E5%A4%87%E4%BB%BD%E4%B8%AD%E6%81%A2%E5%A4%8D%E5%8D%95%E4%B8%AA%E8%A1%A8/)
- innobackupex - DEPRECATED
  - [innobackupex 备份工具使用总结](http://www.fordba.com/mysql-innobackupex-usage-explain.html)
  - [innobackupex备份恢复+增量备份与恢复](https://cloud.tencent.com/developer/article/1119183)



## Master-slave Replication
- [MySQL主从复制架构使用方法](https://www.cnblogs.com/huchong/p/10253522.html#_label0)
- 基于 bin-log
  - [MySQL主从备份配置](https://www.jianshu.com/p/1eed312e83bf)
  - [MySQL主从复制——主库已有数据的解决方案](https://www.cnblogs.com/songwenjie/p/9376719.html)
- 基于 GTID
  - [MySQL 5.7 基于 GTID 的主从复制实践](https://www.hi-linux.com/posts/47176.html)



## Storage Engine
- [为什么你要用 InnoDB, 而不是 MyISAM ？](https://juejin.im/post/5c43ee36518825254b5a3c3a) 
- [MyISAM和InnoDB区别和应用场景](https://www.jianshu.com/p/dc60346d55a2)
- [MyISAM](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html)
  - 读取性能极佳
  - 不支持行锁(只有表锁)，不支持事务，不支持外键，不支持崩溃后的安全恢复
  - 无特殊需求（需要执行大量的SELECT查询），不推荐使用
- [InnoDB](https://dev.mysql.com/doc/refman/8.0/en/innodb-introduction.html)
  - 支持行锁，采用MVCC来支持高并发，有可能死锁；支持事务；支持外键；支持崩溃后的安全恢复；支持全文索引（版本5.6以后）
  - 推荐使用

### InnoDB
- [MySQL Performance: InnoDB Buffers & Directives](https://www.liquidweb.com/kb/mysql-performance-innodb-buffers-directives/)
- [优化MySQL：3个简单的小调整](https://linux.cn/article-9325-1.html) —— :star:[Pareto principle](https://en.wikipedia.org/wiki/Pareto_principle)（[帕累托法则](https://zh.wikipedia.org/wiki/%E5%B8%95%E7%B4%AF%E6%89%98%E6%B3%95%E5%88%99)、80/20原则、关键少数法则、八二法則），调整关键配置(20%)，可得到 80% 性能提升。
  1. 所有表使用 innodb 引擎
  2. 加大 `innodb_buffer_pool_size`，最大可使用物理机器的70%
  3. 设置 `innodb_buffer_pool_instances` 来分割 `innodb_buffer_pool_size`，以提高并发性
- [MySQL性能调优 – 你必须了解的15个重要变量](https://www.centos.bz/2016/11/mysql-performance-tuning-15-config-item/)
  - `innodb_buffer_pool_size` 最重要
- [MySQL Innodb 并发涉及参数](https://www.cnblogs.com/xinysu/p/6439715.html)
  - 当并发用户线程数量小于64，建议设置 `innodb_thread_concurrency=0` (保持默认不变)
- [What is a big innodb_log_file_size?](https://www.percona.com/blog/2016/05/31/what-is-a-big-innodb_log_file_size/)
```shell
# Ubuntu18.04LTS, CPU16核心, 32G内存为例，同时运行其他业务
# vi /etc/mysql/mysql.conf.d/mysqld.cnf
max_allowed_packet = 256M
max_connections    = 1024
# 慢查询日志
slow_query_log     = 1
log_queries_not_using_indexes = 1
log_timestamps = system
# InnoDB 相关
innodb_buffer_pool_size = 16G
innodb_buffer_pool_instances = 8
innodb_read_io_threads = 10
innodb_write_io_threads = 6
innodb_log_file_size = 2G
```



## Optimize
- [MySQL性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)
- [MySQL Optimal Configuration Template](https://github.com/jdaaaaaavid/mysql_best_configuration)

### [Alternative malloc library](https://dev.mysql.com/doc/refman/5.7/en/mysqld-safe.html#option_mysqld_safe_malloc-lib)
- [Migrating from mysqld_safe to systemd](https://dev.mysql.com/doc/refman/5.7/en/using-systemd.html#mysqld-safe-to-systemd-migration)

#### [jemalloc](https://github.com/jemalloc/jemalloc)
- [安装 jemalloc for mysql](https://www.cnblogs.com/DataArt/p/9978187.html)
- [启动MySQL如何加载Jemalloc](https://my.oschina.net/lv96/blog/3176132)
- compile and install jemalloc
  - git clone https://github.com/jemalloc/jemalloc
  - `cd jemalloc & git checkout master`
  - `./autogen.sh && ./configure && make && make install`
  - `cp /usr/local/lib/libjemalloc.* /usr/lib/`
- run mysqld with jemalloc
  - `export LD_PRELOAD=/usr/lib/libjemalloc.so && mysqld &`
  - check it `lsof -n |grep jemalloc`
- FAQ
  - `mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld`



## Practice
- [MySQL运维笔记](https://www.cnblogs.com/kevingrace/category/796278.html)
- [Linux运维菜 - MySQL](http://www.opcai.top/categories/mysql/)



## FAQ
- [Lost connection to MySQL server at 'reading initial communication packet](http://stackoverflow.com/questions/3578147/mysql-error-2013-lost-connection-to-mysql-server-at-reading-initial-communic)  
  ```
  sudo vi /etc/mysql/my.cnf
  #bind-address = 127.0.0.1
  service mysql restart
  ```
- [Ubuntu 开启mysql远程连接](https://dzer.me/2016/05/04/ubuntu-%E5%BC%80%E5%90%AFmysql%E8%BF%9C%E7%A8%8B%E8%BF%9E%E6%8E%A5/)   
  ```
  sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf 
  #bind-address = 127.0.0.1
  service mysql restart  
  ```
- [Cenos7 MySQL ERROR 1044 (42000):Access denied for user ''@'localhost' to databa... ](https://my.oschina.net/u/4414000/blog/4097869)
- [ERROR 1698 (28000): Access denied for user 'root'@'localhost' at Ubuntu 18.04](https://askubuntu.com/questions/1029177/error-1698-28000-access-denied-for-user-rootlocalhost-at-ubuntu-18-04)
  - [Change user password in MySQL 5.7 with “plugin: auth_socket”](https://www.percona.com/blog/2016/03/16/change-user-password-in-mysql-5-7-with-plugin-auth_socket/)
  - If you install 5.7 and don’t provide a password to the root user, it will use the auth_socket plugin.
- [[Resolved] When I faced “#1273 – Unknown collation: ‘utf8mb4_0900_ai_ci'” Error](https://www.freakyjolly.com/resolved-when-i-faced-1273-unknown-collation-utf8mb4_0900_ai_ci-error/)
  - `utf8mb4_0900_ai_ci` --> `utf8mb4_general_ci`.
- [How to check the memory allocator used by my mysql 5.7.20](https://dba.stackexchange.com/questions/226684/how-to-check-the-memory-allocator-used-by-my-mysql-5-7-20)
  - `lsof -p $(pidof mysqld) | grep mem`
- [Truncate Slow Query Log in MySQL](https://stackoverflow.com/questions/577339/truncate-slow-query-log-in-mysql)
  - `> /var/lib/mysql/XXX-slow.log`
