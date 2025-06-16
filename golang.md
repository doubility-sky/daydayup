[Go](http://golang.org/) is an [open source](https://github.com/golang) programming language that makes it easy to build **simple**, **reliable**, and **efficient** software.



## Learn
- Official: [Documents](https://golang.org/doc/), [Wiki](https://github.com/golang/go/wiki), [Talks](https://talks.golang.org/)
- [Go Developer Roadmap](https://github.com/Alikhll/golang-developer-roadmap) Roadmap to becoming a Go developer
- [Ultimate Go study guide](https://github.com/hoanhan101/ultimate-go), with heavily documented code and programs analysis, all in 1 place

### quick start
- [A Tour of Go](https://tour.golang.org/) with [The Go Playground](https://play.golang.org/)
- [Go by Example](https://gobyexample.com/) 
- [The Golang Standard Library by Example](https://github.com/polaris1119/The-Golang-Standard-Library-by-Example)

### other topics
- [Go Modules 终极入门](https://segmentfault.com/a/1190000021854441)
- [Go包管理的前世今生](http://www.infoq.com/cn/articles/history-go-package-management)

### standard & style
- [Effective Go](https://golang.org/doc/effective_go.html) - [中英双语版](https://github.com/bingohuang/effective-go-zh-en)
- [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments): This page collects common comments made during reviews of Go code, so that a single detailed explanation can be referred to by shorthands. This is a laundry list of common mistakes, not a comprehensive style guide.
- [Go-advices](https://github.com/cristaloleg/go-advice) List of advices and tricks for Go ʕ◔ϖ◔ʔ
- [uber-go/guide](https://github.com/uber-go/guide) The Uber Go Style Guide.

### books
- :star:[The Go Programming Language](https://www.gopl.io/) - [zh-CN](https://docs.hacknode.org/gopl-zh/), by [gopl-zh](https://github.com/golang-china/gopl-zh)
- [Go Web 编程](https://github.com/astaxie/build-web-application-with-golang): A golang ebook intro how to build a web with golang
- [go-perfbook](https://github.com/dgryski/go-perfbook) - [zh-CN](https://github.com/dgryski/go-perfbook/blob/master/performance-zh.md) This document outlines best practices for writing high-performance Go code. The first sections cover writing optimized code in any language. The later sections cover Go-specific techniques.
- [Go 语言高性能编程](https://github.com/geektutu/high-performance-go): high performance coding with golang（Go 语言高性能编程，Go 语言陷阱，Gotchas，Traps）

### internal
- **philosophy**
  - [Concurrency is not Parallelism](https://blog.golang.org/concurrency-is-not-parallelism), [Go Concurrency Patterns](https://talks.golang.org/2012/concurrency.slide) by [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike) 
  - [CSP - Communicating Sequential Processes](https://en.wikipedia.org/wiki/Communicating_sequential_processes) - [cspbook.pdf](http://www.usingcsp.com/cspbook.pdf) by [Hoare](http://c2.com/cgi/wiki?CarHoare)
- [What Go values look like in memory?](https://research.swtch.com/godata): This post is about basic types, structs, arrays, and slices.
- :star:[Go 语言设计与实现](https://draveness.me/golang/)：本书的主要内容可以分成四个主要部分，分别是编译原理、运行时、基础知识和进阶知识，这四部分几乎可以覆盖 Go 语言从编译到运行的方方面面，让我们对 Go 语言有更加整体和深刻的认识。
- [golang-notes](https://github.com/cch123/golang-notes) Go source code analysis(zh-CN)
- [Go 语言原本](https://github.com/changkun/go-under-the-hood): 一份不太简短的源码研究 - [在线阅读](https://golang.design/under-the-hood)
- [Go1.5源码剖析](https://github.com/qyuhen/book)



## Libraries
- [Gorilla Web Toolkit](https://github.com/gorilla), Gorilla is a web toolkit for the Go programming language that provides useful, composable packages for writing HTTP-based applications.
- [GopherJS](https://github.com/gopherjs/gopherjs) compiles Go code (golang.org) to pure JavaScript code. Its main purpose is to give you the opportunity to write front-end code in Go which will still run in all browsers.
- [torrent-client](https://github.com/veggiedefender/torrent-client) Tiny BitTorrent client written in Go. Read the blog post: https://blog.jse.li/posts/torrent/
- [errors](https://github.com/pkg/errors): Simple error handling primitives
- [go-lua](https://github.com/Shopify/go-lua) is a port of the Lua 5.2 VM to pure Go. It is compatible with binary files dumped by luac, from the [Lua reference implementation](http://www.lua.org/).
- [Logrus](https://github.com/sirupsen/logrus)Logrus is a structured logger for Go (golang), completely API compatible with the standard library logger.



## Frameworks
- [gogf/gf](https://github.com/gogf/gf) GoFrame is a modular, full-featured and production-ready application development framework of golang. Providing a series of core components and dozens of practical modules, such as: cache, logging, containers, timer, resource, validator, database orm, etc. Supporting web server integrated with router, cookie, session, middleware, logger, configu… https://goframe.org
- [ray](https://github.com/ray-project/ray) A fast and simple framework for building and running distributed applications. Ray is packaged with RLlib, a scalable reinforcement learning library, and Tune, a scalable hyperparameter tuning library. https://ray.io
- [go-micro](https://github.com/micro/go-micro) A Go microservices development framework https://go-micro.dev

### [web](https://github.com/speedwheel/awesome-go-web-frameworks)
- [⚡ Go web framework benchmark](https://github.com/smallnest/go-web-framework-benchmark)
- [beego](https://github.com/astaxie/beego) is used for rapid development of RESTful APIs, web apps and backend services in Go. It is inspired by [Tornado](python#Frameworks), Sinatra and [Flask](python#Frameworks). beego has some Go-specific features such as interfaces and struct embedding.
- [gin](https://github.com/gin-gonic/gin) is a web framework written in Go (Golang). It features a martini-like API with performance that is up to 40 times faster thanks to [httprouter](https://github.com/julienschmidt/httprouter). If you need performance and good productivity, you will love Gin.
- [Fiber](https://github.com/gofiber/fiber) is an Express inspired web framework built on top of Fasthttp, the fastest HTTP engine for Go. Designed to ease things up for fast development with zero memory allocation and performance in mind.
- [iris](https://github.com/kataras/iris) is a fast, simple yet fully featured and very efficient web framework for Go.



## [[Game-Development]]

### [[game-client]]
- [pixel](https://github.com/faiface/pixel) A hand-crafted 2D game library in Go
- [ebiten](https://github.com/hajimehoshi/ebiten) A dead simple 2D game library in Go https://ebiten.org/
  - [gozelda](https://github.com/ArnaudCalmettes/gozelda) An implementation of a GameBoy era zelda game using Go and Ebiten
- [Korok](https://github.com/KorokEngine/Korok) is a free lightweight, cross-platform, component-based 2D game engine written in Golang and released under the zlib license. Greatly inspired by bitsquid blog.
- [oak](https://github.com/oakmound/oak) A pure Go game engine
- [G3N](https://github.com/g3n/engine) (pronounced "gen") is an OpenGL 3D Game Engine written in Go. It can be used to write cross-platform Go applications that show rich and dynamic 3D representations - not just games. A basic integrated GUI framework is provided, and 3D spatial audio is supported through OpenAL.

### [[game-server]]
- [agones](https://github.com/googleforgames/agones), [open match](https://github.com/googleforgames/open-match)
- [Pitaya](https://github.com/topfreegames/pitaya) is an simple, fast and lightweight game server framework with clustering support and client libraries for iOS, Android, Unity and others through the [C SDK](https://github.com/topfreegames/libpitaya). It provides a basic development framework for distributed multiplayer games and server-side applications.
- [Nakama](https://github.com/heroiclabs/nakama): Distributed server for social and realtime games and apps.
- [goworld](https://github.com/xiaonanln/goworld): Scalable Distributed Game Server Engine with Hot Reload in Golang
- [leaf](https://github.com/name5566/leaf): A pragmatic game server framework in Go (golang).
- [Nano](https://github.com/lonng/nano) is an easy to use, fast, lightweight game server networking library for Go.
- [gonet](https://github.com/xtaci/gonet) - deprecated, [gonet2](https://github.com/gonet2) - inactive



## Tools
- [作为程序员的你，常用的工具软件有哪些？ - 腾讯技术工程的回答](https://www.zhihu.com/question/22867411/answer/911161400)
- [使用 VS Code 快速搭建你的 Golang 开发 IDE](https://toozhao.com/2017/08/23/vscode-golang/)
  - [[gopls] : Following links on imports opens the browser](https://github.com/microsoft/vscode-go/issues/2550)



## FAQs
- 发行闭源go包的办法：http://www.golangtc.com/t/540eaa6e320b527a3b000161 
  - 主要思想是将.a和.go文件放在GOROOT下冒充系统库，因为系统库不会主动编译。
  - 但其中要注意，.go文件必须定义外部使用的接口，即大写开头的变量和方法，内容可以为空。
- 交叉编译go目标代码举例：
    ```
    > CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/main src/main/main.go
    ```
  - 其中参数可选：
    ```
    OS ARCH OS version
    linux 386 / amd64 / arm >= Linux 2.6
    darwin 386 / amd64 OS X
    freebsd 386 / amd64 >= FreeBSD 7
    windows 386 / amd64 >= Windows 2000
    ```
- [为什么 Go 语言没有泛型](https://draveness.me/whys-the-design-go-generics/)



## Resources
- [Awesome Go](https://github.com/avelino/awesome-go): A curated list of awesome Go frameworks, libraries and software
- [Golang从入门到跑路](https://github.com/jiujuan/go-collection): 🌷 awesome awesome go, study golang from basic to proficient
- [Go Developer Roadmap's Resources](https://github.com/Alikhll/golang-developer-roadmap#resources)
- [Go Patterns](https://github.com/tmrts/go-patterns) Curated list of Go design patterns, recipes and idioms http://tmrts.com/go-patterns
