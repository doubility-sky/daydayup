http://golang.org/

## 大神设计者们
- [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)  
  C/Unix作者之一，图灵奖得主
- [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike)  
  http://herpolhode.com/rob/  
  https://github.com/robpike  
  https://usesthis.com/interviews/rob.pike/   
- [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer)  
  https://github.com/griesemer  
- Russ Cox  
  http://swtch.com/~rsc/  
  http://www.pl-enthusiast.net/2015/03/25/interview-with-gos-russ-cox-and-sameer-ajmani/  


## 理念与思想
#### 并发 
- http://concur.rspace.googlecode.com/hg/talk/concur.html#landing-slide  
  golang设计者之一[Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike)醍醐灌顶之作  

#### CSP (Communicating sequential processes)  
- https://en.wikipedia.org/wiki/Communicating_sequential_processes  
- Hoare 快速排序，图灵奖得主  
  http://c2.com/cgi/wiki?CarHoare  
  http://www.usingcsp.com/cspbook.pdf  

## 学习资料
- https://tour.golang.org/  
  官方抗鼎之作，玩儿一遍顺畅舒爽  
- https://gobyexample.com/    
  通过简洁例子学习，简单快捷，扫一遍极其快速  
- https://github.com/astaxie/build-web-application-with-golang  
  实体书有出版，电子版免费，国人[astaxie](https://github.com/astaxie)良心作品，开源社区活跃  
- http://www.golang-book.com/  歪果仁写的，质量未知  
- https://jan.newmarch.name/go/  歪果仁写的，质量未知  
- https://github.com/mikespook/Learning-Go-zh-cn 果仁写的，质量未知  


## 开源项目
### game server
- [[gonet]]
- [leaf](https://github.com/name5566/leaf)


## 其他
- 发行闭源go包的办法：http://www.golangtc.com/t/540eaa6e320b527a3b000161 主要思想是将.a和.go文件放在GOROOT下冒充系统库，因为系统库不会主动编译。但其中要注意，.go文件必须定义外部使用的接口，即大写开头的变量和方法，内容可以为空。
