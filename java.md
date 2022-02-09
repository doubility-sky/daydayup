[Java](https://en.wikipedia.org/wiki/Java_(programming_language)) is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.

[Oracle Java](https://www.oracle.com/java/): Java is the #1 programming language and development platform. It reduces costs, shortens development timeframes, drives innovation, and improves application services. With millions of developers running more than 51 billion Java Virtual Machines worldwide, Java continues to be the development platform of choice for enterprises and developers.



## Learn
- [Java For Beginners](https://web-beginner.net/java): This free core Java basics tutorial is designed for beginners with little or no Java coding experience. Syllabus. First …
- [better-java](https://github.com/cxxr/better-java) Resources for writing modern Java
- [Java Core Sprout](https://github.com/crossoverJie/JCSprout) : basic, concurrent, algorithm https://crossoverjie.top/JCSprout
- [一份涵盖大部分Java程序员所需要掌握的核心知识](https://github.com/Snailclimb/JavaGuide)
- [Design patterns implemented in Java](https://github.com/iluwatar/java-design-patterns) https://java-design-patterns.com
- [Java and Spring Tutorials](https://github.com/eugenp/tutorials) Just Announced - "Learn Spring Security OAuth": http://bit.ly/github-lsso



## Practice
- [有哪些值得推荐的 Java 练手项目？](https://www.zhihu.com/question/56476038/answer/1007722651?utm_source=wechat_session&utm_medium=social&utm_oi=27555461595136)
  - [实践项目](https://how2j.cn/stage/39.html) fake tmall



## Frameworks
- Old Money: SSM(Spring + SpringMVC + MyBatis), SSH(Struts2 + Spring + Hibernate)
- [Spring Boot](https://github.com/spring-projects/spring-boot) makes it easy to create Spring-powered, production-grade applications and services with absolute minimum fuss. https://spring.io/projects/spring-boot



## Tools
- [Arthas](https://github.com/alibaba/arthas) Alibaba Java Diagnostic Tool Arthas/Alibaba Java诊断利器Arthas https://arthas.gitee.io/



## FAQs
- [How to install Java 9 and 10 on Mac with Homebrew?](https://stackoverflow.com/questions/54566362/how-to-install-java-9-and-10-on-mac-with-homebrew/55775518)
  - `brew tap adoptopenjdk/openjdk`
  - `brew install --cask adoptopenjdk9`
  - `export JAVA_HOME=$(/usr/libexec/java_home)`
- [Cask adoptopenjdk8 exists in multiple taps](https://github.com/AdoptOpenJDK/homebrew-openjdk/issues/106)
  - `brew install --cask adoptopenjdk/openjdk/adoptopenjdk8`
- Switch JDK
  ```shell
  function jdk() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1);
    java -version
  }
  ```



## Resources
- [Awesome Java](https://github.com/akullpp/awesome-java), A curated list of awesome frameworks, libraries and software for the Java programming language.
- [Java 技术书籍大全](https://github.com/sorenduan/awesome-java-books)
