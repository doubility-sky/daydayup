- 其他类Unix系统通用功能，见 [[Linux]]


## Common
- CPU infomation
  - `sysctl -a | sort | grep cpu`
  - `sysctl -n hw.ncpu`


## Tools
- [tree 命令，终端展示你的目录树结构](http://yijiebuyi.com/blog/c0defa3a47d16e675d58195adc35514b.html)
- [OS X 磁盘空间分析工具: ncdu](http://www.yewen.us/blog/2015/09/ncdu-on-os-x/)
  - `brew install ncdu`
  - `ncdu / --exclude /Volumes`
- https://github.com/sindresorhus/quick-look-plugins


## Projects
- https://github.com/jaywcjlove/awesome-mac
- https://github.com/iCHAIT/awesome-macOS
- https://github.com/nikitavoloboev/my-mac-os
- https://github.com/serhii-londar/open-source-mac-os-apps



## FAQ
- 选中多个文件 `command+option+i` 查看总大小
- [Mac的最大连接数限制和端口的相关参数的设置](http://tinylee.info/mac-maxfiles-portrange.html)
- [让终端走代理的几种方法](https://blog.fazero.me/2015/09/15/%E8%AE%A9%E7%BB%88%E7%AB%AF%E8%B5%B0%E4%BB%A3%E7%90%86%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E6%B3%95/)
- 网络编程 macOS 总是弹出防火墙链接确认
    - https://github.com/codegangsta/gin/issues/12#issuecomment-40519008
    - [Suppressing Accept Incoming Network Connections warnings on OSX](https://medium.com/@leeprovoost/suppressing-accept-incoming-network-connections-warnings-on-osx-7665b33927ca)