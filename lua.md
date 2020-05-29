[Lua](http://www.lua.org/) is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming, object-oriented programming, functional programming, data-driven programming, and data description.

Lua combines simple procedural syntax with powerful data description constructs based on associative arrays and extensible semantics. Lua is dynamically typed, runs by interpreting bytecode with a register-based virtual machine, and has automatic memory management with incremental garbage collection, making it ideal for configuration, scripting, and rapid prototyping.


- [Roberto Ierusalimschy](http://www.inf.puc-rio.br/~roberto/index.html) • [Talks](http://www.inf.puc-rio.br/~roberto/talks/)
- [Awesome Lua](https://github.com/LewisJEllis/awesome-lua): A curated list of quality Lua packages and resources.



## Learn
- http://www.lua.org/docs.html
- [Learn Lua in 15 Minutes](http://tylerneylon.com/a/learn-lua/)
- [Lua脚本之语法基础快速入门](http://www.cocos.com/doc/tutorial/show?id=1929)
- [[lua coding style]]
- [Lua: Good, bad, and ugly parts](http://notebook.kulchenko.com/programming/lua-good-different-bad-and-ugly-parts)

#### [Source Code](http://lua-users.org/wiki/LuaSource)
- <details> <summary> Which OSS codebases out there are so well designed that you would consider them 'must reads'? </summary>

  https://www.reddit.com/r/programming/comments/63hth/ask_reddit_which_oss_codebases_out_there_are_so/

  [Online Lua 5.1 source code browser](http://www.lua.org/source/5.1/)

  Recommended reading order:

  lmathlib.c, lstrlib.c: get familiar with the external C API. Don't bother with the pattern matcher though. Just the easy functions.

  lapi.c: Check how the API is implemented internally. Only skim this to get a feeling for the code. Cross-reference to lua.h and luaconf.h as needed.

  lobject.h: tagged values and object representation. skim through this first. you'll want to keep a window with this file open all the time.

  lstate.h: state objects. ditto.

  lopcodes.h: bytecode instruction format and opcode definitions. easy.

  lvm.c: scroll down to luaV_execute, the main interpreter loop. see how all of the instructions are implemented. skip the details for now. reread later.

  ldo.c: calls, stacks, exceptions, coroutines. tough read.

  lstring.c: string interning. cute, huh?

  ltable.c: hash tables and arrays. tricky code.

  ltm.c: metamethod handling, reread all of lvm.c now.

  You may want to reread lapi.c now.

  ldebug.c: surprise waiting for you. abstract interpretation is used to find object names for tracebacks. does bytecode verification, too.

  lparser.c, lcode.c: recursive descent parser, targetting a register-based VM. start from chunk() and work your way through. read the expression parser and the code generator parts last.

  lgc.c: incremental garbage collector. take your time.

  Read all the other files as you see references to them. Don't let your stack get too deep though.

  If you're done before X-Mas and understood all of it, you're good. The information density of the code is rather high.

  </details>
- [温故而知新](http://blog.codingnow.com/2013/01/reading_lua_vm.html)
  - [Lua 源码欣赏.pdf](http://www.codingnow.com/temp/readinglua.pdf)
  - [探索lua5.2内部实现](http://blog.csdn.net/yuanlin2008/article/category/1307277)
- [Lua源码阅读推荐顺序](http://www.resetoter.cn/?p=1135)
- [Lua5.3源码浅读 SHT](http://sunhantao.github.io/2016/02/05/Lua5.3%E6%BA%90%E7%A0%81%E6%B5%85%E8%AF%BB/)



## Library
- [LuaRocks](https://luarocks.org/) is the package manager for Lua modules
- [json.lua](https://github.com/rxi/json.lua) A lightweight JSON library for Lua



## Projects
- [DCLua](https://github.com/milochristiansen/lua) A Lua 5.3 VM and compiler written in Go.
- [一个 Lua 内存泄露检查工具](http://blog.codingnow.com/2012/12/lua_snapshot.html)
- [浅析android手游lua脚本的加密与解密](https://bbs.pediy.com/thread-216969-1.htm)
- [Awesome](https://github.com/awesomeWM/awesome) is a highly configurable, next generation framework window manager for X.
