The [MySQL](https://www.mysql.com)™ software delivers a very fast, multithreaded, multi-user, and robust SQL (Structured Query Language) database server. MySQL Server is intended for mission-critical, heavy-load production systems as well as for embedding into mass-deployed software. 

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL 5.7 Reference Manual](https://dev.mysql.com/doc/refman/5.7/en/)
- [[TiDB]]



## Learn
- [Complete list of new features in MySQL 5.7](https://www.thecompletelistoffeatures.com/)



## Practice
- [MySQL运维笔记](https://www.cnblogs.com/kevingrace/category/796278.html)
- [Linux运维菜 - MySQL](http://www.opcai.top/categories/mysql/)
- [mysql中的慢查询日志](https://www.css3er.com/p/238.html)
  - 慢查询日志分析工具（mysqldumpslow）
  - 使用Show Profile进行分析
- [值75亿美金的GitHub都不用分布式，你的数据库也不需要](https://mp.weixin.qq.com/s/FJOzK-REUduFzH84Z1kFrQ)
  - [Partitioning GitHub’s relational databases to handle scale](https://github.blog/2021-09-27-partitioning-githubs-relational-databases-scale/)



## Installation

### Ubuntu
- `apt update && apt install mysql-server`

### CentOS
- [CentOS 7 安装 Mysql5.5 或自定义版本 RPM 方式](https://my.oschina.net/u/3767256/blog/1647976)
- [Install MySQL on CentOS 7 Operating System](https://linuxconcept.com/install-mysql-on-centos-7-operating-system/)
- [centos7 MySQL 数据库安装和配置](http://www.cnblogs.com/starof/p/4680083.html)  
- 下载 mysql 的 repo 源，安装 mysql-community-release
  - `wget https://dev.mysql.com/get/mysql57-community-release-el7.rpm`
  - `rpm -ivh mysql57-community-release-el7.rpm && yum install mysql-server`
- 启动/停止/重启 `service mysqld start/stop/restart`
- 关闭强密码验证 `vi /etc/my.cnf` 添加 `validate-password=OFF` 至末尾，如已开启需重启
- 获取临时密码 `grep "temporary password" /var/log/mysqld.log`
- 连接 `mysql -uroot -p` 修改密码，并允许远程连接
  ```sql
  use mysql;
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'XXX_NEW_PASSWORD';
  update user set host = '%' where user = 'root';
  flush privileges;
  ```
- 使用 [firewall-cmd](linux#firewall-cmd) 开放端口
  - `firewall-cmd --zone=public --add-port=3306/tcp --permanent`



## Run/Stop
- As a service 
  - RPM package platforms `service mysql {start|stop|restart|status}`
  - Debian package platforms `systemctl {start|stop|restart|status} mysqld`
- Command line
  - Run `mysqld/mysqld_safe &`
  - Stop `mysqladmin -uroot -p shutdown`

### configuration
- [interactive_timeout 和 wait_timeout](http://www.cnblogs.com/jiunadianshi/articles/2475475.html)
- 开启binlog：配置文件中设置 `log-bin=mysql-bin`
- 查找配置文件路径 `mysqld --verbose --help |grep -A 1 'Default options'`



## User
- 创建用户：
  ```sql
  CREATE USER 'user'@'host' IDENTIFIED BY 'pwd';
  CREATE USER 'user'@'%' IDENTIFIED BY 'pwd'; -- 全部主机
  CREATE USER 'user'@'localhost' IDENTIFIED BY 'pwd'; -- 本地登陆
  CREATE USER 'user'@'192.168.1.101' IDENTIFIED BY 'pwd'; -- 指定主机
  ```
- 删除用户：
  ```sql
  DROP USER 'user'@'%';
  DROP USER 'user'@'host';
  ```
- 修改密码: `$ mysql -u root`
  ```sql
  use mysql;
  SET PASSWORD = PASSWORD('pwd');  -- 修改当前登陆用户密码
  update user set plugin="mysql_native_password";  -- mysql5.7+ required
  update user set authentication_string=password('pwd') where user='root';
  flush privileges;
  ```
- 使用 `mysqladmin` 修改密码: `$ mysqladmin -u root password -p`

### Privileges
- 权限列表：http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html
- 查询权限：`show grants for root@'localhost';`
- 修改数据库权限
  ```sql
  -- 全部权限
  GRANT ALL ON *.* TO 'user'@'%' IDENTIFIED BY 'pwd';
  -- 该用户可以给其他用户授权
  GRANT privileges ON db.tbl TO 'user'@'host' IDENTIFIED BY 'pwd' WITH GRANT OPTION;
  -- 特定权限
  GRANT SELECT,UPDATE,INSERT,DELETE ON testdb.* TO 'user'@'host' IDENTIFIED BY 'pwd';
  ```
- 取消权限
  ```sql
  REVOKE privilege ON databasename.tablename FROM 'user'@'host';
  REVOKE SELECT ON testdb.* FROM 'user'@'localhost'; 
  ```
- 允许远程访问
  ```sql
  use mysql;
  update user set host = '%' where user = 'XXX';
  ```
- :star:以上均需刷新生效：`flush privileges;`



## Optimization
- [MySQL 性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)
- [MySQL Optimal Configuration Template](https://github.com/jdaaaaaavid/mysql_best_configuration)
  - [mysql-5.7 配置文件 参数优化](https://www.cnblogs.com/cenliang/p/8110473.html)
- [MySQL 5.7 Performance Tuning After Installation](https://www.percona.com/blog/2016/10/12/mysql-5-7-performance-tuning-immediately-after-installation/) - [zh-CN](https://www.cnblogs.com/glon/p/6497377.html)

### [Storage engine](https://en.wikipedia.org/wiki/Database_engine)
- [为什么你要用 InnoDB, 而不是 MyISAM ？](https://juejin.im/post/5c43ee36518825254b5a3c3a) 
- [MyISAM 和 InnoDB 区别和应用场景](https://www.jianshu.com/p/dc60346d55a2)
- [MyISAM](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html)
  - 读取性能极佳
  - 不支持行锁(只有表锁)，不支持事务，不支持外键，不支持崩溃后的安全恢复
  - 不推荐使用（除非需执行大量 SELECT 查询）
- [InnoDB](https://dev.mysql.com/doc/refman/8.0/en/innodb-introduction.html)
  - 支持行锁，采用 MVCC 来支持高并发，但有可能死锁；
  - 支持事务；支持外键；支持崩溃后的安全恢复；支持全文索引（MySQL 5.6+）
  - 推荐使用（MySQL 5.5+ 默认）

### InnoDB
- [MySQL Performance: InnoDB Buffers & Directives](https://www.liquidweb.com/kb/mysql-performance-innodb-buffers-directives/)
- [What is a big innodb_log_file_size?](https://www.percona.com/blog/2016/05/31/what-is-a-big-innodb_log_file_size/)
- [优化 MySQL：3 个简单的小调整](https://linux.cn/article-9325-1.html) —— 调整关键配置(20%)，可得到 80% 性能提升，:star:[Pareto principle](https://en.wikipedia.org/wiki/Pareto_principle)
  1. 所有表使用 innodb 引擎
  2. 加大 `innodb_buffer_pool_size`，最大可使用物理机器的 70%
  3. 设置 `innodb_buffer_pool_instances` 来分割 `innodb_buffer_pool_size`，以提高并发性
- [MySQL性能调优 – 你必须了解的15个重要变量](https://www.centos.bz/2016/11/mysql-performance-tuning-15-config-item/)
  - `innodb_buffer_pool_size` 最重要
- [MySQL Innodb 并发涉及参数](https://www.cnblogs.com/xinysu/p/6439715.html)
  - 当并发用户线程数量小于 64，建议设置 `innodb_thread_concurrency=0` (保持默认不变)
- Config example:
  ```conf
  # Ubuntu18.04LTS, CPU16核心, 32G内存为例，同时运行其他业务
  # vi /etc/mysql/mysql.conf.d/mysqld.cnf
  max_allowed_packet = 256M
  max_connections = 1024
  wait_timeout = 600
  # 慢查询日志
  slow_query_log = 1
  # default is /var/lib/mysql/xxx-slow.log
  slow_query_log_file = /var/log/mysql/mysql-slow.log
  log_queries_not_using_indexes = 1
  log_timestamps = system
  # InnoDB 相关
  innodb_buffer_pool_size = 16G
  innodb_buffer_pool_instances = 8
  innodb_read_io_threads = 10
  innodb_write_io_threads = 6
  innodb_log_file_size = 2G
  ```

### [Alternative malloc library](https://dev.mysql.com/doc/refman/5.7/en/mysqld-safe.html#option_mysqld_safe_malloc-lib)
- [Configuring systemd for MySQL](https://dev.mysql.com/doc/refman/5.7/en/using-systemd.html#systemd-mysql-configuration)
- [Migrating from mysqld_safe to systemd](https://dev.mysql.com/doc/refman/5.7/en/using-systemd.html#mysqld-safe-to-systemd-migration)

#### [jemalloc](https://github.com/jemalloc/jemalloc) OR [tcmalloc](https://github.com/google/tcmalloc)/[gperftools](https://github.com/gperftools/gperftools)
- `apt install libjemalloc-dev` / `apt install google-perftools`
  - `mkdir -p /etc/systemd/system/mysql.service.d` / `systemctl edit mysql`
  - `vi /etc/systemd/system/mysql.service.d/override.conf` 
    ```conf
    [Service]
    Environment="LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so"
    # OR 
    Environment="LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc.so.4"
    ```
  - `systemctl daemon-reload`
  - `service mysql restart`
- [How to check the memory allocator used by my mysql 5.7.20](https://dba.stackexchange.com/questions/226684/how-to-check-the-memory-allocator-used-by-my-mysql-5-7-20)
  - `lsof -p $(pidof mysqld) | grep mem`
  - `lsof -n |grep jemalloc`
- Compile and install jemalloc ❌ Not recommend!
  <details>
  <summary markdown="span"> View details </summary>

  - [安装 jemalloc for mysql](https://www.cnblogs.com/DataArt/p/9978187.html)
  - `git clone https://github.com/jemalloc/jemalloc`
  - `cd jemalloc & git checkout master`
  - `./autogen.sh && ./configure && make && make install`
  - `cp /usr/local/lib/libjemalloc.* /usr/lib/`
  - run mysqld with jemalloc
    - `export LD_PRELOAD=/usr/lib/libjemalloc.so && mysqld &`
  - FAQ
    - `mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld`
  </details>



## Backup/Restore
- [解锁 MySQL 备份恢复的 4 种正确姿势](https://dbaplus.cn/news-11-1267-1.html)

### bin-log
- [Binlog 日志使用总结](https://www.cnblogs.com/kevingrace/p/6065088.html)
- [利用 mysql 的 binlog 恢复数据](http://orangeholic.iteye.com/blog/1698736)
- [关于 binary log 那些事](https://www.cnblogs.com/xinysu/p/6607658.html)

### [mysqldump](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
- [Mysqldump 备份说明及数据库备份脚本分享](https://www.cnblogs.com/kevingrace/p/9403353.html)
- [基于 mysqldump 做备份恢复](https://jkzhao.github.io/2018/04/21/%E5%9F%BA%E4%BA%8Emysqldump%E5%81%9A%E5%A4%87%E4%BB%BD%E6%81%A2%E5%A4%8D/)

### [mysqlpump](https://dev.mysql.com/doc/refman/5.7/en/mysqlpump.html)
  - [mysqlpump 使用说明](https://www.cnblogs.com/kevingrace/p/9760185.html)

### [xtrabackup](https://www.percona.com/software/mysql-database/percona-xtrabackup)
- [Percona XtraBackup 2.4 Documentation](https://www.percona.com/doc/percona-xtrabackup/2.4/index.html)
  - Percona XtraBackup is a set of following tools:
  - `innobackupex` is the symlink for xtrabackup. innobackupex still supports all features and syntax as 2.2 version did, but is now **deprecated** and will be removed in next major release.
  - `xtrabackup` a compiled C binary that provides functionality to backup a whole MySQL database instance with MyISAM, InnoDB, and XtraDB tables.
  - `xbcrypt` utility used for encrypting and decrypting backup files.
  - `xbstream` utility that allows streaming and extracting files to/from the xbstream format.
  - `xbcloud` utility used for downloading and uploading full or part of xbstream archive from/to cloud.
  - After Percona XtraBackup 2.3 release the recommend way to take the backup is using the xtrabackup script. More information on script options can be found in [how to use xtrabackup](https://www.percona.com/doc/percona-xtrabackup/2.4/xtrabackup_bin/xtrabackup_binary.html).
- [xtrabackup 备份 - 原理与应用](https://blog.csdn.net/fanren224/article/details/79693863)
- [热备工具 Xtrabackup 简介](http://www.opcai.top/post/2019-04/mysql_xtrabackup/)
  - [xtrabackup 安装及使用](http://www.opcai.top/post/2019-04/mysql_xtrabackup_install_use/)
- [使用 percona xtraback 实施物理备份](https://www.jianshu.com/p/af4260de624a)
- [Xtrabackup 备份还原](https://www.centos.bz/2018/08/mysql-xtrabackup%e5%a4%87%e4%bb%bd%e8%bf%98%e5%8e%9f/)
  - [Xtrabackup 备份和恢复应用](https://www.centos.bz/2018/06/mysql%E4%B8%AD-xtrabackup%E5%A4%87%E4%BB%BD%E5%92%8C%E6%81%A2%E5%A4%8D%E5%BA%94%E7%94%A8/), shell 自动化
  - [从 Xtrabackup 完整备份中恢复单个表](https://www.centos.bz/2018/12/mysql%E5%A4%87%E4%BB%BD%E6%81%A2%E5%A4%8D%EF%BC%9A%E4%BB%8Extrabackup%E5%AE%8C%E6%95%B4%E5%A4%87%E4%BB%BD%E4%B8%AD%E6%81%A2%E5%A4%8D%E5%8D%95%E4%B8%AA%E8%A1%A8/)
- innobackupex - DEPRECATED
  - [innobackupex 备份工具使用总结](http://www.fordba.com/mysql-innobackupex-usage-explain.html)
  - [innobackupex 备份恢复+增量备份与恢复](https://cloud.tencent.com/developer/article/1119183)



## [Replication](https://dev.mysql.com/doc/refman/5.7/en/replication.html)
- [Mysql 主从复制配置 单向/双向](https://liguoqinjim.com/post/mysql/mysql%E4%B8%BB%E4%BB%8E%E5%A4%8D%E5%88%B6%E9%85%8D%E7%BD%AE/)

### [Master-slave replication](https://github.com/donnemartin/system-design-primer#master-slave-replication)
- [搭建 MySQL 5.7.19 主从复制，以及复制实现细节分析](https://segmentfault.com/a/1190000010867488)
- [MySQL 5.7 基于 GTID 的主从复制实践](https://www.hi-linux.com/posts/47176.html)
- [MySQL 主从备份配置](https://www.jianshu.com/p/1eed312e83bf)
- [MySQL 主从复制架构使用方法](https://www.cnblogs.com/huchong/p/10253522.html)、
- [MySQL 主从复制——主库已有数据的解决方案](https://www.cnblogs.com/songwenjie/p/9376719.html)
- [3 分钟解决 MySQL 1032 主从错误](https://cloud.tencent.com/developer/article/1564571)

### [Master-master replication](https://github.com/donnemartin/system-design-primer#master-slave-replication)
- [MySQL双主（主主）架构方案](https://blog.51cto.com/ygqygq2/1870864)
- [MySQL主主复制架构使用方法](https://www.cnblogs.com/huchong/p/10262620.html)



## [Sharding](https://en.wikipedia.org/wiki/Shard_(database_architecture))
- [system-design-primer - sharding](https://github.com/donnemartin/system-design-primer#sharding)
- [这四种情况下，才是考虑分库分表的时候！](https://segmentfault.com/a/1190000038944473)
- [三分钟理解分库分表](https://zhuanlan.zhihu.com/p/136963357)



## Tools
- [mycli](https://github.com/dbcli/mycli): A command line client for MySQL that can do auto-completion and syntax highlighting.
- [phpMyAdmin](https://github.com/phpmyadmin/phpmyadmin): A web interface for MySQL and MariaDB.
- [Sequel Ace](https://github.com/Sequel-Ace/Sequel-Ace) is the "sequel" to longtime macOS tool [Sequel Pro](https://github.com/sequelpro/sequelpro). Sequel Ace is a fast, easy-to-use Mac database management application for working with MySQL & MariaDB databases.
- [Querious](https://www.araelium.com/querious): THE BEST MYSQL TOOL FOR MACOS
- See also: [database tools](database#tools)



## FAQs
- [Lost connection to MySQL server at 'reading initial communication packet](http://stackoverflow.com/questions/3578147/mysql-error-2013-lost-connection-to-mysql-server-at-reading-initial-communic)  
- [Ubuntu 开启 mysql 远程连接](https://dzer.me/2016/05/04/ubuntu-%E5%BC%80%E5%90%AFmysql%E8%BF%9C%E7%A8%8B%E8%BF%9E%E6%8E%A5/)   
  ```sh
  vi /etc/mysql/mysql.conf.d/mysqld.cnf
    #bind-address = 127.0.0.1
  service mysql restart
  ```
- [Cenos7 MySQL ERROR 1044 (42000):Access denied for user ''@'localhost' to databa... ](https://my.oschina.net/u/4414000/blog/4097869)
- [ERROR 1698 (28000): Access denied for user 'root'@'localhost' at Ubuntu 18.04](https://askubuntu.com/questions/1029177/error-1698-28000-access-denied-for-user-rootlocalhost-at-ubuntu-18-04)
  - [Change user password in MySQL 5.7 with “plugin: auth_socket”](https://www.percona.com/blog/2016/03/16/change-user-password-in-mysql-5-7-with-plugin-auth_socket/)
  - If you install 5.7 and don’t provide a password to the root user, it will use the auth_socket plugin.
- [[Resolved] When I faced “#1273 – Unknown collation: ‘utf8mb4_0900_ai_ci'” Error](https://www.freakyjolly.com/resolved-when-i-faced-1273-unknown-collation-utf8mb4_0900_ai_ci-error/)
  - `utf8mb4_0900_ai_ci` --> `utf8mb4_general_ci`.
- [Truncate Slow Query Log in MySQL](https://stackoverflow.com/questions/577339/truncate-slow-query-log-in-mysql)
  - `> /var/lib/mysql/XXX-slow.log`
- [Did your logging stop working after you set up logrotate? Then this post might be for you.](https://www.percona.com/blog/2014/11/12/log-rotate-and-the-deleted-mysql-log-file-mystery/)
- [MySQL 获取行数](https://www.jianshu.com/p/0636e13c26c8)
  ```sh
  mysql -h$MYHOST -P$MYPORT -u$MYUSER -p$MYPWD -N -e "SELECT table_name, table_rows FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$DBNAME'"
  ```



## Resources
- [awesome-mysql](https://github.com/shlomi-noach/awesome-mysql): A curated list of awesome MySQL software, libraries, tools and resources
- [MySQL 资源大全中文版](https://github.com/jobbole/awesome-mysql-cn)，分析工具、备份、性能测试、配置、部署、GUI 等

