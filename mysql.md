# 权限
- 修改密码：mysqladmin -u root password -p;
- 修改远程连接权限：
  + 改表法： 
```
update user set host = '%' where user = 'root';
```
  + 任意主机连接：
```
grant all privileges on *.* to 'root'@'%' identified by '123456' with grant option;
```
  + 特定IP连接：
```
grant all privileges on *.* to 'root'@'192.168.1.3' identified by '123456' with grant option;
```
  + 修改后用命令刷新：
```
flush privileges;
```
  
                  

# 性能优化
- [MySQL性能优化总结](http://www.cnblogs.com/luxiaoxun/p/4694144.html)