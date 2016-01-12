
fork了一份[副本](https://github.com/doubility-sky/skynet)到[本组织](https://github.com/doubility-sky)   
~~是否需要将本页wiki内容转移至相关的[wiki页面](https://github.com/doubility-sky/skynet/wiki)？~~   
算了，暂时还是在这里汇总为主吧。

# 资料汇总
- https://github.com/cloudwu/skynet/wiki    
  **官方git库wiki**，信息量大，内容详实。
- http://blog.codingnow.com/eo/skynet/   
  **云风的博客skynet标签**，第一作者描述下的发展历史，信息量大。  
  倒序阅读，一窥详尽发展。  
- http://gad.qq.com/content/coursedetail?id=467  
  腾讯游戏开发者平台讲堂 - “云风：基于 Actor 模式的开源框架”    
  视频开头所提到的 [The Free Lunch Is Over](http://www.gotw.ca/publications/concurrency-ddj.htm)  
- http://gad.qq.com/article/detail/5257  
  “云风：基于 Actor 模式的开源框架” ppt

#### 其他
- https://github.com/wangdali/skynet-note/tree/master/doc  
  wangdaili的github，两个简明 pdf
- http://skynetclub.github.io/skynet/resource.html  
  大杂烩收集，比较乱


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

# Lua
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
- http://blog.codingnow.com/2014/06/skynet_cluster.html
- 如果你仅仅是单台物理机的计算能力不足，那么最优的策略是选用更多核心的机器。
- 在同一进程内，skynet 可以保持最高的并行能力，充分利用物理机的多核心，远比增加物理机性价比高得多。
- 当单台机器的处理能力达到极限后，可以考虑通过内置的 master/slave 机制来扩展。

### Master/Slave 
- 对单台物理机计算能力不足情况下的补充
- 整个网络中任意一个节点都必须正常工作，节点间的联系也不可断开。  
    1. 这就好比你一台物理机上如果插了多块 CPU ，任意一个损坏都会导致整台机器不能正常工作一样。
    2. 不要把这个模式用于跨机房的组网，所有 slave 节点都应该在同一局域网内。

##### 节点
- 每个 skynet 节点有不同的 id 。  
- 允许 255 个 skynet 节点部署在不同的机器上协作
- 每个节点都是一个 slave
- 选某个slave配置standalone来启动一个cmaster 服务，该节点同时为master
- master 节点用于协调 slave 组网

##### harbor
- http://blog.codingnow.com/2014/06/skynet_harbor_redesign.html
- 通讯由一个独立的 harbor 服务来完成  
- harbor id 用 handle 高8位来标记
- 每个消息包产生的时候，skynet 框架会把自己的 harbor id 编码到源地址（handle）的高 8 位

### Cluster
- 多组 Master/Slave 网络。
- 部署多组 master/slave 网络，然后再用 cluster 将它们联系起来。
- 比较简单的结构是，每个集群中每个节点都配置为单节点模式（将 harbor id 设置为 0）。

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

# Snax
- https://github.com/cloudwu/skynet/wiki/Snax
- 一个方便 skynet 服务实现的简单框架。Snax: Sn-Skynet; ax-???
- http://blog.codingnow.com/2015/11/rpc.html   
  RPC 之恶 - *snax 是对 skynet api 做的一个 rpc 封装，原意是让使用的人门槛更低。但...*

# Run Skynet
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
- http://blog.codingnow.com/2013/06/skynet_watchdog.html  
  skynet 下的用户登陆问题 - *今天收到一个朋友的邮件，他们使用 skynet 框架的游戏上线后遇到一些问题...*
- http://blog.codingnow.com/2012/10/bug_and_lockfree_queue.html  
  并发问题 bug 小记 - *在用机器人对我们的服务器做压力测试时的一个异常状况：机器人都在线的时候，CPU 占用率不算特别高。但是一旦所以机器人都被关闭，系统空跑时，CPU 占用率反而飚升上去。...*