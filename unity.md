[Unity](https://unity.com/) is a cross-platform game engine developed by Unity Technologies.

- [LTS release page](https://unity3d.com/unity/qa/lts-releases)



## Learn
- [[c#]]
- [User Manual](https://docs.unity3d.com/Manual/index.html), [Scripting API](https://docs.unity3d.com/ScriptReference/index.html)
- [Unity Learn](https://learn.unity.com/)

### tutorials
- [C# and Shader Tutorials for the Unity Engine](https://catlikecoding.com/unity/tutorials/) - [zh-CN](https://zhuanlan.zhihu.com/p/346208723)
- [Unity 从入门到放弃](https://www.zhihu.com/column/c_1237044646569447424)
- [Guide to Extending Unity Editor’s Menus](https://blog.redbluegames.com/guide-to-extending-unity-editors-menus-b2de47a746db)
  > As a quick aside, if you change a menu item’s existing sort priority, you may not see it reflected in the Menus. I think Unity is caching the value, so to get it to update you can either **restart your Editor**, or do some gymnastics where you first remove the Priority from your attribute, compile, then add the new priority.
- [为虚幻引擎开发者准备的Unity指南](https://mp.weixin.qq.com/s/-tA4s64_HP4pk6GFy_D65A)



## Practice

### build
- [How I Cut Unity Compile Times by 75%](https://www.screaminggoose.com/blog/2019/2/4/how-i-cut-unity-compile-times-by-75)
- [How to reduce Unity build times](https://caioteixeira.dev/blog/how-to-reduce-unity-build-times/)

### memory
- [Unity游戏内存分布概览](https://zhuanlan.zhihu.com/p/370467923)

### graphics
- [Lightmapping Troubleshooting Guide](https://forum.unity.com/threads/lightmapping-troubleshooting-guide.1340936/)

### optimization
- [《天谕》手游分析报告(上)-资源分析](https://zhuanlan.zhihu.com/p/358309455)
- [《天谕》手游分析报告(下)-性能优化分析](https://zhuanlan.zhihu.com/p/358310704)
- [《天谕》手游背后的技术究竟有多强？](https://mp.weixin.qq.com/s/9V9AvaCwtQeezXKNxjhbVA)
- [对移动设备后处理的优化与替代方案](https://zhuanlan.zhihu.com/p/545654006)

### synchronization
- [Unity3D中实现帧同步 - Part 1](https://www.freesion.com/article/7285895467/)
- [Unity3D中实现帧同步 - Part 2](https://www.freesion.com/article/1348895460/)
- [Unity3D RTS游戏中帧同步实现](https://gameinstitute.qq.com/community/detail/113377)

### google play
- [ Unity3d接入googleplay内购详细说明（一）](http://blog.csdn.net/qq15233635728/article/details/44015225)
- [ Unity3d接入googleplay内购详细说明（二）](http://blog.csdn.net/qq15233635728/article/details/44016403)
- [ Unity3d接入googleplay内购详细说明（三）](http://blog.csdn.net/qq15233635728/article/details/44017543)
- [ Unity3d接入googleplay内购详细说明（四）](http://blog.csdn.net/qq15233635728/article/details/44018079)
- [Unity + Play Asset Delivery | 突破Google Play 商店 150 MB 的限制](https://medium.com/akatsuki-taiwan-technology/unity-play-asset-delivery-1d468fd90c2d)

### [texture compression](https://en.wikipedia.org/wiki/Texture_compression)
- [你所需要了解的几种纹理压缩格式原理](https://zhuanlan.zhihu.com/p/237940807)
- [Using ASTC Texture Compression for Game Assets](https://developer.nvidia.com/astc-texture-compression-for-game-assets)
- [ASTC纹理压缩格式详解](https://zhuanlan.zhihu.com/p/158740249)

### [wechat mini game](https://developers.weixin.qq.com/minigame/dev/guide/game-engine/unity-webgl-transform.html)
- [Unity 游戏接入微信小游戏指南](https://github.com/wechat-miniprogram/minigame-unity-webgl-transform/blob/main/Design/Guide.md)



## Script binding
- [moonsharp](http://www.moonsharp.org/): A Lua interpreter written entirely in C# for the .NET, Mono and Unity platforms.
- [xLua](https://github.com/Tencent/xLua) is a lua programming solution for C# ( Unity, .Net, Mono) , it supports android, ios, windows, linux, osx, etc.
  - [直接在 cs 里调用 luaL_error 真的没问题么？](https://github.com/Tencent/xLua/issues/14)
- [puerts](https://github.com/Tencent/puerts): write your game with TypeScript in the ue4 or unity
  - [puerts偿还了xLua哪些技术债](https://zhuanlan.zhihu.com/p/195320417)
- [unity-jsb](https://github.com/ialex32x/unity-jsb): 集成 QuickJS, 为 Unity3D 项目提供 Typescript/Javascript 支持



## Frameworks
- [ET](https://github.com/egametang/ET) Unity3D Client And C# Server Framework
- [Empty](https://github.com/zcy0220/Empty) is not empty at all
- [QFramework](https://github.com/liangxiegame/QFramework) K.I.S.S Unity 3D Framework. https://liangxiegame.com/qf/intro
- [GameFramework](https://github.com/EllanJiang/GameFramework) is literally a game framework, based on Unity game engine. 
- [TinaX Framework](https://github.com/yomunsam/TinaX) : Unity based Game Client Framework https://tinax.corala.space/



## Tools
- [UniWebView](https://uniwebview.com/) is a modern web view component for mobile Unity3D games. Integrating web content to your games was never easier.
  - [UIWebView和WKWebView与JS的交互详解](https://juejin.im/post/5d5148f2f265da03da2488d7)
- [SuperTiled2Unity](https://github.com/Seanba/SuperTiled2Unity) is a Unity Package that gives you the ability to import your [Tiled Map Editor](https://www.mapeditor.org/) maps directly into your Unity projects.
- ~~[ILRuntime](https://github.com/Ourpalm/ILRuntime): Pure C# IL Intepreter Runtime, which is fast and reliable for scripting requirement on enviorments, where jitting isn't possible.~~
- [HybridCLR](https://github.com/focus-creative-games/hybridclr) 是一个特性完整、零成本、高性能、低内存的 Unity 全平台原生 c# 热更方案。 HybridCLR is a fully featured, zero-cost, high-performance, low-memory solution for Unity's all-platform native c# hotupdate.
  - [inspect_hybridclr](https://github.com/focus-creative-games/inspect_hybridclr)深入剖析 il2cpp 及 HybridCLR 实现的技术专栏
  - [划时代的代码热更新方案hybridclr（wolong）源码流程解析](https://www.lfzxb.top/hybridclr-source-analyze/)



## FAQs
- [Multiple dlls with same name from packages](https://forum.unity.com/threads/multiple-dlls-with-same-name-from-packages.1042849/#post-6752233)
  - delete `./Library/Bee/Android/Prj/IL2CPP/Gradle` under your project.
- [AsyncOperation always returns 0 or 0.9 (coroutine only resumes at 0.9)](https://forum.unity.com/threads/asyncoperation-always-returns-0-or-0-9-coroutine-only-resumes-at-0-9.538258/#post-3556950)
- [Failed to load LightingData.asset](https://forum.unity.com/threads/failed-to-load-lightingdata-asset.723668/)
  - `lfs` or `eol` problem
- [Unity: ArgumentNullException: Argument cannot be null](https://github.com/JamesNK/Newtonsoft.Json/issues/1521#issuecomment-1304726752)
- [Newtonsoft.Json - Unable to deserialize hashsets](https://forum.unity.com/threads/unable-to-deserialize-hashsets.962805/)
  - https://github.com/jilleJr/Newtonsoft.Json-for-Unity/wiki/Fix-AOT-using-link.xml
- [Debug.isDebugBuild is false even with "development build" set to true](https://forum.unity.com/threads/debug-isdebugbuild-is-false-even-with-development-build-set-to-true.1348352/#post-8517191)
  - I presume it's not about these settings in particular, but just requires making some change to the platform settings in order to get it to refresh.
- [PRODUCT_NAME_APP in User-Defined Settings not correct](https://forum.unity.com/threads/product_name_app-in-user-defined-settings-not-correct.1101985/)
- [为什么Unity没有实现iOS平台代码热更新？](https://www.zhihu.com/question/28079874/answer/57706353)
- [Program type already present: com.tencent.a.a.a.a.a的解决方法](https://blog.csdn.net/weixin_43991241/article/details/121676781)
- [去除Unity打包出来右下角trial version 水印](https://blog.csdn.net/qq_41789645/article/details/134851440)
  - 退出 Unity 
  - Hub 中退回个人版许可证，然后退出
  - 再将 VPN 切换国外流量，重新申请许可证
  - 打开 Unity 重新构建

### screen
- [Android Phones Returning Screen.safeArea Incorrectly](https://forum.unity.com/threads/android-phones-returning-screen-safearea-incorrectly.1051514/#post-7684444)
- [Display Resolution Dialog Deprecation](https://forum.unity.com/threads/display-resolution-dialog-deprecation.793611/)
- [Unity 适配 Android 刘海屏显示](https://networm.me/2021/02/28/unity-android-display-cutout/)
- [unity native crash —— 横竖屏切换导致的crash](https://zoucz.com/blog/2022/11/30/66788390-70bc-11ed-9fa0-5dbc93f9d3ee/)

### rendering
- [URP - How to access the Rendering Debugger window](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@16.0/manual/features/rendering-debugger.html)
- [releasing render texture that is set as Camera.targetTexture!](https://forum.unity.com/threads/releasing-render-texture-that-is-set-as-camera-targettexture.403325/)

### particle
- [Why does a ParticleSystem.Main is a struct yet changes value in the inspector?](https://forum.unity.com/threads/why-does-a-particlesystem-main-is-a-struct-yet-changes-value-in-the-inspector.1202149/)
- [Particle System Flash With Wrong Size And Position](https://forum.unity.com/threads/particle-system-flash-with-wrong-size-and-position.1321995/)

### upgrade
- [error CS0619: 'GUIText' is obsolete: 'GUIText has been removed. Use UI.Text instead.'](https://forum.unity.com/threads/error-cs0619-guitext-is-obsolete-guitext-has-been-removed-use-ui-text-instead.826746/#post-5724169)



## Resources
- [Unity Official Resources for Games](https://resources.unity.com/games): Bring your game to life with the most complete and flexible real-time development platform. Unity enables you to quickly create, easily operate, and fully monetize your game.
- [OpenUPM](https://openupm.com/): Open Source Unity Package Registry
- [Awesome Unity](https://github.com/RyanNielson/awesome-unity): A categorized community-driven collection of high-quality awesome Unity assets, projects, and resources. Free assets and resources are prioritized over paid when possible.
- [awesome-unity3d](https://github.com/insthync/awesome-unity3d): A categorized collection of awesome opensource unity3d resources (including some projects related to game development)
- [Unity Script Collection](https://github.com/michidk/Unity-Script-Collection): A maintained collection of useful & free unity scripts / libraries / plugins and extensions.
- [Awesome Unity Open Source on GitHub (800+)](https://github.com/baba-s/awesome-unity-open-source-on-github)
- [GitHub上有哪些Unity3D项目推荐？](https://zhuanlan.zhihu.com/p/53913159)
- [Unity项目在github上如何团队协作](https://blog.csdn.net/weixin_43347688/article/details/107054460)
- [Unity3d 100 个开源项目推荐！](https://www.bilibili.com/read/cv10038189/)
