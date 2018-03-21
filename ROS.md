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