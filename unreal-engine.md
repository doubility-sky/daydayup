[Unreal Engine](https://www.unrealengine.com) is the world’s most open and advanced real-time 3D creation tool. Continuously evolving to serve not only its original purpose as a state-of-the-art game engine, today it gives creators across industries the freedom and control to deliver cutting-edge content, interactive experiences, and immersive virtual worlds. 

- [EpicGames](https://github.com/EpicGames)
- [Documentation](https://docs.unrealengine.com/en-US/index.html)



## Learn
- [Allar/ue4-style-guide](https://github.com/Allar/ue4-style-guide) An attempt to make Unreal Engine 4 projects more consistent http://ue4.style
- [Tom Looman](https://www.tomlooman.com/): Unreal Engine Tutorials and Game Development Blog
  - [tomlooman/ue4-tutorials](https://github.com/tomlooman/ue4-tutorials) Collection of Unreal 4 Tutorials & Experiments by Tom Looman
  - [Simple C++ FPS Template for Unreal Engine 4](https://github.com/tomlooman/SimpleFPSTemplate)
  - [EpicSurvivalGameSeries](https://github.com/tomlooman/EpicSurvivalGameSeries) Third-person Survival Game for Unreal Engine 4. https://www.tomlooman.com/survival-sample-game-for-ue4/
- [为Unity开发者准备的虚幻引擎指南](https://mp.weixin.qq.com/s/Ki0tzShblD6Xy7xzWFHMjg)



## Projects
- [AirSim](https://github.com/microsoft/AirSim) Open source simulator for autonomous vehicles built on Unreal Engine / Unity, from Microsoft AI & Research https://microsoft.github.io/AirSim/
- [OceanProject](https://github.com/UE4-OceanProject/OceanProject) An Ocean Simulation project for Unreal Engine 4
- [StreetMap](https://github.com/ue4plugins/StreetMap) Import OpenStreetMap data into Unreal Engine 4



## Tools
- [UnrealEnginePython](https://github.com/20tab/UnrealEnginePython) Embed Python in Unreal Engine 4
- [UnrealCV](https://github.com/unrealcv/unrealcv): Connecting Computer Vision to Unreal Engine https://unrealcv.org
- [Tencent/sluaunreal](https://github.com/Tencent/sluaunreal) lua dev plugin for unreal engine 4
- [Tencent/UnLua](https://github.com/Tencent/UnLua) is a feature-rich, easy-learning and highly optimized scripting solution for UE4. UnLua follows the programming pattern of UE4. UE4 programmers can use it at zero learning cost.



## FAQs
- [Unity、Unreal、CryEngine这三个引擎各有什么特点？哪一种最适合用来开发大型3D网游？](https://www.zhihu.com/question/336750450/answer/805042145)
- [Unity, Unreal, CryEngine的比较和扫雷](https://zhuanlan.zhihu.com/p/78509077)



## Resources
- [terrehbyte/awesome-ue4](https://github.com/terrehbyte/awesome-ue4): A curated list of resources for working with Unreal Engine 4. (Awesome Unreal Engine 4)
- [insthync/awesome-ue4](https://github.com/insthync/awesome-ue4): A categorized collection of awesome opensource Unreal Engine 4 repos

## Note
### 配置Android工程，基于[官方教程](https://docs.unrealengine.com/4.27/zh-CN/SharingAndReleasing/Mobile/Android/Setup/AndroidStudio/)
 - 下载虚幻引擎（5或4.27）
 - 下载android studio
   + 进入Tools/SDK Manager
   + SDK Platforms安装最新的sdk
   + SDK Tools安装NDK(Side by side)、Android SDK Command-line tools(latest)
   + SDK Tools的Build—Tools，**卸载**默认安装的最新的Build-Tools，**安装**29.0.2版本
 - windows，修改引擎目录下Engine\Extras\Android\SetupAndroid.bat并执行
```
set SDKMANAGER=%STUDIO_SDK_PATH%\tools\bin\sdkmanager.bat
改成
set SDKMANAGER=%STUDIO_SDK_PATH%\cmdline-tools\latest\bin\sdkmanager.bat
```
 - 项目内除了教程中的配置，还需要配置keystore
   + 使用android studio (https://blog.csdn.net/tzhenxiong/article/details/109901468)
   + 使用命令行 (windows)[https://blog.csdn.net/Gold_brick/article/details/52850169]
 - 项目的minSDKVersion改成21以上
