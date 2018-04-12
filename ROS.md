ROS(Robot Operating System)是一个开源的机器人微操作系统，主要运行于ubuntu上。

# 官方网站
http://www.ros.org/

# 安装（按官方网站的安装步骤来）
## 在ubuntu上源码安装时，需要添加源
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-get update
sudo apt-upgrade

# 如果遇到no public key的错误，执行
sudo apt-get install debian-keyring debian-archive-keyring
``` 

# 资料
## 书
 - ROS官方记录的[书单](http://wiki.ros.org/Books)
 - 中文的一本书，简单上手，[下载链接](https://pan.baidu.com/s/1c3qunG8)

## blog
 - [古月居](http://www.guyuehome.com/)，作者研究ROS比较早

# 运动规划
## MoveIT(运动规划软件)
- 入门教程https://www.ncnynl.com/archives/201610/1028.html
- [MoveIt! 与 OMPL](https://blog.csdn.net/improve100/article/details/50619925)
## OMPL(运动规划库）主要采用采样随机规划算法