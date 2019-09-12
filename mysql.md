# [MySQL](https://www.mysql.com)
- [MySQL Documentation](https://dev.mysql.com/doc/)

# 用户
- 创建用户：CREATE USER 'username'@'host' IDENTIFIED BY 'password'; 
```
CREATE USER 'test'@'localhost' IDENTIFIED BY '123456'; -- 本地登陆
CREATE USER 'test'@'192.168.1.101_' IDENTIFIED BY '123456';
CREATE USER 'test'@'%' IDENTIFIED BY '123456'; -- 全部主机
CREATE USER 'test'@'%';
```
- 删除用户：DROP USER 'username'@'host';
- 修改密码：
  + mysqladmin -u username password -p;
  + SET PASSWORD FOR 'username'@'host' = PASSWORD('newpassword');
  + 设置当前登陆用户：SET PASSWORD = PASSWORD('newpassword'); 
```
mysqladmin -u root password -p;
SET PASSWORD FOR 'root'@'%' = PASSWORD('000000'); 
SET PASSWORD = PASSWORD('000000'); 
```
# 权限
- 查询权限：
```
show grants for root@'localhost';
```
- 改表法：
```
update user set host = '%' where user = 'root';
```
- 修改数据库权限
  + GRANT privileges ON databasename.tablename TO 'username'@'host' IDENTIFIED BY 'mypassword'; -- 该用户不能给其他用户授权
  + GRANT privileges ON databasename.tablename TO 'username'@'host' IDENTIFIED BY 'mypassword' WITH GRANT OPTION; -- 该用户可以给其他用户授权
```
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT,DELETE ON testdb.* TO 'test'@'localhost' IDENTIFIED BY 'password';
```
- 刷新生效：
```
flush privileges;
```
- 取消权限
REVOKE privilege ON databasename.tablename FROM 'username'@'host';
```
REVOKE SELECT ON testdb.* FROM 'test'@'localhost'; 
```
- 权限列表：http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html

# 参数
- [interactive_timeout和wait_timeout](http://www.cnblogs.com/jiunadianshi/articles/2475475.html)
- 开启binlog：配置文件中设置log-bin=mysql-bin
- 查找配置文件路径
  ```
  mysqld --verbose --help |grep -A 1 'Default options'
  ```

# 性能优化
- [MySQL性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)

# bin-log
- [利用mysql的binlog恢复数据](http://orangeholic.iteye.com/blog/1698736)
- [mysql的binlog详解](http://blog.csdn.net/wyzxg/article/details/7412777)

# 备份
- [mysqldump](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
- [mysqlpump](https://dev.mysql.com/doc/refman/5.7/en/mysqlpump.html)
  - [mysqlpump 使用说明](https://www.cnblogs.com/kevingrace/p/9760185.html)

# FAQ
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



