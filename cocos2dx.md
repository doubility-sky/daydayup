- http://cocos2d.org/
- https://www.cocos.com/
- [Cocos 资料大全](https://github.com/fusijie/Cocos-Resource)



## [cocos2d-x](https://github.com/cocos2d/cocos2d-x)
#### Cocos Studio
- **注意！官方已不再维护，目前最后一个版本为 3.10**
- Mac上卡死问题 http://forum.cocos.com/t/cocosstudio/41214  
  ```
    打开HOST文件 加入 127.0.0.1 cs.ucenter.appget.cn  
    host文件在 /etc/hosts  
  ```



## [Cocos Creator](https://github.com/cocos-creator)
- https://www.cocos.com/creator

#### Learn
- [Cocos Creator 用户手册](https://docs.cocos.com/creator/manual/zh/)
- [cocos-creator/tutorial-first-game](https://github.com/cocos-creator/tutorial-first-game), Quick start game for Cocos Creator
- [cocos-creator/example-cases](https://github.com/cocos-creator/example-cases), Cocos Creator 开发范例
- [cocos-creator/tutorial-blackjack](https://github.com/cocos-creator/tutorial-blackjack), 21点游戏 - Cocos Creator 制造
- [cocos-creator/tutorial-dark-slash](https://github.com/cocos-creator/tutorial-dark-slash), 暗黑斩游戏制作演示 - Cocos Creator制造

#### Engine/Runtime
- [engine](https://github.com/cocos-creator/engine), Cocos Creator is a complete package of game development tools and workflow, including a game engine, resource management, scene editing, game preview, debug and publish one project to multiple platforms. http://www.cocos2d-x.org/creator
- [cocos2d-x-lite](https://github.com/cocos-creator/cocos2d-x-lite), Lite version cocos2d-x based on Cocos Runtime; Cocos2d-x compact version, It is based on cocos2d-x[version 3.9], but remove 3D and other features. It works on iOS, Android, macOS and Windows.



## Cocos2dx-lua
- [mac下的开发环境搭建](http://sunhantao.github.io/2016/02/13/Mac%E4%B8%8B%E7%BC%96%E7%A0%81%E8%B0%83%E8%AF%95Cocos2dx-lua%E7%9A%84%E5%B7%A5%E5%85%B7/)

#### Quick-Cocos2dx
- Quick-Cocos2dx是Cocos2dx-lua的增强版，封装了部分API更易于lua的开发。  
- Quick官方稳定版本是Quick-3.3final，最新版是Quick-3.5，之后官方不再维护。

#### Quick-Cocos2dx-Community
- 是基于Quick-3.3final之上的社区版，现在版本是3.6.1release版，并持续维护。
- [官方网站](http://www.cocos2d-lua.org/)
- [pbc 集成到quick-cocos2dx](http://www.cnblogs.com/suncoolcat/p/3297313.html)
- [Quick和Luajit使用注意](http://tairan.com/archives/10561/)
- [Quick资源加密](http://tairan.com/archives/10157/) 注：非zip加密方式下(-m files)：AppDelegate.cpp 启动代码是
  ```
  stack->executeString("require 'src.main'"); 
  ```
- [Quick使用webview](http://my.oschina.net/u/1582495/blog/465695) （注：目标目录是tools/tolua） 其他要导出的接口类似，操作过程中需要依赖的python组件安装参照[cocos2dx tolua说明](https://github.com/cocos2d/cocos2d-x/tree/c9306a053f051325a03b5297be7be6d645584780/tools/tolua)
- [Mac 下编译 Quick-Cocos2dx-Community 的 Android 版本](http://tairan.com/archives/10567/)

##### quick心得(cocos v3.10, quick v3.6.1)
- 所有导出的C＋＋到lua的API：Quick-Cocos2dx-Community/cocos/scripting/lua-bindings/auto/api/*.lua
- TextField设置文本排列时，要靠设置锚点实现，用setTextHorizontalAlignment无效。靠左排列＝setAnchorPoint(0, 0.5)
- cocos studio中的AtlasLabel无法使用，用代码创建LabelAtlas代替。
- cocos studio中的BitmapLabel无法使用，暂未找到解决办法。
- [Quick在iphone5s以上的ios64位下黑屏问题](http://www.cnblogs.com/yans/p/yans.html)
- quick的音效有时候播放不出问题：在第一个界面触发一下，原因未知：
  ```
    audio.setSoundsVolume(0.0)
    audio.playSound("res/Sound/HkFiveCard/SEND_CARD.wav")
    scheduler.performWithDelayGlobal(function ()
        audio.setSoundsVolume(1)
    end, 0.1)
  ```
- Player 打印行数太多显示不全  
  修改 `ConsoleWindowController.m` 定义的宏  
  ```
  #define SKIP_LINES_COUNT    200
  ```
