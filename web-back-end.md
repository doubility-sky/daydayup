In software engineering, the terms [frontend and backend](https://en.wikipedia.org/wiki/Frontend_and_backend) (or sometimes referred to as back end or back-end) refer to the separation of concerns between the presentation layer (frontend), and the data access layer (backend) of a piece of software, or the physical infrastructure or hardware. In the client–server model, the client is usually considered the frontend and the server is usually considered the backend, even when some presentation work is actually done on the server itself.

- [[web-front-end]]



## Learn
- [Back-end Roadmap](https://github.com/kamranahmedse/developer-roadmap#back-end-roadmap)
- [《设计数据密集型应用》](https://github.com/Vonng/ddia) 《Designing Data-Intensive Application》DDIA中文翻译
- [后端架构师技术图谱](https://github.com/xingshaocheng/architect-awesome)

### architecture
- [服务端高并发分布式架构演进之路](https://segmentfault.com/a/1190000018626163)
- [网站服务器架构部署方案发展](https://www.cnblogs.com/baobeiqi-e/p/10876334.html)
- [微服务架构](https://www.jianshu.com/p/6dc79068e2dc)

### [load balancing](https://en.wikipedia.org/wiki/Load_balancing_(computing))
- [负载均衡架构](https://www.jianshu.com/p/8f7242cbf469)
- [你管这破玩意儿叫负载均衡?](https://mp.weixin.qq.com/s/Rngy_zCopDWFHq4ZUo3m9w)

### system design
- [The System Design Primer](https://github.com/donnemartin/system-design-primer) Learn how to design large-scale systems. Prep for the system design interview. Includes Anki flashcards.
- [hiredintech system-design](https://www.hiredintech.com/system-design)
- [System design interview](https://github.com/checkcheckzz/system-design-interview) for IT companies



## Practice
- [How WhatsApp scaled to 1 billion users with only 50 engineers](https://www.quastor.org/p/how-whatsapp-scaled-to-1-billion)
- [A Digest of Evernote’s Architecture](https://evernote.com/blog/a-digest-of-evernotes-architecture/)
- [How We've Scaled Dropbox](https://www.youtube.com/watch?v=PE4gwstWhmc)
- [How Does Facebook Work? The Nuts and Bolts [Technology Explained]](https://www.makeuseof.com/tag/facebook-work-nuts-bolts-technology-explained/)
- [Stack Overflow Architecture](http://highscalability.com/blog/2009/8/5/stack-overflow-architecture.html)
- [一个打车应用早期架构发展史](https://cloud.tencent.com/developer/article/1521020)
- [支付宝架构师眼中的高并发架构](https://cloud.tencent.com/developer/article/1417126)
- [有赞服务化架构演进](https://cloud.tencent.com/developer/article/1522947)

### cloud service
- [阿里云 - 高可用架构部署方案](https://help.aliyun.com/document_detail/137317.html?spm=5176.13910061.sslink.1.76864736DWeDXk)
  - 领军客户实战场景
    - [CDN](https://cn.aliyun.com/product/cdn)
    - [弹性公网IP](https://cn.aliyun.com/product/eip)
    - [NAT网关](https://cn.aliyun.com/product/nat)
    - [负载均衡](https://cn.aliyun.com/product/slb)
    - [专有网络 VPC](https://cn.aliyun.com/product/vpc)
  - 行业实战场景 [对象存储 OSS](https://cn.aliyun.com/product/oss)
  - 架构介绍
    - [企业级高可用架构解决方案](https://cn.aliyun.com/solution/ehasl/index)
    - [企业级互联网架构解决方案](https://cn.aliyun.com/solution/middleware/index)
- [腾讯云全栈解决方案](https://cloud.tencent.com/solution/overview)
  - [游戏解决方案](https://cloud.tencent.com/solution/game)



## Frameworks
- :star:[[golang]] - [Web Frameworks](golang#Frameworks)
- [[lua]] - [openresty](nginx#openresty)
- [[python]] - [Web Frameworks](python#Frameworks)
- [[node.js]] - [Frameworks](node.js#Frameworks)
- [[php]] - [Laravel](php#Laravel)
- [[java]] - [[spring]]



## Search Engine
- [Apache Lucene and Solr](https://github.com/apache/lucene-solr). Apache Lucene is a high-performance, full featured text search engine library written in Java. Apache Solr is an enterprise search platform written using Apache Lucene. Major features include full-text search, index replication and sharding, and result faceting and highlighting.
  - [Lucene入门简介](https://www.cnblogs.com/rodge-run/p/6551152.html)
- [Elasticsearch](https://github.com/elastic/elasticsearch) A Distributed RESTful Search Engine
  - [Elasticsearch学习，请先看这一篇！](https://blog.csdn.net/laoyang360/article/details/52244917)
  - [Elasticsearch索引原理](https://blog.csdn.net/cyony/article/details/65437708)
- [OpenSearch](https://github.com/opensearch-project/OpenSearch) is an open source search and analytics engine derived from Elasticsearch 7.10.2
- [searx](https://github.com/searx/searx): Privacy-respecting metasearch engine
- [Regular Expression Matching with a Trigram Index or How Google Code Search Worked](https://swtch.com/~rsc/regexp/regexp4.html)



## Tools
- [web-servers](https://gist.github.com/willurd/5720255): Each of these commands will run an ad hoc http static server in your current (or specified) directory, available at http://localhost:8000. Use this power wisely.
  - Python 2.x `python -m SimpleHTTPServer 8000`
  - Python 3.x `python -m http.server` (default on port 8000)
  - `twistd -n web --path .` (default on port 8080)
  - `twistd -n web -p "tcp:port=8000" --path .`
  - Node.js `http-server -bgp 8000 --cors`
    - [Missing HTTP Response Header "Content-Encoding: gzip"](https://github.com/http-party/http-server/issues/780)
- [Hoppscotch](https://github.com/hoppscotch/hoppscotch), 👽 Open source API development ecosystem https://hoppscotch.io. AKA: [postwoman](https://postwoman.io/)
- [GoAccess](https://github.com/allinurl/goaccess) is an open source real-time web log analyzer and interactive viewer that runs in a terminal on *nix systems or through your browser. It provides fast and valuable HTTP statistics for system administrators that require a visual server report on the fly. More info at: https://goaccess.io.



## FAQs
- [常见的网站服务器架构有哪些？](https://www.zhihu.com/question/20657269)
- [为什么做java的web开发我们会使用struts2，springMVC和spring这样的框架?](https://github.com/RubyLouvre/agate/issues/8)



## Resources
- https://github.com/sindresorhus/awesome#back-end-development

