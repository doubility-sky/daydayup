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
- 改表法：
```
update user set host = '%' where user = 'root';
```
- 修改数据库权限
GRANT privileges ON databasename.tablename TO 'username'@'host'; -- 该用户不能给其他用户授权
GRANT privileges ON databasename.tablename TO 'username'@'host' WITH GRANT OPTION; -- 该用户可以给其他用户授权
```
GRANT ALL ON *.* TO 'root'@'%';
GRANT SELECT,UPDATE,INSERT ON testdb.* TO 'test'@'localhost';
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

# 性能优化
- [MySQL性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)