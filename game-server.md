A [game server](https://en.wikipedia.org/wiki/Game_server) (also sometimes referred to as a host) is a [server](https://en.wikipedia.org/wiki/Server_(computing)) which is the authoritative source of events in a [multiplayer video game](https://en.wikipedia.org/wiki/Multiplayer_video_game). The server transmits enough data about its internal state to allow its connected [clients](https://en.wikipedia.org/wiki/Client_(computing)) to maintain their own accurate version of the game world for display to players. They also receive and process each player's input.



## Learn
- [游戏服务端架构发展史（上）](http://www.skywind.me/blog/archives/1265)
- [游戏服务端架构发展史（中）](http://www.skywind.me/blog/archives/1301)
- [游戏服务端架构发展史（下）](http://www.skywind.me/blog/archives/1327) 已太监
- [游戏服务器从入门到关门](https://zhuanlan.zhihu.com/c_1265419283598987264)



## Practice
- [游戏服务器技术与架构文集](https://www.jianshu.com/c/5121fd868c4f)
- [某百万DAU游戏的服务端优化工作](https://www.gameres.com/879458.html)
- [《江湖X:汉家江湖》两万人在线服务器架构](https://www.gameres.com/770107.html)

### login/auth
- [安全的提交密码](https://blog.codingnow.com/2008/01/diffie_hellman.html)
- [登陆认证系统](https://blog.codingnow.com/2012/12/user_authentication.html)

### [[database]]
- 谈谈陌陌争霸在数据库方面踩过的坑
  - [前篇](https://blog.codingnow.com/2014/03/mmzb_db.html) <details> <summary>View details</summary>
    - > 数据库在实时交互性较强的在线游戏中，主要起的是一个数据备份容灾的作用。很少会将其用于数据交换。而在其它领域，很多开发者则选择把数据库作为业务模块间的数据交换，带着这个思路来做游戏，往往会带来很严重的性能问题。  
    理论上，由于游戏服务器往往 7 * 24 小时持续工作，且玩家具有强交互性，大部分游戏世界里的数据都一直存在于内存中。  
    传统 MMORPG 游戏需要消耗的内存是 O(n) 的，n 和总用户数相关。虽然同时玩游戏的用户数（活跃用户数）有限，很难持续增长；但总用户数的确是随时间增长的。我们只要把 n 从总用户数变成活跃用户数后，基本就能维持内存的需求。  
    最简单的做法是，当一个用户不活跃后，就把这部分数据落地（写入磁盘），当他有一天又变得活跃后，再从磁盘加载回来。在端游早期，用户活跃的标准就是他是否在线。我们在用户上线的时候加载他的数据，离线的时候将数据落地即可。从开发角度看，数据如何保存，最简单的方法不是使用数据库，而是以用户 id 为文件名，把用户数据序列化成文本写入文件系统即可。  
    - > 既然数据都在你系统的内存中，总可以写出对应的算法去处理它们吧？明白了这一点，就能明白为什么在大多数在线游戏系统中，选用怎样的数据库就不是什么重要的问题了。  
    一个在线游戏的运营还是需要大量的游戏内数据分析的。本着不同的业务逻辑尽量分离的原则，我们还是需要把游戏内的数据输出出来，交给专业的系统，专业的人来处理。这一部分的数据量远大于游戏系统为玩家服务时所需要的量。我认为它的空间复杂度是 O(n * m) 的。其中有两个维度，一是玩家的总数，二是运营的时间。游戏服务器需要把运营过程中的数据吐出，保存到可以处理这么大数据量的数据库中去。我们把这部分数据称为运营 log
    - 陌陌争霸在服务器方面的选型和构架按着这个思路做出来：
      - 使用了 32 个 redis 仓库保存玩家的数据，按玩家 id 分开存放在 4 台机器上，每台机器 8 个 redis 进程
      - 可以在用户数量较少的时候，把多个 redis 仓库部署在同一台物理机上，再随着用户规模扩大而分开部署。如果 32 个仓库不够的话，进一步细分也不会是难事。
      - 前三个月，不太考虑冷热数据的问题，这个期间还谈不上流失玩家，所有玩家数据都是热数据。由于开发时间紧迫，把冷数据处理留到后期再处理。
      - 数据落地的问题，redis 已有 bgsave 的能力，只需要细调就好了。
      - 运营 log 和一些随时间自然增长的数据，比如战斗录像，选择了不受内存限制，且易于做数据分析的 mongodb 。由于担心数据量过大，使用了 mongos 分片。
    </details>
  - [排行榜篇](https://blog.codingnow.com/2014/03/mmzb_db_2.html) <details> <summary>View details</summary>
    - > 为什么大部分网络服务都需要一个数据库在后台支撑整个系统？  
      这通常是因为大部分系统的一个运行周期都很短，对于传统的网站服务来说，从收到一个 HTTP 请求开始，到终端用户收到这个请求的结果为止，就是一个运行周期。而其间可能处理的数据集是很大的，通常没有时间（甚至没有空间）把所有数据都加载到内存，处理其中涉及的一小部分，然后保存在磁盘上再退出。  
      当数据量巨大时，任何对数据的操作的算法和数据结构都需要精心设计，这不是随便一个程序员就可以轻松完成的任务。尤其是数据量大到超过内存容量时，很多算法和数据结构对大部分非此领域的程序员来说都是陌生的。本着专业的事情交给专业的人来做的原则，一般系统都会把这部分工作交给独立的数据库来完成。  
      对数据的操作只有抽象的足够简单，系统才能健壮，这便有了 SQL 语言做一层抽象，让数据管理的工作可以独立出来。甚至于你想牺牲一部分的特性来提高性能，还可以选用近年来流行的各种 NOSQL 数据库。
    - > 可在 MMO 游戏服务器领域，事情发生了一点点变化。  
      数据和业务逻辑是密切相关的，改变非常频繁。MMO 服务器需要持续快速的响应用户的请求。我们几乎不可能把一切数据都放在独立的数据库中，比如玩家在虚拟世界中的位置，以及他所影响的其他玩家的列表；玩家战斗时的各种属性变化，还有和玩家互动的那些 NPC 的状态改变……  
      最大的矛盾是：MMO 游戏中数据集的改变不再是简单的 SQL 可以表达的东西，不可能交给数据库服务期内部完成。无论什么类型的数据库，都不是为这种应用设计的。如果你硬要套用其它领域的应用模式的话，游戏服务器只能频繁的把各种数据从数据库中读出来，按游戏逻辑做出改变，再写回去。数据库变成了一个很低效的数据中转中心，无论你是否使用内存数据库，都改变不了这个低效的本质。
    </details>
  - [芒果篇](https://blog.codingnow.com/2014/03/mmzb_mongodb.html) <details> <summary>View details</summary>
    - > 国内很多游戏开发者都不约而同的采用了 mongodb ，这是为什么呢？我的看法是这样的：  
      游戏的需求多变，很难在一开始就把数据结构设计清楚。而游戏领域的许多程序员的技术背景又和其他领域不同。在设计游戏服务器前，他们更多的是在设计游戏的客户端：画面、键盘鼠标交互、UI 才是他们花精力最多的地方。对该怎么使用数据库没有太多了解。这个时候，出现了 mongodb 这样的 NOSQL 数据库。mongodb 是基于文档的，不需要你设计数据表，和动态语言更容易结合。看起来很美好，你只需要把随便一个结构的数据对象往数据库里一塞，然后就祈祷数据库系统会为你搞定其它的事情。如果数据库干的不错，性能不够，那是数据库的责任，和我无关。看到那些评测数据又表明 mongodb 的性能非常棒，似乎没有什么可担心的了。
    - > 数据库系统其实也就是一个管理数据的封闭模块。如果你来管理这些数据，怎样的数据结构更利于满足特定的检索，需要哪些索引数据辅助。  
      最终的问题依旧是算法和数据结构，不同的是，不需要你实现它，而需要你理解它。  
      另外，数据库是被设计成可以并发访问的，而并发永远是复杂的东西。mongodb 缺乏事务操作，需要用文档操作的原子性来模拟。这很容易被没经验的人用错（这是个怪圈，越是没数据库经验的人越喜欢 mongodb ，因为限制少，看起来更自然。）。
    </details>
  - [Redis 篇](https://blog.codingnow.com/2014/03/mmzb_redis.html) <details> <summary>View details</summary>
    - > 我们将数据中心分为 32 个库，按玩家 ID 分开。不同的玩家之间数据是完全独立的。在设计时，我坚决反对了从一个单点访问数据中心的做法，坚持每个游戏服务器节点都要多每个数据仓库直接连接。因为在这里制造一个单点毫无必要。  
      根据我们事前对游戏数据量的估算，前期我们只需要把 32 个数据仓库部署到 4 台物理机上即可，每台机器上启动 8 个 Redis 进程。一开始我们使用 64G 内存的机器，后来增加到了 96G 内存。实测每个 Redis 服务会占到 4~5 G 内存，看起来是绰绰有余的。  
      由于我们仅仅是从文档上了解的 Redis 数据落地机制，不清楚会踏上什么坑，为了保险起见，还配备了 4 台物理机做为从机，对主机进行数据同步备份。
    - > Redis 支持两种 BGSAVE 的策略，一种是快照方式，在发起落地指令时，fork 出一个进程把整个内存 dump 到硬盘上；另一种唤作 AOF 方式，把所有对数据库的写操作记录下来。我们的游戏不适合用 AOF 方式，因为我们的写入操作实在的太频繁了，且数据量巨大。
    - > 第一次事故出在 2 月 3 日，新年假期还没有过去。由于整个假期都相安无事，运维也相对懈怠。  
      中午的时候，有一台数据服务主机无法被游戏服务器访问到，影响了部分用户登陆。在线尝试修复连接无果，只好开始了长达 2 个小时的停机维护。  
      在维护期间，初步确定了问题。是由于上午一台从机的内存耗尽，导致了从机的数据库服务重启。在从机重新对主机连接，8 个 Redis 同时发送 SYNC 的冲击下，把主机击毁了。  
      这里存在两个问题，我们需要分别讨论：  
      问题一：从机的硬件配置和主机是相同的，为什么从机会先出现内存不足。  
      问题二：为何重新进行 SYNC 操作会导致主机过载。  
      - > 问题一当时我们没有深究，因为我们没有估算准确过年期间用户增长的速度，而正确部署数据库。数据库的内存需求增加到了一个临界点，所以感觉内存不足的意外发生在主机还是从机都是很有可能的。从机先挂掉或许只是碰巧而已（现在反思恐怕不是这样, 冷备脚本很可能是罪魁祸首）。早期我们是定时轮流 BGSAVE 的，当数据量增长时，应该适当调大 BGSAVE 间隔，避免同一台物理机上的 redis 服务同时做 BGSAVE ，而导致 fork 多个进程需要消耗太多内存。由于过年期间都回家过年去了，这件事情也被忽略了。  
      - > 问题二是因为我们对主从同步的机制了解不足：  
      仔细想想，如果你来实现同步会怎么做？由于达到同步状态需要一定的时间。同步最好不要干涉正常服务，那么保证同步的一致性用锁肯定是不好的。所以 Redis 在同步时也触发了 fork 来保证从机连上来发出 SYNC 后，能够顺利到达一个正确的同步点。当我们的从机重启后，8 个 slave redis 同时开启同步，等于瞬间在主机上 fork 出 8 个 redis 进程，这使得主机 redis 进程进入交换分区的概率大大提高了。  
      - > 在这次事故后，我们取消了 slave 机。因为这使系统部署更复杂了，增加了许多不稳定因素，且未必提高了数据安全性。同时，我们改进了 bgsave 的机制，不再用定时器触发，而是由一个脚本去保证同一台物理机上的多个 redis 的 bgsave 可以轮流进行。另外，以前在从机上做冷备的机制也移到了主机上。好在我们可以用脚本控制冷备的时间，以及错开 BGSAVE 的 IO 高峰期。
    - > 第二次事故最出现在最近（ 2 月 27 日）。  
      我们已经多次调整了 Redis 数据库的部署，保证数据服务器有足够的内存。但还是出了次事故。事故最终的发生还是因为内存不足而导致某个 Redis 进程使用了交换分区而处理能力大大下降。在大量数据拥入的情况下，发生了雪崩效应：晓靖在原来控制 BGSAVE 的脚本中加了行保底规则，如果 30 分钟没有收到 BGSAVE 指令，就强制执行一次保障数据最终可以落地（对这条规则我个人是有异议的）。结果数据服务器在对外部失去响应之后的半小时，多个 redis 服务同时进入 BGSAVE 状态，吃光了内存。  
      花了一天时间追查事故的元凶。我们发现是冷备机制惹的祸。我们会定期把 redis 数据库文件复制一份打包备份。而操作系统在拷贝文件时，似乎利用了大量的内存做文件 cache 而没有及时释放。这导致在一次 BGSAVE 发生的时候，系统内存使用量大大超过了我们原先预期的上限。  
      这次我们调整了操作系统的内核参数，关掉了 cache ，暂时解决了问题。  
    </details>



## Libraries
- [ValveSoftware/GameNetworkingSockets](https://github.com/ValveSoftware/GameNetworkingSockets) is a basic transport layer for games.



## Freameworks
- [[c]] + [[lua]]
  - [[skynet]]
- [c++](cpp) + [[python]]/[[lua]]
  - [[kbengine]]
  - [NoahGameFrame](https://github.com/ketoo/NoahGameFrame/tree/master-new)
- [game-server by golang](golang#game-server)
- [[javascript]]
  - [colyseus](https://github.com/gamestdio/colyseus), [mage](https://github.com/mage/mage), ~~[[pomelo]]~~



## Projects
- [MaNGOS](https://github.com/mangos/MaNGOS)
- [TrinityCore](https://github.com/TrinityCore/TrinityCore)
- [cuberite](https://github.com/cuberite/cuberite), A lightweight, fast and extensible game server for Minecraft



## Tools
- [GameMode](https://github.com/FeralInteractive/gamemode) is a daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process.



## FAQs
- [使用 Go 语言开发游戏服务端的是如何忍受无法热更新的？](https://www.zhihu.com/question/31912663)



## Resources
- https://github.com/topics/game-server
- [中文游戏服务器资源大全](https://github.com/hstcscolor/awesome-gameserver-cn)

