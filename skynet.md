
fork了一份[副本](https://github.com/doubility-sky/skynet)到[本组织](https://github.com/doubility-sky)   
~~是否需要将本页wiki内容转移至相关的[wiki页面](https://github.com/doubility-sky/skynet/wiki)？~~   
算了，暂时还是在这里汇总为主吧。


# 设计理念
- 作者的设计综述：http://blog.codingnow.com/2012/09/the_design_of_skynet.html
- 单进程多线程  
- 核心功能：服务    
- 主张所有的服务都在同一个 OS 进程中协作完成
- 核心层内，不考虑跨机通讯的机制
- 不为单独一个服务的崩溃，重启等提供相应的支持 （**任其崩溃哲学**）

### Actor model
- Wikipedia: https://en.wikipedia.org/wiki/Actor_model
- http://ifeve.com/concurrency-modle-seven-week-actor-5/  
  《七周七并发模型》第五章Actor总结，鞭辟入里。  
  PS：这书看上去不错，可以入手。
- http://www.infoq.com/cn/news/2014/11/intro-actor-model  
  以“邮件往来”方式解释actor交互模型，比喻生动，易理解


# 服务 Service
#### 定义
- 从动态库（so 文件）中启动起来的一个符合规范的 C 模块，改模块称为服务。
- 每个服务都是被一个个消息包驱动，当没有包到来的时候，它们就会处于挂起状态，对 CPU 资源零消耗。

#### 属性
- 绑定有一个永不重复（即使模块退出）的数字 id 做为其 handle
- handle 的最终限制在 24bit 内，也就是 16M 个。  
- handle 高8位，保留给集群间通讯用的。

#### 行为
- 可以向 Skynet 框架注册一个 callback 函数，用来接收发给它的消息。
- 服务间可以自由发送消息

#### 扩展
- 如需自主逻辑，可用 Skynet 系统提供的 timeout 消息，定期触发。

# 集群
- https://github.com/cloudwu/skynet/wiki/Cluster  

#### 节点
- 每个 skynet 节点有不同的 id 。  
- 允许 255 个 skynet 节点部署在不同的机器上协作
- 每个节点都是一个 slave
- 选某个slave配置standalone来启动一个cmaster 服务，该节点同时为master
- master 节点用于协调 slave 组网

#### harbor
- 通讯由一个独立的 harbor 服务来完成  
- harbor id 用 handle 高8位来标记
- 每个消息包产生的时候，skynet 框架会把自己的 harbor id 编码到源地址（handle）的高 8 位


# 参考文献
- https://github.com/cloudwu/skynet/wiki    
  Skynet Wiki 直接看有点儿云里雾里。
- http://blog.codingnow.com/eo/skynet/   
  云风的博客skynet标签，信息量大  
- https://github.com/wangdali/skynet-note/tree/master/doc  
  wangdaili的github，两个简明 pdf:
- http://skynetclub.github.io/skynet/resource.html  
  大杂烩收集，比较乱

## 学习日志
- [[skynet learn qhl]]
