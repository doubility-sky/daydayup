[Cocos2d](http://cocos2d.org/) is a family of [open-source](https://github.com/cocos2d) software frameworks for building cross-platform games&apps.

[cocos2d-x](https://github.com/cocos2d/cocos2d-x) is a multi-platform framework for building 2d games, interactive books, demos and other graphical applications. It is based on cocos2d-iphone, but instead of using Objective-C, it uses C++. It works on iOS, Android, macOS, Windows and Linux.


- :star:[[cocos-creator]]



## Cocos2d-x-lua
- [mac 下的开发环境搭建](http://sunhantao.github.io/2016/02/13/Mac%E4%B8%8B%E7%BC%96%E7%A0%81%E8%B0%83%E8%AF%95Cocos2dx-lua%E7%9A%84%E5%B7%A5%E5%85%B7/)

### [Quick-Cocos2d-x](https://github.com/chukong/quick-cocos2d-x)
- Quick-Cocos2dx 是 Cocos2dx-lua 的增强版，封装了部分 API 更易于 lua 的开发。
- Quick 官方稳定版本是 Quick-3.3 final，最新版是 Quick-3.5，之后官方不再维护。

### [Quick-Cocos2dx-Community](http://www.cocos2d-lua.org/)
- [3.6.5 版本](https://github.com/u0u0/Quick-Cocos2dx-Community/tree/3.6.5_Release)，基于用户公认的最稳定版本 Quick-Cocos2d-x v3.3，推荐用于维护老项目
  - 或 [3.6.5 Doubility Sky 版](https://github.com/doubility-sky/Quick-Cocos2dx-Community/tree/dev)
- [3.7 版本](https://github.com/u0u0/Quick-Cocos2dx-Community)，改动很大，不建议老项目使用
- [4.0 版本](https://github.com/u0u0/Cocos2d-Lua-Community)，改动更大，不建议老项目使用；可以考虑尝鲜？但更推荐 [[cocos creator]]
- [Quick-Cocos2dx develop for vscode](https://github.com/leitwolf/vscode-QuickXDev)
- [形同虚设的cocos默认加密](https://blog.shuax.com/archives/decryptcocos.html)



## Tools

### [Cocos Studio](http://www.cocos2d-x.org/download/cocos)
- **注意！官方已不再维护，不推荐新项目使用。目前最后一个版本为 3.10**
- macOS 上卡死问题
  - [CocosStudio启动慢发布卡死，禁止联网后正常](https://forum.cocos.org/t/cocosstudio/41214/12)
  - `sudo vi /etc/hosts` 添加 `127.0.0.1  cs.ucenter.appget.cn`



## FAQs
- TextField 设置文本排列时，要靠设置锚点实现，用 setTextHorizontalAlignment 无效。靠左排列 ＝setAnchorPoint(0, 0.5)
- cocos studio 中的 AtlasLabel 无法使用，用代码创建 LabelAtlas 代替。
- cocos studio 中的 BitmapLabel 无法使用，暂未找到解决办法。
- [pbc 集成到 quick-cocos2dx](http://www.cnblogs.com/suncoolcat/p/3297313.html)
- [Quick 和 Luajit使用注意](http://tairan.com/archives/10561/)
- [Quick 资源加密](http://tairan.com/archives/10157/) 注：非zip加密方式下(-m files)：AppDelegate.cpp 启动代码是
  ```C++
  stack->executeString("require 'src.main'"); 
  ```
- [Quick 使用 webview](http://my.oschina.net/u/1582495/blog/465695)（注：目标目录是 tools/tolua）
  - 其他要导出的接口类似，操作过程中需要依赖的 python 组件安装参照[cocos2dx tolua说明](https://github.com/cocos2d/cocos2d-x/tree/c9306a053f051325a03b5297be7be6d645584780/tools/tolua)
- [Mac 下编译 Quick-Cocos2dx-Community 的 Android 版本](http://tairan.com/archives/10567/)
- [Quick 在 iphone5s 以上的 ios 64 位下黑屏问题](http://www.cnblogs.com/yans/p/yans.html)
- quick 的音效有时候播放不出问题：在第一个界面触发一下，原因未知
  ```lua
    audio.setSoundsVolume(0.0)
    audio.playSound("res/Sound/HkFiveCard/SEND_CARD.wav")
    scheduler.performWithDelayGlobal(function ()
        audio.setSoundsVolume(1)
    end, 0.1)
  ```
- Player 打印行数太多显示不全  
  修改 `ConsoleWindowController.m` 定义的宏  
  ```cpp
  #define SKIP_LINES_COUNT    200
  ```



## Resources
- [Cocos 资料大全](https://github.com/fusijie/Cocos-Resource)
