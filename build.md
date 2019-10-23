[C++构建系统的选择](https://www.jianshu.com/p/31bf731fec22)


## [GNU Make](https://www.gnu.org/software/make/manual/)
- 每条规则的形式
  ```
  <target> : <prerequisites> 
  [tab]  <commands>
  ```
- `order-only`依赖，使用管道符号 '|' 分隔 常规依赖 和 `order-only`依赖，`order-only`依赖**通常用来创建目录**。
  `targets : normal-prerequisites | order-only-prerequisites` 
- 伪目标 `.PHONY`，声明clean是"伪目标"之后，make就不会去检查是否存在一个叫做clean的文件，而是每次运行都执行对应的命令。
  ```makefile
  .PHONY: clean
  clean:
  	rm *.o temp
  ```
- 目标变量 `<target ...> : variable-assignment`
- 自动变量
  - `$@` 当前目标
    - `$(@D)` 和 `$(@F)` 分别指向 `$@` 的目录名和文件名
    - 比如，`$@` 是 `src/input.c`，那么 `$(@D)` 的值为 `src` ，`$(@F)` 的值为 `input.c`
  - `$<` 第一个依赖
    - `$(<D)` 和 `$(<F)` 分别指向 `$<` 的目录名和文件名
  - `$^` 所有依赖，但不包括 `order-only`依赖
  - `$?` 比目标更新的所有依赖，以空格分隔
  - `$*` 指代匹配符 `%` 匹配的部分， 比如 `%` 匹配 `f1.txt` 中的 `f1`，`$*` 就表示 `f1`
- [Makefile简明教程](https://fanzheng.org/archives/43)
- [Make 命令教程](http://www.ruanyifeng.com/blog/2015/02/make.html)
- [跟我一起写Makefile](https://github.com/seisman/how-to-write-makefile)



## Make-likes
- [CMake](https://cmake.org/)
- [emake](https://github.com/skywind3000/emake)
- [xmake](https://github.com/xmake-io/xmake), A cross-platform build utility based on lua.



## Next Generations
- [SCons](https://github.com/SCons/scons)
- [Waf](https://waf.io)
