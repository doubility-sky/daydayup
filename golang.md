http://golang.org/

## Creators
- [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
- [Rob Pike](http://herpolhode.com/rob/), [wiki](https://en.wikipedia.org/wiki/Rob_Pike), [interview](https://usesthis.com/interviews/rob.pike/), [github](https://github.com/robpike)
- [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer), [github](https://github.com/griesemer)  
- [Russ Cox](http://swtch.com/~rsc/), [interview](http://www.pl-enthusiast.net/2015/03/25/interview-with-gos-russ-cox-and-sameer-ajmani/)  
- https://talks.golang.org/

## Philosophy
#### Concurrency by [Rob Pike](golang/#creators)
- [Go Concurrency Patterns](https://talks.golang.org/2012/concurrency.slide) 
- [Concurrency is not Parallelism](https://blog.golang.org/concurrency-is-not-parallelism)  
#### CSP - [Communicating sequential processes](https://en.wikipedia.org/wiki/Communicating_sequential_processes)  
- http://www.usingcsp.com/cspbook.pdf by [Hoare](http://c2.com/cgi/wiki?CarHoare)

## 学习资料
- https://tour.golang.org/  
  官方抗鼎之作，玩儿一遍顺畅舒爽  
- https://gobyexample.com/    
  通过简洁例子学习，简单快捷，扫一遍极其快速  
- `godoc -http=:6060`
- [Go 语言入门资料](http://fuxiaohei.me/2016/6/24/go-start-up.html)

### 出版书籍
- https://github.com/astaxie/build-web-application-with-golang  
  实体书有出版，电子版免费，国人[astaxie](https://github.com/astaxie)良心作品，开源社区活跃  
- 《深入解析Go》 - https://github.com/tiancaiamao/go-internals
- [Go1.5源码剖析](https://github.com/qyuhen/book)

### http
- [Go 开发 HTTP](http://fuxiaohei.me/2016/9/20/go-and-http-server.html)


## 开源项目
- https://github.com/avelino/awesome-go

### game server
- [[gonet]]
- [leaf](https://github.com/name5566/leaf)

## FAQ
- [理解Go 1.5 vendor](http://tonybai.com/2015/07/31/understand-go15-vendor/)

## 其他
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

## 工具
- vscode + vscode-go 可做跨平台IDE