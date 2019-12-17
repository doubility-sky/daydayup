- [Graphics](computer-graphics#Library)



## I/O Event 
- [libevent](https://github.com/libevent/libevent) – an event notification library
- [libev](http://software.schmorp.de/pkg/libev.html), libuv 的 unix 部分曾以此为基础
- [libuv](https://github.com/libuv/libuv)
  - [An Introduction to libuv](https://github.com/nikhilm/uvbook)
  - [libuv 初窥](http://blog.codingnow.com/2012/01/libuv.html)
  - https://github.com/thlorenz/learnuv
  - https://en.wikipedia.org/wiki/Libuv



## Coroutine
- [Protothreads](http://dunkels.com/adam/pt/index.html)
  - [zserge/pt](https://github.com/zserge/pt)
- [Libco](https://github.com/Tencent/libco) is a c/c++ coroutine library that is widely used in WeChat services. It has been running on tens of thousands of machines since 2013.
- [libaco](https://github.com/hnes/libaco) - A blazing fast and lightweight C asymmetric coroutine library.



## Serialization
- [protocolbuffers/protobuf](https://github.com/protocolbuffers/protobuf) - Google's data interchange format https://developers.google.com/protocol-buffers/
  - [protocolbuffers/upb](https://github.com/protocolbuffers/upb) a small protobuf implementation in C
  - [nanopb](https://github.com/nanopb/nanopb), Protocol Buffers with small code size https://jpa.kapsi.fi/nanopb/
- [google/flatbuffers](https://github.com/google/flatbuffers): Memory Efficient Serialization Library http://google.github.io/flatbuffers/



## GUI
- [Dear ImGui](https://github.com/ocornut/imgui): Bloat-free Immediate Mode Graphical User interface for C++ with minimal dependencies
  - [imgui_club](https://github.com/ocornut/imgui_club) Nice things to use along dear imgui
  - [imgui-node-editor](https://github.com/thedmd/imgui-node-editor), This is an implementaion of node editor with ImGui-like API. Project purpose is to serve as a basis for more complex solutions like blueprint editors.
  - [ImGuizmo](https://github.com/CedricGuillemet/ImGuizmo), Immediate mode 3D gizmo for scene editing and other controls based on Dear Imgui
  - [cimgui](https://github.com/cimgui/cimgui) This is a thin c-api wrapper programmatically generated for the excellent C++ immediate mode gui Dear ImGui. All imgui.h functions are programmatically wrapped. Generated files are: cimgui.cpp, cimgui.h for C compilation. Also for helping in bindings creation, definitions.lua with function definition information and structs_and_enums.lua. This library is intended as a intermediate layer to be able to use Dear ImGui from other languages that can interface with C (like D - see D-binding)
  - [love-imgui](https://github.com/slages/love-imgui)imgui module for the LÖVE game engine
- [Nuklear](https://github.com/Immediate-Mode-UI/Nuklear) A single-header ANSI C immediate mode cross-platform GUI library
  - [vurtun/nuklear](https://github.com/vurtun/nuklear) Archived
  - [golang-ui/nuklear](https://github.com/golang-ui/nuklear) This project provides Go bindings for nuklear.h — a small ANSI C GUI library. https://github.com/vurtun/nuklear
- [libui](https://github.com/andlabs/libui): a portable GUI library for C
- [nanogui](https://github.com/wjakob/nanogui) Minimalistic GUI library for OpenGL
- [microui](https://github.com/rxi/microui) Tiny immediate-mode UI library



## Multimedia
### Audio
- [RtAudio](https://github.com/thestk/rtaudio) A set of C++ classes that provide a common API for realtime audio input/output across Linux (native ALSA, JACK, PulseAudio and OSS), Macintosh OS X (CoreAudio and JACK), and Windows (DirectSound, ASIO and WASAPI) operating systems.
- [libsoundio](https://github.com/andrewrk/libsoundio) C library providing cross-platform audio input and output. The API is suitable for real-time software such as digital audio workstations as well as consumer software such as music players.
### Video
- [Bento4](https://github.com/axiomatic-systems/Bento4) Full-featured MP4 format and MPEG DASH library and tools


