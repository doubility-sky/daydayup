[PostgreSQL](https://www.postgresql.org/)：开源对象关系数据库，支持事务、MVCC、JSONB、全文检索，可通过扩展增加数据类型、索引和函数。

- [Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL 17 Manual](https://www.postgresql.org/docs/17/index.html)，下文安装示例使用 17，发行版自带软件包的版本可能不同
- [github.com/postgres/postgres](https://github.com/postgres/postgres)，官方 Git 仓库镜像
- 对照：[[mysql]]



## Learn
- [Tutorial](https://www.postgresql.org/docs/17/tutorial.html)，官方入门教程
- [Postgres Guide](http://postgresguide.com/)
- [psql command line tutorial and cheat sheet](https://github.com/tomcam/postgres/)
- [PostgreSQL Exercises](https://pgexercises.com/)，在线 SQL 练习



## Practice
- [Using EXPLAIN](https://www.postgresql.org/docs/17/using-explain.html)，执行计划
- [Monitoring Database Activity](https://www.postgresql.org/docs/17/monitoring.html)，连接、锁、表和索引统计
- [Routine Vacuuming](https://www.postgresql.org/docs/17/routine-vacuuming.html)，理解 VACUUM 和 autovacuum
- [pgbench](https://www.postgresql.org/docs/17/pgbench.html)，自带压测工具；初始化会创建测试表，只在单独的测试库运行



## Installation

### Ubuntu / Debian
- 发行版软件源：
  ```sh
  sudo apt update
  sudo apt install postgresql postgresql-contrib
  sudo systemctl enable --now postgresql
  sudo -u postgres psql
  ```
- 指定大版本用 [PostgreSQL Apt Repository](https://www.postgresql.org/download/linux/ubuntu/)，不要混用不同来源的软件包
- Debian/Ubuntu 的 `postgresql-common` 可管理多个实例：`pg_lsclusters` 查看版本、名称、端口和状态
- 系统用户 `postgres` 和数据库角色 `postgres` 不是同一个概念；上面的命令通过本地 socket，通常使用 `peer` 认证

### macOS
- [Homebrew](https://formulae.brew.sh/formula/postgresql@17)：
  ```sh
  brew install postgresql@17
  brew services start postgresql@17
  export PATH="$(brew --prefix postgresql@17)/bin:$PATH"
  psql -d postgres
  ```
- Homebrew 默认初始化的数据库超级用户通常是当前系统用户名，不一定存在 `postgres` 角色；`-d postgres` 指定的是数据库
- 图形化安装包：[Postgres.app](https://postgresapp.com/)



## Run/Stop
- Ubuntu / Debian：`sudo systemctl start/stop/restart/status postgresql`，斜杠分隔的是可选操作
  - 多实例时操作具体实例，如 `sudo pg_ctlcluster 17 main restart`
- Homebrew：`brew services start/stop/restart postgresql@17`
- 手动管理的实例使用 `pg_ctl -D /path/to/pgdata start`、`pg_ctl -D /path/to/pgdata stop -m fast`；不要与服务管理器混用
  - `fast` 会断开连接、回滚活动事务后正常关闭，不是直接杀进程
- 检查服务是否接受连接：`pg_isready -h 127.0.0.1 -p 5432`；这不代表指定用户能通过认证

### configuration
- 以管理员连接，查询实际路径，不同安装方式的位置不同：
  ```sql
  SHOW config_file;
  SHOW hba_file;
  SHOW data_directory;
  SHOW server_version;
  ```
- `postgresql.conf`：监听地址、内存、日志等；`pg_hba.conf`：哪些连接可以使用哪种认证方式
- 修改后重新加载：`SELECT pg_reload_conf();`
  - 返回 `true` 表示已发出重载信号，不等于所有配置都应用成功；检查日志及当前参数值
  - `listen_addresses`、`port`、`shared_buffers`、`max_connections` 等需要重启
  ```sql
  SELECT name, setting, unit, context, pending_restart
  FROM pg_settings
  WHERE name IN ('listen_addresses', 'port', 'shared_buffers',
                 'max_connections', 'work_mem', 'log_min_duration_statement');
  ```
- `ALTER SYSTEM SET ...` 写入 `postgresql.auto.conf`，会覆盖 `postgresql.conf` 中的同名设置；不要两边反复改

### Remote connection
- `postgresql.conf`，假设数据库服务器内网地址为 `192.168.1.10`：
  ```conf
  listen_addresses = 'localhost,192.168.1.10'
  password_encryption = 'scram-sha-256'
  ```
- `pg_hba.conf`，只允许指定库、角色和来源地址：
  ```conf
  # TYPE  DATABASE  USER      ADDRESS           METHOD
  host    appdb     app_user  192.168.1.20/32    scram-sha-256
  ```
- 规则从上到下，使用第一条匹配项；认证失败不会继续尝试后面的规则
- `password_encryption` 只影响以后设置的密码；旧密码需要重新设置，才能改用 SCRAM
- `peer` 根据本地系统用户名认证；`scram-sha-256` 校验密码；`trust` 不校验密码，不用于远程开放
- 同时检查防火墙/安全组的 5432 端口，来源范围与 HBA 保持一致；不要直接向公网开放
- SCRAM 不加密业务数据。不可信网络还需配置 [TLS](https://www.postgresql.org/docs/17/ssl-tcp.html)，服务端用 `hostssl` 限制匹配连接，客户端用 `sslmode=verify-full` 并配置受信任 CA



## psql
- 连接时明确指定主机、用户、数据库；`-W` 提示输入密码，不把密码写进命令行：
  ```sh
  psql -h 127.0.0.1 -p 5432 -U app_owner -d appdb -W
  ```
- 不写 `-h` 通常使用 Unix socket；用户名默认取当前系统用户名，数据库名默认与数据库用户名相同，环境变量可以覆盖这些默认值
- SQL 以 `;` 结束；反斜杠命令是 psql 命令，不是 SQL，不加分号

| 命令 | 用途 |
| --- | --- |
| `\conninfo` | 当前连接信息 |
| `\l` | 数据库列表 |
| `\c appdb` | 重新连接到 appdb，不是 SQL 的 `USE` |
| `\dn+` | schema 列表及权限 |
| `\dt app.*` | app schema 下的表 |
| `\d+ app.users` | 字段、约束、索引等表结构 |
| `\du` | 角色列表 |
| `\dp app.*` | 表、序列等对象权限 |
| `\ddp` | 默认权限 |
| `\x auto` | 宽结果自动竖排 |
| `\timing on` | 显示执行耗时 |
| `\i /path/to/file.sql` | 执行 SQL 文件 |
| `\h ALTER TABLE` | SQL 语法帮助 |
| `\?` / `\q` | psql 帮助 / 退出 |

- 脚本遇错停止，避免只执行一半却没发现：
  ```sh
  psql -X -h 127.0.0.1 -U app_owner -d appdb -v ON_ERROR_STOP=1 -f init.sql
  ```
- 自动化连接可用 [`.pgpass`](https://www.postgresql.org/docs/17/libpq-pgpass.html)，格式 `hostname:port:database:username:password`；Unix 下权限必须为 `0600`，不要提交到仓库



## User
- PostgreSQL 用 role 统一管理用户和用户组。`CREATE USER` 相当于 `CREATE ROLE ... LOGIN`；角色属于整个实例，不属于某个库
- 以下以管理员在 psql 中执行。`app_owner` 用于建表和迁移，`app_user` 用于应用读写，不给应用超级用户权限：
  ```sql
  CREATE ROLE app_owner LOGIN;
  CREATE ROLE app_user LOGIN;
  ```
  ```text
  \password app_owner
  \password app_user
  ```
- `\password` 交互设置密码，避免在 SQL 历史里留下明文；修改密码也用这条命令
- 创建数据库和业务 schema：
  ```sql
  CREATE DATABASE appdb OWNER app_owner ENCODING 'UTF8' TEMPLATE template0;
  ```
  ```text
  \c appdb
  ```
  ```sql
  CREATE SCHEMA app AUTHORIZATION app_owner;
  ```
- `CREATE DATABASE` 不能放在事务块里

### Privileges
- [GRANT](https://www.postgresql.org/docs/17/sql-grant.html) / [ALTER DEFAULT PRIVILEGES](https://www.postgresql.org/docs/17/sql-alterdefaultprivileges.html)
- 在 `appdb` 中以管理员执行。数据库、schema、表、序列分别授权；`GRANT ALL ON DATABASE` 不会自动授予表权限：
  ```sql
  GRANT CONNECT ON DATABASE appdb TO app_user;
  GRANT USAGE ON SCHEMA app TO app_user;

  -- 已有对象
  GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA app TO app_user;
  GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA app TO app_user;

  -- 以后由 app_owner 创建的对象
  ALTER DEFAULT PRIVILEGES FOR ROLE app_owner IN SCHEMA app
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;
  ALTER DEFAULT PRIVILEGES FOR ROLE app_owner IN SCHEMA app
    GRANT USAGE, SELECT ON SEQUENCES TO app_user;
  ```
- 默认权限不影响旧表，也不影响其他角色新建的表；迁移脚本要以 `app_owner` 创建对象
- 表权限不会自动扩展到关联序列。使用 `serial` 或显式调用 `nextval()` 时需留意序列权限
- 撤销某项授权，如 `REVOKE DELETE ON ALL TABLES IN SCHEMA app FROM app_user;`；新表的默认授权需另行撤销
- PostgreSQL 15 起，新建库的 `public` schema 默认不再允许所有角色建表；从旧版本升级的库可能保留旧权限，用 `\dn+ public` 检查
- `PUBLIC` 表示所有角色。默认的数据库 `CONNECT` 权限也可能来自 `PUBLIC`，只对某个角色 `REVOKE CONNECT` 不一定能禁止其连接
- 不需要 MySQL 的 `FLUSH PRIVILEGES`；授权语句提交后生效
- 删除角色用 `DROP ROLE app_user;`。如果仍持有对象或授权，先按 [Dropping Roles](https://www.postgresql.org/docs/17/role-removal.html) 处理依赖；不要为删账号直接执行 `DROP OWNED`，它可能删除业务对象



## Database / SQL
- 层级：实例（database cluster）→ database → schema → table；这里的 cluster 不表示多机集群
- 一个连接只能访问一个数据库，不能像 MySQL 那样直接查询另一个库的 `db.table`；同库不同 schema 可用 `schema.table` 访问
- `SHOW search_path;` 查看未限定对象名的查找顺序，通常为 `"$user", public`
  - 业务 SQL 可以直接写 `app.users`，避免同名表歧义
  - 放进 `search_path` 的 schema 不应允许不可信角色创建对象

### Table / CRUD
- 接着上面的账号和库，在 psql 中切换为 `app_owner`；显式使用 TCP，避免本地 `peer` 认证要求系统用户名一致：
  ```text
  \connect appdb app_owner 127.0.0.1
  ```
  ```sql
  CREATE TABLE app.users (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email text NOT NULL UNIQUE,
    name text NOT NULL,
    active boolean NOT NULL DEFAULT true,
    profile jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
  );

  INSERT INTO app.users (email, name, profile)
  VALUES ('alice@example.com', 'Alice', '{"city":"Hangzhou"}')
  RETURNING id, created_at;

  SELECT id, email, name FROM app.users WHERE active ORDER BY id LIMIT 20;

  UPDATE app.users SET name = 'Alice Chen'
  WHERE email = 'alice@example.com'
  RETURNING id, name;

  -- 依赖 email 上的唯一约束，不是先查再插
  INSERT INTO app.users (email, name)
  VALUES ('alice@example.com', 'Alice')
  ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name
  RETURNING id, name;
  ```
- 事务示例：
  ```sql
  BEGIN;
  DELETE FROM app.users WHERE email = 'alice@example.com' RETURNING id;
  ROLLBACK;
  ```
- 默认隔离级别为 `READ COMMITTED`，每条语句取得新快照；MySQL InnoDB 默认通常是 `REPEATABLE READ`
- 事务内一条语句报错后，需 `ROLLBACK`，或回滚到事先建立的 `SAVEPOINT`，不能直接接着执行
- 常见 DDL，如 `CREATE TABLE`、`ALTER TABLE`，可以随事务回滚；不要套用 MySQL DDL 隐式提交的习惯

### MySQL 对照

| MySQL | PostgreSQL |
| --- | --- |
| 反引号引用标识符 | 双引号；未引用的标识符折叠为小写，表名和列名尽量用小写下划线 |
| `AUTO_INCREMENT` | `GENERATED ... AS IDENTITY`；旧代码常见 `serial` / `bigserial` |
| `LAST_INSERT_ID()` | 插入时用 `RETURNING id`，不用额外查一次 |
| `ON DUPLICATE KEY UPDATE` | `ON CONFLICT (唯一键) DO UPDATE`，需明确冲突目标 |
| `IFNULL(a, b)` | `COALESCE(a, b)` |
| `LIMIT offset, count` | `LIMIT count OFFSET offset`，分页需搭配稳定的 `ORDER BY` |
| `tinyint(1)` 常用于布尔值 | 原生 `boolean`，用 `true` / `false` |
| `datetime` / `timestamp` | `timestamp` 不带时区，`timestamptz` 表示时间点；不能仅按类型名机械对应 |
| `unsigned` 整数 | 无对应整数类型，按取值范围选更大的类型并加 `CHECK` |
| `utf8mb4` | `UTF8` 即支持四字节字符，不需要另选字符集名称 |

- identity 由序列产生值，不保证连续，事务回滚、冲突插入都可能留下空号
- `timestamptz` 按时间点存储、按会话时区显示，不保留原始时区名；查看 `SHOW TimeZone;`
- 金额用 `numeric(p, s)`，不要用浮点数；无长度限制的字符串可用 `text`，不必为了性能随手写 `varchar(255)`
- `LIKE` 区分大小写，`ILIKE` 用于不区分大小写的匹配；不能照搬 MySQL 常见 `_ci` 排序规则下的比较习惯
- 没有通用的 `ON UPDATE CURRENT_TIMESTAMP` 列定义，更新时间由应用或触发器维护

### JSONB
- [JSON Types](https://www.postgresql.org/docs/17/datatype-json.html)
- `json` 保留输入文本；`jsonb` 使用分解后的二进制格式，不保留空白、键顺序和重复键，适合查询及索引
  ```sql
  SELECT profile->>'city' AS city FROM app.users; -- ->> 返回 text，-> 返回 JSON
  SELECT id FROM app.users WHERE profile @> '{"city":"Hangzhou"}'::jsonb;
  ```
- 经常关联、排序、校验的业务字段仍适合普通列，不必全部塞进 JSONB

### CSV
- 在 psql 中执行，文件路径在客户端；SQL `COPY` 的文件路径则在数据库服务器端：
  ```text
  \copy (SELECT email, name FROM app.users ORDER BY id) TO 'users.csv' WITH (FORMAT csv, HEADER true)
  \copy app.users (email, name) FROM 'new_users.csv' WITH (FORMAT csv, HEADER true)
  ```
- 导入示例只读 email、name 两列，其他列使用默认值；目标表的唯一约束等仍会校验



## Optimization
- [Performance Tips](https://www.postgresql.org/docs/17/performance-tips.html)
- PostgreSQL 没有按表选择 InnoDB/MyISAM 的常规用法，不照搬 MySQL 的存储引擎参数

### EXPLAIN / Index
- `EXPLAIN` 只生成计划；`EXPLAIN (ANALYZE, BUFFERS)` 会真正执行，写语句不要直接拿到生产库分析
  ```sql
  EXPLAIN (ANALYZE, BUFFERS)
  SELECT id, name FROM app.users WHERE email = 'alice@example.com';
  ```
- 看估算行数和实际行数差距、扫描方式、循环次数、排序是否落盘、buffer 命中和读取；小表走顺序扫描不一定有问题
- 索引按查询条件选，不是越多越好；写入、VACUUM 和备份也要承担成本：
  ```sql
  -- 表达式索引，查询条件需使用相应表达式
  CREATE INDEX users_lower_email_idx ON app.users (lower(email));

  -- 部分索引，只索引 active 的行
  CREATE INDEX users_active_created_idx ON app.users (created_at) WHERE active;

  -- JSONB 包含查询等
  CREATE INDEX users_profile_idx ON app.users USING gin (profile);
  ```
- B-tree：等值、范围、排序；GIN：JSONB、数组、全文检索；GiST：范围、空间等；BRIN：列值与物理顺序相关的大表，如按时间追加的日志
- 主键、唯一约束会自动建索引；外键的引用列不会自动建索引，需按关联及删除/更新父表的需求补充
- 在线建索引可用 `CREATE INDEX CONCURRENTLY`，减少阻塞写入，但耗时和工作量更大，不能放在事务块里；失败后检查是否留下无效索引

### Slow query
- `postgresql.conf` 中记录耗时超过 500 ms 的语句，重载生效：
  ```conf
  log_min_duration_statement = 500
  log_line_prefix = '%m [%p] %u@%d '
  ```
- 日志可能含 SQL 参数和业务数据，限制访问权限并配置轮转
- [pg_stat_statements](https://www.postgresql.org/docs/17/pgstatstatements.html)：按归一化 SQL 统计调用次数和耗时
  - 确认已安装扩展文件，在 `shared_preload_libraries` 的现有列表中加入 `pg_stat_statements`，重启服务
  - 管理员在要查询统计的数据库执行：
    ```sql
    CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
    SELECT calls, total_exec_time, mean_exec_time, rows, query
    FROM pg_stat_statements
    ORDER BY total_exec_time DESC
    LIMIT 10;
    ```
  - 统计是累计值，比较时注意统计窗口及重置时间；总耗时高和单次慢是两类问题

### Memory / Connections
- [Resource Consumption](https://www.postgresql.org/docs/17/runtime-config-resource.html)
- `shared_buffers`：数据库共享缓存。专用数据库服务器可从物理内存约 25% 起步，还要给系统页缓存和连接留空间，不照搬 InnoDB 的 70%
- `effective_cache_size`：优化器对可用缓存的估计，不会按这个值分配内存
- `work_mem`：单个排序/哈希操作的基础内存额度，不是每连接总上限；一个查询有多个节点，并发连接和并行 worker 会放大占用，哈希还受 `hash_mem_multiplier` 影响
- `maintenance_work_mem`：建索引、VACUUM 等维护操作使用；autovacuum 有多个 worker 时还需考虑 `autovacuum_work_mem`
- `max_connections`：不要只为解决连接耗尽而加大。先看连接是否泄漏、事务是否长时间未提交，应用使用连接池；需要时再加 [PgBouncer](https://www.pgbouncer.org/)
- 不要为了跑分关闭 `fsync` 或 `full_page_writes`，崩溃后可能损坏数据

### MVCC / VACUUM
- `UPDATE` / `DELETE` 后旧版本不会立即消失，需等不再被事务需要时由 VACUUM 回收
- 普通 `VACUUM` 主要把空间留给本表复用，通常不会让文件明显变小；`ANALYZE` 更新优化器统计
  ```sql
  VACUUM (ANALYZE) app.users;
  SELECT schemaname, relname, n_live_tup, n_dead_tup,
         last_autovacuum, last_autoanalyze
  FROM pg_stat_user_tables
  ORDER BY n_dead_tup DESC;
  ```
- `n_live_tup`、`n_dead_tup` 是估算值，不是精确计数
- 保持 autovacuum 开启；它还负责冻结旧事务 ID，防止事务 ID 回卷。长事务、`idle in transaction` 可能妨碍旧版本清理
- `VACUUM FULL` 重写整张表，需要额外磁盘空间并持有排他锁，不作为日常清理手段；VACUUM 不能放在事务块里



## Backup/Restore
- [Backup and Restore](https://www.postgresql.org/docs/17/backup.html)

### pg_dump / pg_restore
- 单库逻辑备份，`-Fc` 为自定义归档格式，配合 `pg_restore` 恢复。以下用户拥有示例库及业务对象：
  ```sh
  pg_dump -h 127.0.0.1 -U app_owner -d appdb -Fc -f appdb.dump
  createdb -h 127.0.0.1 -U postgres -T template0 -O app_owner appdb_restore
  pg_restore -h 127.0.0.1 -U app_owner -d appdb_restore --exit-on-error appdb.dump
  psql -X -h 127.0.0.1 -U app_owner -d appdb_restore -c 'ANALYZE;'
  ```
- 上面的 `postgres` 换成实际管理员；创建恢复库需要 `CREATEDB` 或超级用户权限，不要为此给应用账号提权
- 跨实例恢复时先准备原有角色和扩展；只想恢复到新用户下，可用 `pg_restore --no-owner --no-privileges`，再重新授权
- 纯 SQL 格式用 psql 恢复，不用 pg_restore；目标是另一个预先创建的空库：
  ```sh
  pg_dump -h 127.0.0.1 -U app_owner -d appdb -Fp -f appdb.sql
  psql -X -h 127.0.0.1 -U app_owner -d appdb_restore_sql -v ON_ERROR_STOP=1 -f appdb.sql
  ```
- `pg_dump` 提供单库一致性快照，通常不阻塞正常读写，但会与部分 DDL 的排他锁冲突
- 不包含实例级角色和表空间，另用管理员执行 `pg_dumpall --globals-only -f globals.sql`；文件可能含密码摘要，按敏感备份保管
- 并行导出：`pg_dump -Fd -j 4 -f appdb.dir appdb`；只有目录格式支持并行导出，自定义和目录格式都支持并行恢复
- `pg_dump` 客户端不能比源服务器大版本更旧；迁移到新版前确认扩展兼容性，并试恢复
- 恢复到独立库，核对表、行数、约束和应用查询。不要拿生产库试 `--clean`

### WAL / PITR
- [Continuous Archiving and PITR](https://www.postgresql.org/docs/17/continuous-archiving.html)
- WAL（Write-Ahead Log）记录恢复所需变更，用于崩溃恢复、物理复制和时间点恢复，不与 MySQL binlog 一一对应
- `pg_basebackup` 做整个实例的物理基础备份；PITR 还需要从该备份开始连续、完整的 WAL 归档，只有 `pg_dump` 不够
- 恢复时在隔离实例配置 `restore_command`、恢复目标并创建 `recovery.signal`；流复制备库使用 `standby.signal`，不要照抄旧版本的 `recovery.conf`
- 物理备份一般要求同一大版本及兼容的平台/构建环境，不能直接拿旧版本数据目录启动新大版本
- [pgBackRest](https://pgbackrest.org/) / [Barman](https://pgbarman.org/)：备份、WAL 归档及恢复管理
- 不要手工删除 `pg_wal` 文件腾空间。先检查归档失败、复制槽滞留和备库延迟



## Replication
- [High Availability, Load Balancing, and Replication](https://www.postgresql.org/docs/17/high-availability.html)

### Streaming replication
- 物理流复制传输 WAL，复制整个实例，主备使用相同大版本；hot standby 可以提供只读查询
- 搭建涉及复制角色、HBA、基础备份、`primary_conninfo` 等，见 [Streaming Replication](https://www.postgresql.org/docs/17/warm-standby.html#STREAMING-REPLICATION)
- 默认异步，主库故障时可能丢失尚未传到备库的已提交事务；同步复制降低这类风险，但提交延迟和可用性取决于同步备库及配置
- 管理员在主库查看发送状态，在备库看 `pg_stat_wal_receiver`：
  ```sql
  SELECT application_name, client_addr, state, sync_state,
         sent_lsn, write_lsn, flush_lsn, replay_lsn
  FROM pg_stat_replication;
  ```
- 复制槽会保留消费者还需要的 WAL，长期离线可能撑满磁盘；监控槽和磁盘，按恢复能力设置 `max_slot_wal_keep_size`，达到限制后备库可能需要重建
- 复制不会自动完成故障选主和防脑裂，可配合 [Patroni](https://github.com/patroni/patroni)。备库也会复制误删操作，不能替代备份

### Logical replication
- [Logical Replication](https://www.postgresql.org/docs/17/logical-replication.html)：publication / subscription，按表复制，可用于跨大版本迁移或同步部分数据
- 发布端需 `wal_level = logical`，并配置复制槽、发送进程、连接及表读取权限；不是只建 publication 就能工作
- 订阅端需先有兼容表结构，内置逻辑复制不复制 DDL 和序列当前值；切换写入前需处理序列
- 复制 `UPDATE` / `DELETE` 需要合适的 replica identity，通常使用主键；`REPLICA IDENTITY FULL` 有额外成本
- 订阅端同时写同一批数据容易冲突，双向订阅不等于可直接使用的双主方案



## Partitioning / Sharding
- [Table Partitioning](https://www.postgresql.org/docs/17/ddl-partitioning.html)：原生范围、列表、哈希分区，用于分区裁剪和按分区维护大表
- 分区仍在同一实例内，不等于分库分片；查询条件要能裁剪分区才有收益，分区键按访问和归档方式选择
- 分区表的主键/唯一约束必须包含全部分区键列，不能想当然地依赖跨分区全局唯一索引
- [postgres_fdw](https://www.postgresql.org/docs/17/postgres-fdw.html)：访问远端 PostgreSQL 表，不是自动分片方案
- [Citus](https://github.com/citusdata/citus)：分布式 PostgreSQL 扩展；先确认单机瓶颈，再考虑分片键、跨节点查询和事务成本



## Projects
- [PostgREST](https://github.com/PostgREST/postgrest)：基于 PostgreSQL 表、视图和函数提供 REST API
- [PostGIS](https://postgis.net/)：地理空间类型、索引及查询
- [pgvector](https://github.com/pgvector/pgvector)：向量存储与相似度检索
- 扩展需先在服务器安装对应版本的文件，再在目标库 `CREATE EXTENSION`；升级数据库前检查扩展支持情况



## Tools
- [pgcli](https://github.com/dbcli/pgcli)：带自动补全和语法高亮的命令行客户端
- [pgAdmin](https://www.pgadmin.org/)：管理界面，支持 SQL、对象管理和监控
- [DBeaver](https://dbeaver.io/)：通用数据库客户端
- [PgBouncer](https://www.pgbouncer.org/)：轻量连接池；使用事务池模式前检查应用对会话状态的依赖
- See also: [database tools](database#tools)



## FAQs
- `role "xxx" does not exist` / `database "xxx" does not exist`
  - 先看 `\conninfo`，确认连的是预期实例；显式指定 `-U`、`-d`。在 Homebrew 安装中不要默认超级用户叫 `postgres`
- `Peer authentication failed`
  - 本地 socket 匹配到了 `peer`，系统用户名与数据库角色不匹配；管理员可用 `sudo -u postgres psql`，普通账号可用 `-h 127.0.0.1` 走已配置的密码认证
- `no pg_hba.conf entry`
  - 核对库名、用户、客户端实际地址和 TLS 状态；修改正确实例的 HBA 后重载，不要直接加一条全网 `trust`
- `permission denied for schema/table/sequence`
  - 分别检查 schema 的 `USAGE`、表权限、序列权限；新表无权限还要查创建者及默认权限
- `relation does not exist`
  - 检查当前数据库、`search_path`、schema 和大小写；`"Users"` 与未引用的 `users` 不是同一个表名
- `current transaction is aborted`
  - 前面已有 SQL 报错，先 `ROLLBACK`，再找第一条错误；后面的错误通常只是事务仍处于失败状态

### Connections / Locks
- 管理员查看其他连接的完整信息；普通监控角色可按需授予 `pg_read_all_stats`：
  ```sql
  SELECT pid, usename, application_name, client_addr, state,
         now() - xact_start AS transaction_age,
         wait_event_type, wait_event, query
  FROM pg_stat_activity
  WHERE datname = current_database() AND pid <> pg_backend_pid()
  ORDER BY xact_start NULLS LAST;

  SELECT pid, pg_blocking_pids(pid) AS blocked_by, query
  FROM pg_stat_activity
  WHERE cardinality(pg_blocking_pids(pid)) > 0;
  ```
- `idle` 是空闲连接，`idle in transaction` 是事务还没结束；不要把两者都当成慢查询
- 处理阻塞前确认 PID、事务及业务影响。`pg_cancel_backend(pid)` 取消当前语句；`pg_terminate_backend(pid)` 断开连接并回滚活动事务，所需权限不同

### Size
- 数据库大小和表大小（含索引、TOAST），先确认空间花在哪：
  ```sql
  SELECT pg_size_pretty(pg_database_size(current_database()));
  SELECT schemaname, relname,
         pg_size_pretty(pg_total_relation_size(relid)) AS total_size
  FROM pg_stat_user_tables
  ORDER BY pg_total_relation_size(relid) DESC;
  ```
- 精确行数用 `SELECT count(*) FROM app.users;`，大表有扫描成本；只看数量级可查 `pg_stat_user_tables.n_live_tup`



## Resources
- [Awesome Postgres](https://github.com/dhamaniasad/awesome-postgres)：工具、扩展和学习资料
- [PostgreSQL Wiki](https://wiki.postgresql.org/)
- [PostgreSQL 中文社区](https://www.postgres.cn/)
