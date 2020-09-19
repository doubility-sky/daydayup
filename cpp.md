- [Awesome C++](https://github.com/fffaraz/awesome-cpp), A curated list of awesome C++ (or C) frameworks, libraries, resources, and shiny things. Inspired by awesome-... stuff.
- [Awesome Modern C++](https://github.com/rigtorp/awesome-modern-cpp) A collection of resources on modern C++.



## Learn
- [The C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines) are a collaborative effort led by Bjarne Stroustrup, much like the C++ language itself. They are the result of many person-years of discussion and design across a number of organizations. Their design encourages general applicability and broad adoption but they can be freely copied and modified to meet your organization's needs.
- [Modern C++ Tutorial](https://github.com/changkun/modern-cpp-tutorial): C++11/14/17/20 On the Fly https://changkun.de/modern-cpp/
- [CPP-Concurrency-In-Action-2ed-2019](https://github.com/xiaoweiChen/CPP-Concurrency-In-Action-2ed-2019) 作为对《C++ Concurrency in Action - SECOND EDITION》的中文翻译。 https://legacy.gitbook.com/book/chenxiaowei/c-concurrency-in-action-second-edition-2019
- [c++ sumup](https://github.com/idealvin/docs/blob/master/md/c%2B%2B.md)
- [interview](https://github.com/huihut/interview): C/C++ 技术面试基础知识总结，包括语言、程序库、数据结构、算法、系统、网络、链接装载库等知识及面试经验、招聘、内推等信息。 https://interview.huihut.com

### STL
- [STLport](http://www.stlport.org/) is a multiplatform ANSI C++ Standard Library implementation. It is free, open-source product
- [SGI STL v3.3](https://github.com/qinhanlei/stl) - [源代码剖析](https://github.com/steveLauwh/SGI-STL)
- [MyTinySTL](https://github.com/Alinshans/MyTinySTL): Achieve a tiny STL in C++11



## Library
- [C library](c#library)
- [boostorg/hana](https://github.com/boostorg/hana) Your standard library for metaprogramming http://boostorg.github.io/hana
- [indicators](https://github.com/p-ranav/indicators) Activity Indicators for Modern C++

### Memory
- [TCMalloc](https://github.com/google/tcmalloc) is Google's customized implementation of C's malloc() and C++'s operator new used for memory allocation within our C and C++ code. TCMalloc is a fast, multi-threaded malloc implementation.
  - Also see [gperftools](https://github.com/gperftools/gperftools)

### Serialization
- [protocolbuffers/protobuf](https://github.com/protocolbuffers/protobuf) - Google's data interchange format https://developers.google.com/protocol-buffers/
  - [protobuf.js](https://github.com/protobufjs/protobuf.js) Protocol Buffers for JavaScript (& TypeScript).
  - [protocolbuffers/upb](https://github.com/protocolbuffers/upb) a small protobuf implementation in C
  - [nanopb](https://github.com/nanopb/nanopb), Protocol Buffers with small code size https://jpa.kapsi.fi/nanopb/
- [google/flatbuffers](https://github.com/google/flatbuffers): Memory Efficient Serialization Library http://google.github.io/flatbuffers/

### Network
- [The C++ Network Library Project](https://github.com/cpp-netlib/cpp-netlib) -- cross-platform, standards compliant networking library. http://cpp-netlib.org/

### Coroutine
- [co](https://github.com/idealvin/co): A golang-style C++ coroutine library and more. An elegant and efficient C++ basic library for Linux, Windows and Mac. 
- [The POCO C++ Libraries](https://github.com/pocoproject/poco) are powerful cross-platform C++ libraries for building network- and internet-based applications that run on desktop, server, mobile, IoT, and embedded systems. https://pocoproject.org
- [Libco](https://github.com/Tencent/libco) is a c/c++ coroutine library that is widely used in WeChat services. It has been running on tens of thousands of machines since 2013.

### JSON
- [Tencent/rapidjson](https://github.com/Tencent/rapidjson)
  - [从零开始的 JSON 库教程](https://zhuanlan.zhihu.com/p/22457315)
- [lemire/simdjson](https://github.com/lemire/simdjson) Parsing gigabytes of JSON per second https://arxiv.org/abs/1902.08318

### GUI
- [wxWidgets](https://github.com/wxWidgets/wxWidgets) is a free and open source cross-platform C++ framework for writing advanced GUI applications using native controls.
- [MyGUI](https://github.com/MyGUI/mygui) is a cross-platform library for creating graphical user interfaces (GUIs) for games and 3D applications.
  - Website: http://mygui.info/
  - There you can find basic information about how to build MyGUI: http://www.ogre3d.org/tikiwiki/MyGUI+Compiling
- [Immediate mode GUI](https://en.wikipedia.org/wiki/Immediate_mode_GUI) in computer graphics is a GUI implemented using an immediate mode pattern, where the event processing is directly controlled by the application.
  - [Retained Mode Versus Immediate Mode](https://docs.microsoft.com/en-us/windows/win32/learnwin32/retained-mode-versus-immediate-mode)
  - [Slate UI Framework - Motivation](https://docs.unrealengine.com/en-US/Programming/Slate/Architecture/index.html)
  - [@游戏开发者，ImGUI 能成为 GUI 的未来吗？](https://mp.weixin.qq.com/s?__biz=MjM5MjAwODM4MA==&mid=2650721530&idx=3&sn=f5ba60b684705c1621d834eb2480648b)
- [Dear ImGui](https://github.com/ocornut/imgui): Bloat-free Immediate Mode Graphical User interface for C++ with minimal dependencies
  - [imgui_club](https://github.com/ocornut/imgui_club) Nice things to use along dear imgui
  - [imgui-node-editor](https://github.com/thedmd/imgui-node-editor), This is an implementaion of node editor with ImGui-like API. Project purpose is to serve as a basis for more complex solutions like blueprint editors.
  - [ImGuizmo](https://github.com/CedricGuillemet/ImGuizmo), Immediate mode 3D gizmo for scene editing and other controls based on Dear Imgui
  - [imgui_markdown](https://github.com/juliettef/imgui_markdown) Markdown for Dear ImGui
  - [cimgui](https://github.com/cimgui/cimgui) This is a thin c-api wrapper programmatically generated for the excellent C++ immediate mode gui Dear ImGui.
  - [imgui-go](https://github.com/inkyblackness/imgui-go) This library is a Go wrapper for Dear ImGui.
    - [giu](https://github.com/AllenDang/giu) Cross platform rapid GUI framework for golang based on imgui and the great golang binding imgui-go.
  - [love-imgui](https://github.com/slages/love-imgui) imgui module for the LÖVE game engine
  - [Native ImGui in the Browser](https://pbrfrat.com/post/imgui_in_browser.html)



## Frameworks
- [openFrameworks](https://github.com/openframeworks/openFrameworks) is a community-developed cross platform toolkit for creative coding in C++. http://openframeworks.cc
- [acl](https://github.com/acl-dev/acl): Server framework and network components written by C/C++ for Linux, Mac, FreeBSD, Solaris(x86), Windows, Android, IOS https://blog.csdn.net/zsxxsz
- [Catch2](https://github.com/catchorg/Catch2): A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD - using C++11, C++14, C++17 and later (or C++03 on the Catch1.x branch) https://discord.gg/4CWS9zD
- [doctest](https://github.com/onqtam/doctest): The fastest feature-rich C++11/14/17/20 single-header testing framework
