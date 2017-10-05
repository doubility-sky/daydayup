# 资料汇总
- https://github.com/cloudwu/skynet/wiki    
  **官方git库wiki**，信息量大，内容详实。
- [GettingStarted](https://github.com/cloudwu/skynet/wiki/GettingStarted)  
  最新 [入门指南](http://blog.codingnow.com/2016/06/skynet_gettingstarted.html) 2016-06-07  
- http://blog.codingnow.com/eo/skynet/   
  **云风的博客skynet标签**，第一作者描述下的发展历史，信息量大。  
  倒序阅读，一窥详尽发展。  
- 邮件列表：[skynet-users](https://groups.google.com/forum/#!forum/skynet-users)
- http://gad.qq.com/content/coursedetail?id=467  
  腾讯游戏开发者平台讲堂 - “云风：基于 Actor 模式的开源框架”    
  视频开头所提到的 [The Free Lunch Is Over](http://www.gotw.ca/publications/concurrency-ddj.htm)  
- http://gad.qq.com/article/detail/5257  
  “云风：基于 Actor 模式的开源框架” ppt

#### 其他
- [hello skynet](http://www.jiandan.ren/tag/skynet/) 浅显易懂
- [skynet任务调度分析](http://spartan1.iteye.com/blog/2059120) 内容佳
- [skynet/lua](http://blog.csdn.net/cwqcwk1/article/category/5731833) CSDN blog
- [Skynet-note 注释版](https://github.com/wangdali/skynet-note/tree/master/doc) doc/ 中有两个pdf可以一看 
- [skynet资源收集](http://skynetclub.github.io/skynet/resource.html)  大杂烩，比较乱
- [skynet 阅读笔记](http://my.oschina.net/u/186074/blog/495002)
- [社区qq群主的blog](http://peimin.org/?cat=11)
- [awesome-skynet](https://github.com/m2q1n9/awesome-skynet)
- [skynet club](http://skynetclub.github.io) 《skynet入门实践》

#### Projects
- [skynet 的一个简单范例](http://blog.codingnow.com/2016/06/skynet_sample.html)
- [基于skynet实现的简单mmorpg游戏服务器](https://github.com/jintiao/some-mmorpg)
- [quick](https://github.com/charleeli/quick)

# 概览
### 设计理念
- 作者的设计综述：  
  http://blog.codingnow.com/2012/09/the_design_of_skynet.html
- 单进程多线程  
- 核心功能：服务    
- 主张所有的服务都在同一个 OS 进程中协作完成
- 可以视Skynet为一个简单的操作系统，每个服务都是这个系统中的进程。
- 核心层内，不考虑跨机通讯的机制
- 不为单独一个服务的崩溃，重启等提供相应的支持 （**任其崩溃哲学**）

### Actor model
- Wikipedia: https://en.wikipedia.org/wiki/Actor_model
- http://ifeve.com/concurrency-modle-seven-week-actor-5/  
  《七周七并发模型》第五章Actor总结，鞭辟入里。  
  PS：这书看上去不错，可以入手。
- http://www.infoq.com/cn/news/2014/11/intro-actor-model  
  以“邮件往来”方式解释actor交互模型，比喻生动，易理解

### Source Architecture
- 以下为 Skynet 源码（目录）架构
- 源码文件解析见 [[skynet source files]]
```C
// 未给出注释的，可在本wiki页内搜索相关主题
Skynet (2016-01-14 以tree命令导出, 3rd/jemalloc/ 处有删减)
├─3rd
│  ├─jemalloc   // 可选是否hook的，高效内存分配库 
│  ├─lpeg       // lua 的模式匹配库，看云风的博客[注1]可做解析protocol buffer用 
│  ├─lua        // lua5.3 修改版 (详见后文)
│  └─lua-md5
├─examples      // 示例
│  └─login      
├─lualib        // lua 实现的程序库
│  ├─http
│  ├─sharedata
│  ├─skynet
│  └─snax       // 详见后文
├─lualib-src    // C 实现的动态库，供 Lua 调用
│  └─sproto     // 类 protocol buffer 的精简版
├─service       // lua 实现的 服务(详见后文) ，供 snlua 服务启动
├─service-src   // C 实现的 服务
├─skynet-src    // skynet 核心
└─test
```
> 注  
1.[Proto Buffers in Lua](http://blog.codingnow.com/2010/08/proto_buffers_in_lua.html)

# 服务
#### 定义
- 从动态库（so 文件）中启动起来的一个符合规范的 C 模块，该模块称为服务(service)。
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

#### 其他外部文章
- [skynet任务调度分析](http://spartan1.iteye.com/blog/2059120)
- [skynet服务的本质与缺陷](http://blog.csdn.net/mycwq/article/details/47379277)

# [Lua](http://cloudwu.github.io/lua53doc/)
- https://github.com/cloudwu/skynet/wiki/LuaAPI
- 标配脚本 （虽然云风一再表明可以使用其他脚本，但是Skynet对Lua是天生的友好，弃用就放弃了太多的历史附加好处） 
- 使用 snlua xxx.lua 服务 (此处sn应该是 Skynet 的简写) 来启动lua脚本。
- **不可混用coroutine !!!** https://github.com/cloudwu/skynet/wiki/Coroutine 
- skynet里的coroutine http://blog.codingnow.com/2015/12/skynet_coroutine.html

### Skynet 中的 Lua修改版
- https://github.com/cloudwu/skynet/wiki/CodeCache
- http://blog.codingnow.com/2014/03/lua_shared_proto.html  
  在不同的 lua vm 间共享 Proto

# 集群 
- https://github.com/cloudwu/skynet/wiki/Cluster
- [skynet 的集群方案](http://blog.codingnow.com/2014/06/skynet_cluster.html)
- 如果你仅仅是单台物理机的计算能力不足，那么最优的策略是选用更多核心的机器。
- 在同一进程内，skynet 可以保持最高的并行能力，充分利用物理机的多核心，远比增加物理机性价比高得多。
- 当单台机器的处理能力达到极限后，可以考虑通过内置的 master/slave 机制来扩展。
- master/slave为[旧集群方案](http://blog.codingnow.com/2012/08/skynet_harbor_rpc.html)，**现推荐用**[Cluster](http://blog.codingnow.com/2014/06/skynet_cluster.html) 
- [重新设计并实现了 skynet 的 harbor 模块](http://blog.codingnow.com/2014/06/skynet_harbor_redesign.html)
    + 摘:*此外，对于松散的集群结构，我推荐使用 skynet 的单结点模式，在上层用 tcp 连接互连，并只使用简单的 rpc 协议。在目前的 skynet 版本中，有封装好的 cluster 模块 可供使用。*

### Master/Slave 
- 对单台物理机计算能力不足情况下的补充
- 整个网络中任意一个节点都必须正常工作，节点间的联系也不可断开。  
    1. 这就好比你一台物理机上如果插了多块 CPU ，任意一个损坏都会导致整台机器不能正常工作一样。
    2. 不要把这个模式用于跨机房的组网，所有 slave 节点都应该在同一局域网内。

###### node
- 每个 skynet 节点有不同的 id 。  
- 允许 255 个 skynet 节点部署在不同的机器上协作
- 每个节点都是一个 slave
- 选某个slave配置standalone来启动一个cmaster 服务，该节点同时为master
- master 节点用于协调 slave 组网

###### harbor
- [重新设计并实现了 skynet 的 harbor 模块](http://blog.codingnow.com/2014/06/skynet_harbor_redesign.html)
- 通讯由一个独立的 harbor 服务来完成  
- harbor id 用 handle 高8位来标记
- 每个消息包产生的时候，skynet 框架会把自己的 harbor id 编码到源地址（handle）的高 8 位

### Cluster
- 多组 Master/Slave 网络。
- 部署多组 master/slave 网络，然后再用 cluster 将它们联系起来。
- 比较简单的结构是，每个集群中每个节点都配置为单节点模式（将 harbor id 设置为 0）。
    + 注：云风在[重新设计并实现了 skynet 的 harbor 模块](http://blog.codingnow.com/2014/06/skynet_harbor_redesign.html)一文中有推荐。

# 通讯
- http://blog.codingnow.com/2015/08/skynet_cluster_rpc_limit.html  
  去掉 skynet 中 cluster rpc 的消息长度限制
- http://blog.codingnow.com/2015/01/skynet_netpack.html  
  为什么 skynet 提供的包协议只用 2 个字节表示包长度
- http://blog.codingnow.com/2014/04/skynet_gate_lua_version.html  
  对 skynet 的 gate 服务的重构

**摘要:**  
>&emsp;&emsp;目前 skynet 的 gate 服务约定的协议是，2 字节( 大头编码）表示一个 64K 字节内的数据包，然后接下来就是这个长度的字节数。我曾经考虑过使用 4 字节或 google proto buffer 用的 varint ，但最后都放弃了。  
&emsp;&emsp;考虑到实现的便捷，通常收到长度后，会在内存考虑指定长度的 buffer 等待后续的数据输入。这样，如果有大量攻击者发送超长包头，就会让服务器内存瞬间消进。所以，这种协议只要实现的不小心，很容易变成攻击弱点。  
&emsp;&emsp;注：skynet 最早期的 gate 实现反而没有这个问题。因为它使用了单一的 [ringbuffer](http://blog.codingnow.com/2012/04/mread.html) ，只发送包头却不发送数据的连接会在 ringbuffer 回绕的时候被踢掉。  
&emsp;&emsp;游戏服务器如果只使用一条 TCP 长连接的情况下，单个数据包过大（> 64K），也是不合适的。
大包会阻塞应用逻辑（收取和发送它们都需要很长的时间），如果在应用层有心跳控制的话，也很容易造成心跳超时。所以一般在应用层对大数据包再做上层协议的切割处理。  

# Gate
- 是一个早于 socket API 的解决大量网络链接的实现。
- [Skynet Wiki](https://github.com/cloudwu/skynet/wiki)：*要做到给客户端提供服务，还需要使用 Socket API ，或者使用已经编写好的 GateServer 模板解决大量客户端接入的问题。*
- [设计综述](http://blog.codingnow.com/2012/09/the_design_of_skynet.html)中搜索 gate，云风曾回复道：
    - *gate 现在已经不是核心组件. 建议直接用 socket 库编写你需要的业务.现有 gate 的功能,可以通过阅读 gate 的源码了解.*
    - *PTYPE_CLIENT 是历史遗留的. 原本 gate 服务是先于现在的 socket 模块实现的.PTYPE_CLIENT 是 gate 给外部连接定义出来的消息类型. 有了 socket 模块后, gate 不是必须品, PTYPE_CLIENT 这类消息也不一定有了.*
- [Skynet Wiki: Gate Server](https://github.com/cloudwu/skynet/wiki/GateServer)
    - skynet 提供了一个通用模板 lualib/snax/gateserver.lua 来启动一个网关服务器，通过 TCP 连接和客户端交换数据。
    - service/gate.lua 是一个实现完整的网关服务器，同时也可以作为 snax.gateserver 的使用范例。
        - examples/watchdog.lua 是一个可以参考的例子，它启动了一个 server/gate.lua 服务，并将处理外部连接的消息转发处理。  
        - **注**: 这个模板不可以和 Socket 库一起使用。因为这个模板接管了 socket 类的消息。
- [Skynet Wiki: Socket](https://github.com/cloudwu/skynet/wiki/Socket) 如果你需要一个网关帮你接入大量连接并转发它们到不同的地方处理。
    - service/gate.lua 可以直接使用，同时也是用于了解 skynet 的 socket 模块如何工作的不错的参考。
    - 它还有一个功能近似的，但是全部用 C 编写的版本 service-src/service_gate.c 。

**综上**：所有gate实现可以拿来参考，还是用 [Skynet Wiki: Socket](https://github.com/cloudwu/skynet/wiki/Socket) 来自行按需求来实现业务功能吧。

# Snax
- https://github.com/cloudwu/skynet/wiki/Snax
- 一个方便 skynet 服务实现的简单框架。  
  Snax: Sn-Skynet;  ax-???(猜测是auxiliary)
- http://blog.codingnow.com/2015/11/rpc.html   
  RPC 之恶 - *snax 是对 skynet api 做的一个 rpc 封装，原意是让使用的人门槛更低。但...*   

**综上**：似乎这么一看，snax就拿来看看学习好了，不用太深究。

# 构建
- https://github.com/cloudwu/skynet/wiki/Build
- https://github.com/dpull/skynet-mingw  
  windows 版本，作者初衷是方便策划修改自测使用，不要用作真实项目环境

# 工具
- https://github.com/cloudwu/skynet/wiki/Profile
- https://github.com/cloudwu/skynet/wiki/DebugConsole

# 实战经验谈
### [云风blog的skynet标签](http://blog.codingnow.com/eo/skynet/)
以下*斜体字*为摘要，链接地址上有文章创建的日期（注意时效性，有些或与当前skynet架构不符）
- http://blog.codingnow.com/2015/04/skynet_mmo.html  
  基于 skynet 的 MMO 服务器设计 - *陌陌 带了他们的一个 CP 到我们公司咨询一下 skynet 做 mmo 游戏项目中遇到的一些问题...*
- http://blog.codingnow.com/2014/10/skynet_overload.html  
  skynet 服务的过载保护 - *《天天来战》上了腾讯平台，由于瞬间用户量过大，发现了几个 bug...*
- http://blog.codingnow.com/2014/07/skynet_response.html   
  skynet 中如何实现邮件达到通知服务 - *讨论如何实现一个邮件通知服务...*
- http://blog.codingnow.com/2014/03/mmzb_redis.html  
  谈谈陌陌争霸在数据库方面踩过的坑( Redis 篇) 
- http://blog.codingnow.com/2013/12/skynet_agent_pool.html  
  skynet 服务启动优化 - *手游即将上线，渠道要求我们首日可以承受 20 万同时在线，100 万活跃用户的规模...*
- http://blog.codingnow.com/2013/08/exit_skynet.html  
  如何安全的退出 skynet - *如何安全的退出和业务逻辑相关性很强...*  
- http://blog.codingnow.com/2013/06/skynet_watchdog.html  
  skynet 下的用户登陆问题 - *今天收到一个朋友的邮件，他们使用 skynet 框架的游戏上线后遇到一些问题...*
- http://blog.codingnow.com/2012/10/bug_and_lockfree_queue.html  
  并发问题 bug 小记 - *在用机器人对我们的服务器做压力测试时的一个异常状况：机器人都在线的时候，CPU 占用率不算特别高。但是一旦所以机器人都被关闭，系统空跑时，CPU 占用率反而飚升上去。...*


### issue 摘录
- 开服问题 https://github.com/cloudwu/skynet/issues/560#issuecomment-264356777

# FAQ
- https://github.com/cloudwu/skynet/wiki/FAQ
- [linux安装skynet问题总结](http://www.tuicool.com/articles/6JnAfar)
- If you're running Linux and get compilation errors, make sure you have installed the readline development package (which is probably named `libreadline-dev` or `readline-devel`). If you get link errors after that, then try "make linux MYLIBS=-ltermcap".