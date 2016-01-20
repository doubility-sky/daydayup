# Skynet 源码文件解析
- 列表于 2016-01-14 以tree命令导出 
- 不必要的文件没有列出，如：3rd/ 中的具体文件等
- 这里是 [[skynet]] 页面的 [source struct](https://github.com/doubility-sky/daydayup/wiki/skynet#source-architecture) 章节的扩展阅读
- 未给出注释的，可在本wiki页内搜索相关主题

```C
Skynet
│  
│  .gitignore
│  .gitmodules
│  HISTORY.md
│  LICENSE
│  Makefile
│  platform.mk
│  README.md
│  
├─3rd        // 第三方库
│  ├─jemalloc    // 可选是否hook的，高效内存分配库
│  ├─lpeg        // lua 的模式匹配库
│  ├─lua         // lua5.3 修改版 
│  └─lua-md5
│          
├─examples    // 示例
│  │  abort.lua
│  │  agent.lua
│  │  client.lua
│  │  cluster1.lua
│  │  cluster2.lua
│  │  clustername.lua
│  │  config
│  │  config.c1
│  │  config.c2
│  │  config.login
│  │  config.mc
│  │  config.mysql
│  │  config.userlog
│  │  config_log
│  │  globallog.lua
│  │  injectlaunch.lua
│  │  main.lua
│  │  main_log.lua
│  │  main_mysql.lua
│  │  preload.lua
│  │  proto.lua
│  │  protoloader.lua
│  │  share.lua
│  │  simpledb.lua
│  │  simplemonitor.lua
│  │  simpleweb.lua
│  │  userlog.lua
│  │  watchdog.lua
│  │  
│  └─login
│          client.lua
│          gated.lua
│          logind.lua
│          main.lua
│          msgagent.lua
│          
├─lualib    // lua 实现的程序库 
│  │  cluster.lua
│  │  datacenter.lua
│  │  dns.lua
│  │  loader.lua
│  │  md5.lua
│  │  mongo.lua
│  │  mqueue.lua
│  │  multicast.lua
│  │  mysql.lua
│  │  redis.lua
│  │  sharedata.lua
│  │  sharemap.lua
│  │  skynet.lua
│  │  snax.lua
│  │  socket.lua
│  │  socketchannel.lua
│  │  sproto.lua
│  │  sprotoloader.lua
│  │  sprotoparser.lua
│  │  
│  ├─http
│  │      httpc.lua
│  │      httpd.lua
│  │      internal.lua
│  │      sockethelper.lua
│  │      url.lua
│  │      
│  ├─sharedata
│  │      corelib.lua
│  │      
│  ├─skynet
│  │      coroutine.lua
│  │      debug.lua
│  │      harbor.lua
│  │      inject.lua
│  │      injectcode.lua
│  │      manager.lua
│  │      queue.lua
│  │      remotedebug.lua
│  │      
│  └─snax    
│          gateserver.lua
│          hotfix.lua
│          interface.lua
│          loginserver.lua
│          msgserver.lua
│          
├─lualib-src        // C 实现的动态库，供 Lua 调用
│  │  lsha1.c
│  │  lua-bson.c                  // 类 JSON
│  │  lua-clientsocket.c          // It's only for demo, limited feature.
│  │  lua-cluster.c
│  │  lua-crypt.c                 // 加密算法 
│  │  lua-debugchannel.c
│  │  lua-memory.c
│  │  lua-mongo.c                 // mongo driver
│  │  lua-multicast.c             // multicast core
│  │  lua-mysqlaux.c              // mysql driver
│  │  lua-netpack.c               // 网络封包
│  │  lua-profile.c               // 性能分析工具？
│  │  lua-seri.c , lua-seri.h     // 序列化
│  │  lua-sharedata.c
│  │  lua-skynet.c                // skynet core
│  │  lua-socket.c
│  │  lua-stm.c                   // Software transactional memory
│  │  
│  └─sproto
│          
├─service        // lua 实现的服务，供 snlua 服务启动
│      bootstrap.lua
│      cdummy.lua
│      clusterd.lua
│      clusterproxy.lua
│      cmaster.lua
│      cmemory.lua
│      console.lua
│      cslave.lua
│      datacenterd.lua
│      dbg.lua
│      debug_agent.lua
│      debug_console.lua
│      gate.lua
│      launcher.lua
│      multicastd.lua
│      service_mgr.lua
│      sharedatad.lua
│      snaxd.lua
│      
├─service-src        // C 实现的服务
│      databuffer.h        // 数据缓冲 - 暂只有 service_gate.c 使用
│      hashid.h            // 哈希结构与算法实现 - 暂只有 service_gate.c 使用
│      service_gate.c      // 网关服务 - 管理socket (*已经不是核心组件. 建议直接用 socket 库编写你需要的业务.)
│      service_harbor.c    // 港口服务 - 节点间的通讯
│      service_logger.c    // 日志服务 - 最简洁的C服务实现
│      service_snlua.c     // *Lua服务 - 加载lua实现的服务
│      
├─skynet-src        // Skynet 核心
│      atomic.h , rwlock.h , spinlock.h     // 同步机制: 原子操作/读写锁/自旋锁
│      luashrtbl.h                          // 似对 3rd 中 lua修改版 所用? 
│      malloc_hook.c , malloc_hook.h , skynet_malloc.h  // 内存分配管理 hooker
│      skynet.h                     // *核心接口，主要实现自skynet_server.c，skynet_error.c，malloc_hook.c，skynet_timer.c 
│      skynet_daemon.c , skynet_daemon.h    // pid 管理？
│      skynet_env.c , skynet_env.h          // 记录config中lua数据，导出setenv/getenv接口。（可见配置方式，底层标配为lua）
│      skynet_error.c                       // 错误处理实现，由 skynet.h 导出API
│      skynet_handle.c , skynet_handle.h    // 服务唯一标识管理
│      skynet_harbor.c , skynet_harbor.h    // 节点之间的通讯
│      skynet_imp.h , skynet_main.c  -->  skynet_start.c   // 启动 skynet
│      skynet_log.c , skynet_log.h          // 日志
│      skynet_module.c , skynet_module.h    // 加载C动态链接库中的服务
│      skynet_monitor.c , skynet_monitor.h  // 监控
│      skynet_mq.c , skynet_mq.h            // 消息队列
│      skynet_server.c , skynet_server.h    // 服务的创建，加载，分发...
│      skynet_socket.c , skynet_socket.h    // socket API
│      skynet_timer.c , skynet_timer.h      // 定时器
│      (socket_epoll.h , socket_kqueue.h) --> socket_poll.h    // 定义 linux/BSD API 供 socket_server.c 使用
│      socket_server.c , socket_server.h    // 异步网络模型, 供 skynet_socket 使用
│      
└─test
```