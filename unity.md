[Unity](https://unity.com/) is a cross-platform game engine developed by Unity Technologies.

- [LTS release page](https://unity3d.com/unity/qa/lts-releases)



## Learn
- [[c#]]
- [User Manual](https://docs.unity3d.com/Manual/index.html), [Scripting API](https://docs.unity3d.com/ScriptReference/index.html)
- [Unity Learn](https://learn.unity.com/)

### tutorials
- [C# and Shader Tutorials for the Unity Engine](https://catlikecoding.com/unity/tutorials/) - [zh-CN](https://zhuanlan.zhihu.com/p/346208723)
- [Unity 从入门到放弃](https://www.zhihu.com/column/c_1237044646569447424)



## Practice

### build
- [How I Cut Unity Compile Times by 75%](https://www.screaminggoose.com/blog/2019/2/4/how-i-cut-unity-compile-times-by-75)
- [How to reduce Unity build times](https://caioteixeira.dev/blog/how-to-reduce-unity-build-times/)

### memory
- [Unity游戏内存分布概览](https://zhuanlan.zhihu.com/p/370467923)

### optimization
- [《天谕》手游分析报告(上)-资源分析](https://zhuanlan.zhihu.com/p/358309455)
- [《天谕》手游分析报告(下)-性能优化分析](https://zhuanlan.zhihu.com/p/358310704)
- [《天谕》手游背后的技术究竟有多强？](https://mp.weixin.qq.com/s/9V9AvaCwtQeezXKNxjhbVA)

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
- [MemoryProfiler](https://github.com/larryhou/MemoryProfiler) CPU and memory profiling tools for Unity3D
- [SuperTiled2Unity](https://github.com/Seanba/SuperTiled2Unity) is a Unity Package that gives you the ability to import your [Tiled Map Editor](https://www.mapeditor.org/) maps directly into your Unity projects.
- [ILRuntime](https://github.com/Ourpalm/ILRuntime): Pure C# IL Intepreter Runtime, which is fast and reliable for scripting requirement on enviorments, where jitting isn't possible.
- [huatuo](https://github.com/focus-creative-games/huatuo): Zero-cost, high-performance unity c# hot update solution



## FAQs
- [为什么Unity没有实现iOS平台代码热更新？](https://www.zhihu.com/question/28079874/answer/57706353)
- [Android Phones Returning Screen.safeArea Incorrectly](https://forum.unity.com/threads/android-phones-returning-screen-safearea-incorrectly.1051514/#post-7684444)
- [Program type already present: com.tencent.a.a.a.a.a的解决方法](https://blog.csdn.net/weixin_43991241/article/details/121676781)
  - delete `./Library/Bee/Android/Prj/IL2CPP/Gradle` under your project.
- [AsyncOperation always returns 0 or 0.9 (coroutine only resumes at 0.9)](https://forum.unity.com/threads/asyncoperation-always-returns-0-or-0-9-coroutine-only-resumes-at-0-9.538258/#post-3556950)
- [Particle System Flash With Wrong Size And Position](https://forum.unity.com/threads/particle-system-flash-with-wrong-size-and-position.1321995/)



## Resources
- [Awesome Unity](https://github.com/RyanNielson/awesome-unity): A categorized community-driven collection of high-quality awesome Unity assets, projects, and resources. Free assets and resources are prioritized over paid when possible.
- [GitHub上有哪些Unity3D项目推荐？](https://zhuanlan.zhihu.com/p/53913159)
- [Unity项目在github上如何团队协作](https://blog.csdn.net/weixin_43347688/article/details/107054460)
