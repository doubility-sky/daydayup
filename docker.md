[Docker](https://www.docker.com/) is a set of [platform as a service](https://en.wikipedia.org/wiki/Platform_as_a_service) (PaaS) products that use [OS-level virtualization](https://en.wikipedia.org/wiki/OS-level_virtualization) to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, [libraries](https://en.wikipedia.org/wiki/Library_(computing)) and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single [operating system kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)) and therefore use fewer resources than [virtual machines](https://en.wikipedia.org/wiki/Virtual_machine).



## Learn
- Official [docker docs](https://docs.docker.com/)
- [Docker guide](https://www.robertcooper.me/docker-guide)
- [Docker Curriculum](https://github.com/prakhar1989/docker-curriculum)🐬 A comprehensive tutorial on getting started with Docker!
- [Docker 入门教程](http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
- [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)

### [[kubernetes]]
- [10 分钟看懂 Docker 和 K8S](https://zhuanlan.zhihu.com/p/53260098)

### 针对 GFW
- 使用 [DaoCloud](https://dashboard.daocloud.io/nodes/new)，选择自己的主机，安装好后就是从 DaoCloud 拉取 images 了。

### 制作尽可能小的镜像
- 选择最小的适合的 image 开始，比如 golang，就直接使用

        FROM golang:latest

- 尽可能压缩会生成文件的命令调用，因为每一个 Dockerfile 命令，都会建立一个版本镜像，所以尽量将 `COPY` `ADD` `CMD` `RUN` 等命令归到一行，比如

        RUN go install agent
        RUN rm -rf pkg src .godeps

    就要合并成一行

        RUN go install agent && rm -rf pkg src .godeps

- 使用 .dockerignore，这败家玩意儿，简直活脱脱就是个 .gitignore，语法姨妈一样，一般 build golang 会这么写

        COPY .godeps /go/.godeps
        COPY src /go/src

    相应的 .dockerignore 这么写

        .git
        pkg
        bin
        .godeps/pkg
        .godeps/bin



## Tools
- [DockerSlim](https://github.com/docker-slim/docker-slim) (docker-slim): Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source) https://dockersl.im



## Resources
- [Awesome Docker](https://github.com/veggiemonk/awesome-docker)🐳 A curated list of Docker resources and projects
