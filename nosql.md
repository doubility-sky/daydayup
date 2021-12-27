[NoSQL](http://nosql-database.org/), which stand for "not only SQL," is an alternative to traditional relational databases in which data is placed in tables and data schema is carefully designed before the database is built. NoSQL databases are especially useful for working with large sets of distributed data.
- https://en.wikipedia.org/wiki/NoSQL



## Learn
- [Your Ultimate Guide to the Non-Relational Universe!](https://hostingdata.co.uk/nosql-database/)



## Practice
- 谈谈陌陌争霸在数据库方面踩过的坑
  - [前篇](https://blog.codingnow.com/2014/03/mmzb_db.html)
  - [排行榜篇](https://blog.codingnow.com/2014/03/mmzb_db_2.html)
  - [芒果篇](https://blog.codingnow.com/2014/03/mmzb_mongodb.html)
  - [Redis 篇](https://blog.codingnow.com/2014/03/mmzb_redis.html)



## Documentation Store
- [[mongodb]]



## Key-Value Cache/Store
- [Memcached](https://github.com/memcached/memcached) is a high performance multithreaded event-based key/value cache store intended to be used in a distributed system.
- [[redis]]
  - [Ledisdb](https://github.com/siddontang/ledisdb) is a high-performance NoSQL database, similar to Redis, written in Go. It supports many data structures including kv, list, hash, zset, set.
  - [SSDB](https://github.com/ideawu/ssdb) is a high performace key-value(key-string, key-zset, key-hashmap) NoSQL database, an alternative to Redis.
- [LevelDB](https://github.com/google/leveldb) is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.
  - [rocksdb](https://github.com/facebook/rocksdb) A library that provides an embeddable, persistent key-value store for fast storage. http://rocksdb.org
- [TiKV](https://github.com/tikv/tikv) is an open-source, distributed, and transactional key-value database. Unlike other traditional NoSQL systems, TiKV not only provides classical key-value APIs, but also transactional APIs with ACID compliance. Built in Rust and powered by Raft, TiKV was originally created to complement [[TiDB]]



## [Wide Column Store](https://en.wikipedia.org/wiki/Wide_column_store)
- [Apache HBase](https://github.com/apache/hbase) is an open-source, distributed, versioned, column-oriented store modeled after Google' [Bigtable: A Distributed Storage System for Structured Data](https://ai.google/research/pubs/pub27898) by Chang et al.   
  Just as Bigtable leverages the distributed data storage provided by the Google File System, HBase provides Bigtable-like capabilities on top of Apache Hadoop.

