
- https://github.com/wsargent/docker-cheat-sheet
- [10分钟看懂Docker和K8S](https://zhuanlan.zhihu.com/p/53260098)
- [三步开始使用容器开发](https://github.com/xindong/docs/blob/master/public/guide/devops/docker_quick.md)
- [DockerSlim](https://github.com/docker-slim/docker-slim) (docker-slim): Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source) https://dockersl.im



# 注意事项
## 针对GFW
使用[DaoCloud](https://dashboard.daocloud.io/nodes/new)，选择自己的主机，安装好后就是从DaoCloud拉取images了。
## 制作尽可能小的镜像
* 选择最小的适合的image开始，比如golang，就直接使用

        FROM golang:latest

* 尽可能压缩会生成文件的命令调用
因为每一个Dockerfile命令，都会建立一个版本镜像，所以尽量将`COPY` `ADD` `CMD` `RUN`等命令归到一行，比如

        RUN go install agent
        RUN rm -rf pkg src .godeps

    就要合并成一行

        RUN go install agent && rm -rf pkg src .godeps

* 使用.dockerignore
这败家玩意儿，简直活脱脱就是个.gitignore，语法姨妈一样，一般build golang会这么写

        COPY .godeps /go/.godeps
        COPY src /go/src

    相应的.dockerignore这么写

        .git
        pkg
        bin
        .godeps/pkg
        .godeps/bin