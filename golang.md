- http://golang.org/  `godoc -http=:6060`
- https://talks.golang.org/
- https://github.com/golang/go/wiki
- https://github.com/avelino/awesome-go



## Learn
- Philosophy
  - [Concurrency is not Parallelism](https://blog.golang.org/concurrency-is-not-parallelism) by [Rob Pike](golang/#creators)
    - [Go Concurrency Patterns](https://talks.golang.org/2012/concurrency.slide) 
  - [CSP - Communicating Sequential Processes](https://en.wikipedia.org/wiki/Communicating_sequential_processes)  
    - http://www.usingcsp.com/cspbook.pdf by [Hoare](http://c2.com/cgi/wiki?CarHoare)
- Quick start
  - [A Tour of Go](https://tour.golang.org/)
  - [Go by Example](https://gobyexample.com/) 
  - [The Golang Standard Library by Example](https://github.com/polaris1119/The-Golang-Standard-Library-by-Example)
- Books
  - [The Go Programming Language](https://github.com/miguellgt/books/blob/master/go/The.Go.Programming.Language.pdf) 
    - [Go语言圣经](https://docs.hacknode.org/gopl-zh/)，by [gopl-zh](https://github.com/golang-china/gopl-zh)
  - [Go Web 编程](https://github.com/astaxie/build-web-application-with-golang)
- Standard & Style
  - [Effective Go](https://golang.org/doc/effective_go.html)
    - [Effective Go 中英双语版](https://github.com/bingohuang/effective-go-zh-en) https://legacy.gitbook.com/book/bingohuang/effective-go-zh-en/details
  - [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
  - [Go编码规范指南](https://gocn.io/article/1)
  - [Go-advices](https://github.com/cristaloleg/go-advice) List of advices and tricks for Go ʕ◔ϖ◔ʔ
  - [uber-go/guide](https://github.com/uber-go/guide) The Uber Go Style Guide.
- Source code analysis
  - [深入解析Go](https://github.com/tiancaiamao/go-internals)
  - [Go Under The Hood](https://github.com/changkun/go-under-the-hood): A Source Code Study of Go (1.14, WIP) https://changkun.de/golang
  - [Go1.5源码剖析](https://github.com/qyuhen/book)
  - [golang-notes](https://github.com/cch123/golang-notes) Go source code analysis(zh-cn)
  - [Go 语言设计与实现](https://draveness.me/golang/)
- Others
  - [Ultimate Go study guide](https://github.com/hoanhan101/ultimate-go), with heavily documented code and programs analysis, all in 1 place https://hoanhan101.github.io/2020/01/06/101-challenges
  - [Go Patterns](https://github.com/tmrts/go-patterns) Curated list of Go design patterns, recipes and idioms http://tmrts.com/go-patterns
  - [Go Data Structures](https://research.swtch.com/godata)



## Open Source
- https://github.com/Alikhll/golang-developer-roadmap
- [Gorilla Web Toolkit](https://github.com/gorilla), Gorilla is a web toolkit for the Go programming language that provides useful, composable packages for writing HTTP-based applications.
- [GopherJS](https://github.com/gopherjs/gopherjs) compiles Go code (golang.org) to pure JavaScript code. Its main purpose is to give you the opportunity to write front-end code in Go which will still run in all browsers.
- [torrent-client](https://github.com/veggiedefender/torrent-client) Tiny BitTorrent client written in Go. Read the blog post: https://blog.jse.li/posts/torrent/



## Frameworks
- [gogf/gf](https://github.com/gogf/gf) GoFrame is a modular, full-featured and production-ready application development framework of golang. Providing a series of core components and dozens of practical modules, such as: cache, logging, containers, timer, resource, validator, database orm, etc. Supporting web server integrated with router, cookie, session, middleware, logger, configu… https://goframe.org
- [ray](https://github.com/ray-project/ray) A fast and simple framework for building and running distributed applications. Ray is packaged with RLlib, a scalable reinforcement learning library, and Tune, a scalable hyperparameter tuning library. https://ray.io
- [go-micro](https://github.com/micro/go-micro) A Go microservices development framework https://go-micro.dev



## [[Game Development]]
- [[game-client]]
  - [pixel](https://github.com/faiface/pixel) A hand-crafted 2D game library in Go
  - [ebiten](https://github.com/hajimehoshi/ebiten) A dead simple 2D game library in Go https://ebiten.org/
    - [gozelda](https://github.com/ArnaudCalmettes/gozelda) An implementation of a GameBoy era zelda game using Go and Ebiten
  - [Korok](https://github.com/KorokEngine/Korok) is a free lightweight, cross-platform, component-based 2D game engine written in Golang and released under the zlib license. Greatly inspired by bitsquid blog.
  - [oak](https://github.com/oakmound/oak) A pure Go game engine
  - [G3N](https://github.com/g3n/engine) (pronounced "gen") is an OpenGL 3D Game Engine written in Go. It can be used to write cross-platform Go applications that show rich and dynamic 3D representations - not just games. A basic integrated GUI framework is provided, and 3D spatial audio is supported through OpenAL.
- [[game-server]]
  - [gonet](http://gonet2.github.io/), [leaf](https://github.com/name5566/leaf), [goworld](https://github.com/xiaonanln/goworld)



## Tools
- [作为程序员的你，常用的工具软件有哪些？ - 腾讯技术工程的回答](https://www.zhihu.com/question/22867411/answer/911161400)
- [使用 VS Code 快速搭建你的 Golang 开发 IDE](https://toozhao.com/2017/08/23/vscode-golang/)



## FAQ
- 发行闭源go包的办法：http://www.golangtc.com/t/540eaa6e320b527a3b000161 
  - 主要思想是将.a和.go文件放在GOROOT下冒充系统库，因为系统库不会主动编译。
  - 但其中要注意，.go文件必须定义外部使用的接口，即大写开头的变量和方法，内容可以为空。
- 交叉编译go目标代码举例：
    ```
    > CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/main src/main/main.go
    ```
    其中参数可选：
    ```
    OS ARCH OS version
    linux 386 / amd64 / arm >= Linux 2.6
    darwin 386 / amd64 OS X
    freebsd 386 / amd64 >= FreeBSD 7
    windows 386 / amd64 >= Windows 2000
    ```
- [Go包管理的前世今生](http://www.infoq.com/cn/articles/history-go-package-management)
- [理解Go 1.5 vendor](http://tonybai.com/2015/07/31/understand-go15-vendor/)
