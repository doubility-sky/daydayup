[SQL](https://en.wikipedia.org/wiki/SQL) (/ˌɛsˌkjuːˈɛl/ ( listen) S-Q-L, /ˈsiːkwəl/ "sequel"; Structured Query Language) is a domain-specific language used in programming and designed for managing data held in a relational database management system ([[RDBMS]]), or for stream processing in a relational data stream management system (RDSMS).



## Learn
- [Select Star SQL](https://selectstarsql.com/)
- [SQL Police Department](https://sqlpd.com/)
- [Quick SQL Cheatsheet](https://github.com/enochtangg/quick-SQL-cheatsheet), A quick reminder of all SQL queries and examples on how to use them.



## Practice
- [SQL 命名约定](https://launchbylunch.com/posts/2014/Feb/16/sql-naming-conventions/) 数据库的表和字段怎么起名？这也是一门学问。下面是数据库的一些命名原则。
  > * __小写__。标识符应该全部用小写字母来书写，使用`first_name`，不是`"First_Name"或者"FirstName"`。
  > * __数据类型不是名称__。避免使用仅为数据类型的名字（如`text`或`timestamp`）。
  > * __强调单独的单词__。由多个单词组成的对象名称应该用下划线分隔，例如使用`word_count`或`team_member_id`，而不是`wordcount`或`wordCount`。
  > * __完整的单词，而不是缩写__。例如使用`middle_name`，不是`mid_nm`。
  > * __使用常用缩写__。对于几个长词而言，缩写词比词本身更为常见，比如`i18n`和`l10n`，这时使用缩写。



## FAQs
- [【MySQL】 细说 NULL 导致的神坑，让人防不胜防](https://juejin.cn/post/7134177743276605448)
  - NULL 作为布尔值的时候，不为 1 也不为 0
  - 任何值和 NULL 使用运算符（>、<、>=、<=、!=、<>）或者（in、not in、any/some、all），返回值都为NULL
  - 当 IN 和 NULL 比较时，无法查询出为 NULL 的记录
  - 当 NOT IN 后面有 NULL 值时，不论什么情况下，整个 sql 的查询结果都为空
  - 判断是否为空只能用 IS NULL、IS NOT NULL
  - count(字段) 无法统计字段为 NULL 的值，count(*) 可以统计值为 NULL 的行
  - 当字段为主键的时候，字段会自动设置为 NOT NULL
  - NULL 导致的坑让人防不胜防，强烈建议创建字段的时候字段不允许为 NULL，给个默认值
- [SQL 多表查询之 where 和 INNER JOIN](https://www.cnblogs.com/Transkai/p/13414146.html)
  - 使用 inner join，而不是 where
