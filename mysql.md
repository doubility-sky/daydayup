## [MySQL](https://www.mysql.com)
- [MySQL Documentation](https://dev.mysql.com/doc/)



## 用户
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
  SET PASSWORD FOR 'root'@'%' = PASSWORD('000000'); 
  SET PASSWORD = PASSWORD('000000');  --设置当前登陆用户
  ```



## 权限
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



## 参数
- [interactive_timeout和wait_timeout](http://www.cnblogs.com/jiunadianshi/articles/2475475.html)
- 开启binlog：配置文件中设置 `log-bin=mysql-bin`
- 查找配置文件路径 `mysqld --verbose --help |grep -A 1 'Default options'`



## bin-log
- [利用mysql的binlog恢复数据](http://orangeholic.iteye.com/blog/1698736)
- [mysql的binlog详解](http://blog.csdn.net/wyzxg/article/details/7412777)



## 备份/还原
- [mysqldump](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
  - [Mysqldump备份说明及数据库备份脚本分享](https://www.cnblogs.com/kevingrace/p/9403353.html)
  - [基于mysqldump做备份恢复](https://jkzhao.github.io/2018/04/21/%E5%9F%BA%E4%BA%8Emysqldump%E5%81%9A%E5%A4%87%E4%BB%BD%E6%81%A2%E5%A4%8D/)
- [mysqlpump](https://dev.mysql.com/doc/refman/5.7/en/mysqlpump.html)
  - [mysqlpump 使用说明](https://www.cnblogs.com/kevingrace/p/9760185.html)
- [解锁MySQL备份恢复的4种正确姿势](https://dbaplus.cn/news-11-1267-1.html)
- [mysql备份还原方案xtrabackup](https://coding3min.com/mysql-backup-xtrabackup/)



## 引擎
- [为什么你要用 InnoDB, 而不是 MyISAM ？](https://juejin.im/post/5c43ee36518825254b5a3c3a) 
- [MyISAM和InnoDB区别和应用场景](https://www.jianshu.com/p/dc60346d55a2)
- [MyISAM](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html)
  - 读取性能极佳
  - 不支持行锁(只有表锁)，不支持事务，不支持外键，不支持崩溃后的安全恢复
  - 无特殊需求（需要执行大量的SELECT查询），不推荐使用
- [InnoDB](https://dev.mysql.com/doc/refman/8.0/en/innodb-introduction.html)
  - 支持行锁，采用MVCC来支持高并发，有可能死锁；支持事务；支持外键；支持崩溃后的安全恢复；支持全文索引（版本5.6以后）
  - 推荐使用



## 优化
- [MySQL性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)
#### 配置
- [MySQL Performance: InnoDB Buffers & Directives](https://www.liquidweb.com/kb/mysql-performance-innodb-buffers-directives/)
- [优化MySQL：3个简单的小调整](https://linux.cn/article-9325-1.html) —— 🌟[Pareto principle](https://en.wikipedia.org/wiki/Pareto_principle)（[帕累托法则](https://zh.wikipedia.org/wiki/%E5%B8%95%E7%B4%AF%E6%89%98%E6%B3%95%E5%88%99)、80/20原则、关键少数法则、八二法則），调整关键配置(20%)，可得到 80% 性能提升。
  1. 所有表使用 innodb 引擎
  2. 加大 `innodb_buffer_pool_size`，最大可使用物理机器的70%
  3. 设置 `innodb_buffer_pool_instances` 来分割 `innodb_buffer_pool_size`，以提高并发性
- [MySQL性能调优 – 你必须了解的15个重要变量](https://www.centos.bz/2016/11/mysql-performance-tuning-15-config-item/)
  - `innodb_buffer_pool_size` 最重要
- [MySQL Innodb 并发涉及参数](https://www.cnblogs.com/xinysu/p/6439715.html)
  - 当并发用户线程数量小于64，建议设置 `innodb_thread_concurrency=0` (保持默认不变)
- [MySQL参数优化](https://www.sqlpy.com/blogs/books/1/chapters/7/articles/14) 参数优化配置实例 
```shell
# Ubuntu18.04LTS, CPU16核心, 32G内存为例，同时运行其他业务
# vi /etc/mysql/mysql.conf.d/mysqld.cnf
max_allowed_packet = 256M
max_connections    = 1024
slow_query_log     = 1
innodb_buffer_pool_size = 8G
innodb_buffer_pool_instances = 8
innodb_log_file_size = 512M
innodb_read_io_threads = 8
innodb_write_io_threads = 8
```



## Article
- [MySQL运维笔记](https://www.cnblogs.com/kevingrace/category/796278.html)



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

