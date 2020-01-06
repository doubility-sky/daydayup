- http://golang.org/
  - `godoc -http=:6060` 无法穿墙，本地帮忙
- https://talks.golang.org/
- https://github.com/golang/go/wiki



## Learn
- 快速入门：[A Tour of Go](https://tour.golang.org/)，[Go by Example](https://gobyexample.com/) 
- Books：[The Go Programming Language](https://github.com/miguellgt/books/blob/master/go/The.Go.Programming.Language.pdf) 
  - [The Go Programming Language 中文](https://docs.hacknode.org/gopl-zh/)，by [gopl-zh](https://github.com/golang-china/gopl-zh)
  - [Go Web 编程](https://github.com/astaxie/build-web-application-with-golang)
  - [Go1.5源码剖析](https://github.com/qyuhen/book)
  - [深入解析Go](https://github.com/tiancaiamao/go-internals)
- [Go 语言入门资料](http://fuxiaohei.me/2016/6/24/go-start-up.html)
- [Go 开发 HTTP](http://fuxiaohei.me/2016/9/20/go-and-http-server.html)
- [Go Data Structures](https://research.swtch.com/godata)
- [The Golang Standard Library by Example](https://github.com/polaris1119/The-Golang-Standard-Library-by-Example)
- [Go Patterns](https://github.com/tmrts/go-patterns) Curated list of Go design patterns, recipes and idioms http://tmrts.com/go-patterns


#### Standard
- [Effective Go](https://golang.org/doc/effective_go.html)
- [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- [Go编码规范指南](https://gocn.io/article/1)
- https://github.com/uber-go/guide

#### Philosophy
- [Concurrency is not Parallelism](https://blog.golang.org/concurrency-is-not-parallelism) by [Rob Pike](golang/#creators)
  - [Go Concurrency Patterns](https://talks.golang.org/2012/concurrency.slide) 
- [CSP - Communicating Sequential Processes](https://en.wikipedia.org/wiki/Communicating_sequential_processes)  
  - http://www.usingcsp.com/cspbook.pdf by [Hoare](http://c2.com/cgi/wiki?CarHoare)

#### Creators
- [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
- [Rob Pike](http://herpolhode.com/rob/), [wiki](https://en.wikipedia.org/wiki/Rob_Pike), [interview](https://usesthis.com/interviews/rob.pike/), [github](https://github.com/robpike)
- [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer), [github](https://github.com/griesemer)  
- [Russ Cox](http://swtch.com/~rsc/), [interview](http://www.pl-enthusiast.net/2015/03/25/interview-with-gos-russ-cox-and-sameer-ajmani/)  



## Open Source
- https://github.com/avelino/awesome-go
- [[game-client]]
  - [pixel](https://github.com/faiface/pixel) A hand-crafted 2D game library in Go
  - [ebiten](https://github.com/hajimehoshi/ebiten) A dead simple 2D game library in Go https://ebiten.org/
    - [gozelda](https://github.com/ArnaudCalmettes/gozelda) An implementation of a GameBoy era zelda game using Go and Ebiten
  - [Korok](https://github.com/KorokEngine/Korok) is a free lightweight, cross-platform, component-based 2D game engine written in Golang and released under the zlib license. Greatly inspired by bitsquid blog.
  - [oak](https://github.com/oakmound/oak) A pure Go game engine
  - [G3N](https://github.com/g3n/engine) (pronounced "gen") is an OpenGL 3D Game Engine written in Go. It can be used to write cross-platform Go applications that show rich and dynamic 3D representations - not just games. A basic integrated GUI framework is provided, and 3D spatial audio is supported through OpenAL.
- [[game-server]]
  - [gonet](http://gonet2.github.io/)
  - [leaf](https://github.com/name5566/leaf)
  - [goworld](https://github.com/xiaonanln/goworld)
- [Gorilla Web Toolkit](https://github.com/gorilla), Gorilla is a web toolkit for the Go programming language that provides useful, composable packages for writing HTTP-based applications.
- [GopherJS](https://github.com/gopherjs/gopherjs) compiles Go code (golang.org) to pure JavaScript code. Its main purpose is to give you the opportunity to write front-end code in Go which will still run in all browsers.
- [torrent-client](https://github.com/veggiedefender/torrent-client) Tiny BitTorrent client written in Go. Read the blog post: https://blog.jse.li/posts/torrent/



## Tools
- [作为程序员的你，常用的工具软件有哪些？ - 腾讯技术工程的回答 - 知乎](https://www.zhihu.com/question/22867411/answer/911161400)
- vscode + vscode-go 可做跨平台IDE



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
