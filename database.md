A [database](https://en.wikipedia.org/wiki/Database) is an organized collection of data, generally stored and accessed electronically from a computer system. Where databases are more complex they are often developed using formal design and modeling techniques.




# [Relational Database](https://en.wikipedia.org/wiki/Relational_database)
A relational database is a digital database based on the relational model of data, as proposed by E. F. Codd in 1970. A software system used to maintain relational databases is a relational database management system (RDBMS). Many relational database systems have an option of using the SQL (Structured Query Language) for querying and maintaining the database.

### Relational Database Management System (RDMBS)
- [[MySQL]]
- [[PostgreSQL]]
- [SQLite](https://www.sqlite.org/index.html) is an in-process library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine. The code for SQLite is in the public domain and is thus free for use for any purpose, commercial or private. SQLite is the most widely deployed database in the world with more applications than we can count, including several high-profile projects.
  - [db_tutorial](https://github.com/cstack/db_tutorial) Writing a sqlite clone from scratch in C https://cstack.github.io/db_tutorial
- [TiDB](https://github.com/pingcap/tidb) is an open source distributed HTAP database compatible with the MySQL protocol https://pingcap.com

### [SQL](https://en.wikipedia.org/wiki/SQL)
SQL (/ˌɛsˌkjuːˈɛl/ ( listen) S-Q-L, /ˈsiːkwəl/ "sequel"; Structured Query Language) is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS).
- [Quick SQL Cheatsheet](https://github.com/enochtangg/quick-SQL-cheatsheet), A quick reminder of all SQL queries and examples on how to use them.
- [SQL 命名约定](https://launchbylunch.com/posts/2014/Feb/16/sql-naming-conventions/) 数据库的表和字段怎么起名？这也是一门学问。下面是数据库的一些命名原则。
  > * __小写__。标识符应该全部用小写字母来书写，使用`first_name`，不是`"First_Name"或者"FirstName"`。
  > * __数据类型不是名称__。避免使用仅为数据类型的名字（如`text`或`timestamp`）。
  > * __强调单独的单词__。由多个单词组成的对象名称应该用下划线分隔，例如使用`word_count`或`team_member_id`，而不是`wordcount`或`wordCount`。
  > * __完整的单词，而不是缩写__。例如使用`middle_name`，不是`mid_nm`。
  > * __使用常用缩写__。对于几个长词而言，缩写词比词本身更为常见，比如`i18n`和`l10n`，这时使用缩写。




# [NoSQL](http://nosql-database.org/)
NoSQL, which stand for "not only SQL," is an alternative to traditional relational databases in which data is placed in tables and data schema is carefully designed before the database is built. NoSQL databases are especially useful for working with large sets of distributed data.
- https://en.wikipedia.org/wiki/NoSQL
### Documentation Store
- [[mongodb]]
### Key-Value Cache/Store
- [Memcached](https://github.com/memcached/memcached) is a high performance multithreaded event-based key/value cache store intended to be used in a distributed system.
- [[redis]]
  - [Ledisdb](https://github.com/siddontang/ledisdb) is a high-performance NoSQL database, similar to Redis, written in Go. It supports many data structures including kv, list, hash, zset, set.
  - [SSDB](https://github.com/ideawu/ssdb) is a high performace key-value(key-string, key-zset, key-hashmap) NoSQL database, an alternative to Redis.
- [LevelDB](https://github.com/google/leveldb) is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.
  - [rocksdb](https://github.com/facebook/rocksdb) A library that provides an embeddable, persistent key-value store for fast storage. http://rocksdb.org
- [TiKV](https://github.com/tikv/tikv) is an open-source, distributed, and transactional key-value database. Unlike other traditional NoSQL systems, TiKV not only provides classical key-value APIs, but also transactional APIs with ACID compliance. Built in Rust and powered by Raft, TiKV was originally created to complement TiDB
### [Wide Column Store](https://en.wikipedia.org/wiki/Wide_column_store)
- [Apache HBase](https://github.com/apache/hbase) is an open-source, distributed, versioned, column-oriented store modeled after Google' [Bigtable: A Distributed Storage System for Structured Data](https://ai.google/research/pubs/pub27898) by Chang et al.   
  Just as Bigtable leverages the distributed data storage provided by the Google File System, HBase provides Bigtable-like capabilities on top of Apache Hadoop.



# Tools
- [usql](https://github.com/xo/usql) A universal command-line interface for PostgreSQL, MySQL, Oracle Database, SQLite3, Microsoft SQL Server, and many other databases including NoSQL and non-relational databases!



# Practice
- 谈谈陌陌争霸在数据库方面踩过的坑
  - [前篇](https://blog.codingnow.com/2014/03/mmzb_db.html)，[排行榜篇](https://blog.codingnow.com/2014/03/mmzb_db_2.html)，[芒果篇](https://blog.codingnow.com/2014/03/mmzb_mongodb.html)，[Redis 篇](https://blog.codingnow.com/2014/03/mmzb_redis.html)
