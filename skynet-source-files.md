# Skynet Source Files
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
│  │  lua-bson.c
│  │  lua-clientsocket.c
│  │  lua-cluster.c
│  │  lua-crypt.c
│  │  lua-debugchannel.c
│  │  lua-memory.c
│  │  lua-mongo.c
│  │  lua-multicast.c
│  │  lua-mysqlaux.c
│  │  lua-netpack.c
│  │  lua-profile.c
│  │  lua-seri.c
│  │  lua-seri.h
│  │  lua-sharedata.c
│  │  lua-skynet.c
│  │  lua-socket.c
│  │  lua-stm.c
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
│      databuffer.h
│      hashid.h
│      service_gate.c
│      service_harbor.c
│      service_logger.c
│      service_snlua.c
│      
├─skynet-src        // Skynet 核心
│      atomic.h
│      luashrtbl.h
│      malloc_hook.c
│      malloc_hook.h
│      rwlock.h
│      skynet.h
│      skynet_daemon.c
│      skynet_daemon.h
│      skynet_env.c
│      skynet_env.h
│      skynet_error.c
│      skynet_handle.c
│      skynet_handle.h
│      skynet_harbor.c
│      skynet_harbor.h
│      skynet_imp.h
│      skynet_log.c
│      skynet_log.h
│      skynet_main.c
│      skynet_malloc.h
│      skynet_module.c
│      skynet_module.h
│      skynet_monitor.c
│      skynet_monitor.h
│      skynet_mq.c
│      skynet_mq.h
│      skynet_server.c
│      skynet_server.h
│      skynet_socket.c
│      skynet_socket.h
│      skynet_start.c
│      skynet_timer.c
│      skynet_timer.h
│      socket_epoll.h
│      socket_kqueue.h
│      socket_poll.h
│      socket_server.c
│      socket_server.h
│      spinlock.h
│      
└─test
```