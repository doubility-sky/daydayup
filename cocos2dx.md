
# Cocos2dx-lua
- [mac下的开发环境搭建](http://sunhantao.github.io/2016/02/13/Mac%E4%B8%8B%E7%BC%96%E7%A0%81%E8%B0%83%E8%AF%95Cocos2dx-lua%E7%9A%84%E5%B7%A5%E5%85%B7/)

# Quick-Cocos2dx-Community

Quick-Cocos2dx是Cocos2dx-lua的增强版，封装了部分API更易于lua的开发。Quick官方稳定版本是Quick-3.3final，最新版是Quick-3.5，之后官方不再维护。Quick-Cocos2dx-Community是基于Quick-3.3final之上的社区版，现在版本是3.6.1release版，并持续维护。
- [官方网站](http://www.tairan.com/)
- [Quick资料总汇：介绍、教程](http://www.cocoachina.com/bbs/read.php?tid-331250.html)
- [pbc 集成到quick-cocos2dx](http://www.cnblogs.com/suncoolcat/p/3297313.html)
- [Quick和Luajit使用注意](http://tairan.com/archives/10561/)
- [Quick资源加密](http://tairan.com/archives/10157/) 注：非zip加密方式下(-m files)：AppDelegate.cpp 启动代码是
```
stack->executeString("require 'src.main'"); 
```
- [Quick使用webview](http://my.oschina.net/u/1582495/blog/465695) （注：目标目录是tools/tolua） 其他要导出的接口类似，操作过程中需要依赖的python组件安装参照[cocos2dx tolua说明](https://github.com/cocos2d/cocos2d-x/tree/c9306a053f051325a03b5297be7be6d645584780/tools/tolua)
- [Quick在iphone5s以上的ios64位下黑屏问题](http://www.cnblogs.com/yans/p/yans.html)

### quick心得(cocos v3.10, quick v3.6.1)
- 所有导出的C＋＋到lua的API：Quick-Cocos2dx-Community/cocos/scripting/lua-bindings/auto/api/*.lua
- TextField设置文本排列时，要靠设置锚点实现，用setTextHorizontalAlignment无效。靠左排列＝setAnchorPoint(0, 0.5)
- cocos studio中的AtlasLabel无法使用，用代码创建LabelAtlas代替。
- cocos studio中的BitmapLabel无法使用，暂未找到解决办法。

# Cocos Creator
- [官方教程](http://mp.weixin.qq.com/s?__biz=MjM5ODAxNTM2NA==&mid=409633776&idx=1&sn=926c49761ba2aa0368f21bd34ad3d9d3#rd)