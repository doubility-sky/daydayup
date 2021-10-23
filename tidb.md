[TiDB](https://github.com/pingcap/tidb) (/’taɪdiːbi:/, "Ti" stands for Titanium) is an open-source, distributed, NewSQL database that supports Hybrid Transactional and Analytical Processing (HTAP) workloads. It is [[MySQL]] compatible and features horizontal scalability, strong consistency, and high availability. TiDB can be deployed on-premise or in-cloud.

- [Official Website](https://pingcap.com/en/)
- [PingCAP University](https://university.pingcap.com/)
- [[mysql]]



## Learn
- [Documents](https://docs.pingcap.com/tidb/stable) - [zh-CN](https://docs.pingcap.com/zh/tidb/stable)
- [Blog-cn](https://pingcap.com/blog-cn/)
- 三篇文章了解 TiDB 技术内幕 - [说存储](https://pingcap.com/zh/blog/tidb-internal-1), [说计算](https://pingcap.com/zh/blog/tidb-internal-2), [谈调度](https://pingcap.com/zh/blog/tidb-internal-3)
- [TiDB Community Presentations](https://github.com/pingcap/presentations)
- [TiDB 精英进阶计划](https://www.bilibili.com/video/BV1pp4y1X7UQ) - [PPTs](https://github.com/pingcap/presentations/tree/master/TiDB-Elite-Training-Camp)
- [开源分布式数据库 TiDB 如何炼成？](https://www.infoq.cn/article/ufembtvyjwmuqtgwtmci)

### books
- [TiDB in Action](https://book.tidb.io/)

### architecture
- [势高，则围广：TiDB 的架构演进哲学](https://www.infoq.cn/article/Qw_8ubZFgtQlcZmZHBlA)
- [十问 TiDB ：关于架构设计的一些思考](https://pingcap.com/blog-cn/10-questions-tidb-structure/)
- [TiDB 整体架构](https://book.tidb.io/session1/chapter1/tidb-architecture.html)

### details
- [TiKV 是如何存取数据的](https://pingcap.com/blog-cn/how-tikv-store-get-data/)

### practice
- [TiDB 最佳实践](https://docs.pingcap.com/zh/tidb/stable/tidb-best-practices)
- [客户案例](https://pingcap.com/zh/case/)
  - [精选实践汇总1](https://asktug.com/t/topic/34701), [精选实践汇总2](https://asktug.com/t/topic/69927)
  - [TiDB 在知乎万亿量级业务数据下的实践和挑战](https://zhuanlan.zhihu.com/p/71023604)
  - [新一代数据库 TiDB 在美团的实践](https://tech.meituan.com/2018/11/22/mysql-pingcap-practice.html)
  - [网易互娱的数据库选型和 TiDB 应用实践](https://www.infoq.cn/article/umuBqMCpWWGo4QYMksc0)
  - [我们为什么放弃 MongoDB 和 MySQL，选择 TiDB - 伴鱼技术团队](https://new.qq.com/omn/20200728/20200728A081CU00.html)
  - [TiDB 在茄子科技的应用实践及演进](https://pingcap.com/zh/blog/devcon-2021-shareit)



## Projects
- [TiKV](https://github.com/tikv/tikv) is an open-source, distributed, and transactional key-value database. Unlike other traditional NoSQL systems, TiKV not only provides classical key-value APIs, but also transactional APIs with ACID compliance. Built in Rust and powered by Raft, TiKV was originally created to complement TiDB
- [PD](https://github.com/tikv/pd) is the abbreviation for Placement Driver. It is used to manage and schedule the TiKV cluster.
- [TLA+](https://github.com/pingcap/tla-plus) is a formal specification and verification language to help engineers design, specify, reason about, and verify complex software and hardware systems. It is widely used to verify the algorithms in distributed systems.



## FAQ
- [Ask TiDB User Group](https://asktug.com/): AskTUG-开源分布式_HTAP_数据库 - TiDB_问答
- [OLAP与OLTP介绍](https://developer.aliyun.com/article/345453)
- [TiDB 读、写性能慢问题排查思路汇总](https://asktug.com/t/topic/95104)
