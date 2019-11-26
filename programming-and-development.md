
## Learn
- [Teach Yourself Programming in Ten Years](http://norvig.com/21-days.html), [21天学会C++](http://coolshell.cn/articles/2250.html)
- [Every Programmer Should Know](https://github.com/mtdvio/every-programmer-should-know), A collection of (mostly) technical things every software developer should know
- [hacker-laws](https://github.com/dwmkerr/hacker-laws), Laws, Theories, Principles and Patterns that developers will find useful. [中文版](https://github.com/nusr/hacker-laws-zh)
- [科技爱好者周刊](https://github.com/ruanyf/weekly)
- https://github.com/jobbole
#### Cheatsheet
- [modest collection of cheatsheets](https://devhints.io/) 
- [Awesome cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets) for popular programming languages, frameworks and development tools. They include everything you should know in one single file.
  - [skywind3000/awesome-cheatsheets](https://github.com/skywind3000/awesome-cheatsheets)，超级速查表 - 编程语言、框架和开发工具的速查表，单个文件包含一切你需要知道的东西
#### Education
- [[scratch]]
- [儿童学编程，教什么语言好？](https://www.zhihu.com/question/19705160?wechatShare=1)
- [教孩子编程的 6 个小建议](http://blog.jobbole.com/95737/)
- [教孩子学习编程基础知识的 10 个工具](http://blog.jobbole.com/77291/)
- [教孩子们编程，相关学习资源](http://blog.jobbole.com/49786/)



## Resources
- [free-programming-books](https://github.com/EbookFoundation/free-programming-books), [CN](https://github.com/EbookFoundation/free-programming-books/blob/master/free-programming-books-zh.md); [another CN](https://github.com/justjavac/free-programming-books-zh_CN)
- [Best-websites-a-programmer-should-visit](https://github.com/sdmg15/Best-websites-a-programmer-should-visit),  Some useful websites for programmers.



## Interview
- [Awesome Interviews](https://github.com/MaximAbramchuck/awesome-interview-questions), A curated awesome list of lists of interview questions. Feel free to contribute! 
- [Coding Interview University](https://github.com/jwasham/coding-interview-university), This is my multi-month study plan for going from web developer (self-taught, no CS degree) to software engineer for a large company.
- [CyC2018/CS-Notes](https://github.com/CyC2018/CS-Notes),  技术面试必备基础知识、Leetcode、Java、C++、Python、后端面试、计算机操作系统、计算机网络、系统设计
- [GitHub Résumé](https://github.com/resume/resume.github.com), A service that creates a résumé based on your GitHub repos/activity.



## Tools
### Editor
- [vim](https://www.vim.org/)
  - [The Ultimate vimrc](https://github.com/amix/vimrc)
- [emacs](https://www.gnu.org/software/emacs/)
- [atom](https://github.com/doubility-sky/daydayup/wiki/atom-editor "GitHub 出品，好吧现在也是微软的了- -|||") 基于 electron
- :star:[vscode](https://code.visualstudio.com/ "微软出品")，与 atom 一样基于 electron，活跃且迭代非常快
  - [awesome-vscode](https://github.com/viatsko/awesome-vscode), A curated list of delightful Visual Studio Code packages and resources. 
  - [Github Markdown Preview](https://marketplace.visualstudio.com/items?itemName=bierner.github-markdown-preview)
- [sublime](http://www.sublimetext.com/) 速度快 (打开大文件表现好），更新慢
  - [Package Control](https://packagecontrol.io/installation)
  - [20 个强大的 Sublime Text 插件](https://www.oschina.net/translate/20-powerful-sublimetext-plugins)
- [notepad++](https://notepad-plus-plus.org/) (Windows Only)
- [source insight](http://www.sourceinsight.com/) 收费，windows only

### Code Counter
- [Count Lines of Code](https://github.com/AlDanial/cloc)

### Code Formatter
- [Artistic Style](http://astyle.sourceforge.net/)   
  格式化利器，别人代码瞬间变成你熟悉的风格。以下为一个使用命令案例:   
  ```bash
  #!/bin/sh
  astyle \
  --mode=c \
  --style=kr \
  --indent=force-tab \
  --attach-namespaces \
  --attach-classes \
  --attach-inlines \
  --indent-switches \
  --indent-col1-comments \
  --pad-oper \
  --pad-header \
  --unpad-paren \
  --align-pointer=type \
  --fill-empty-lines \
  --add-brackets \
  --recursive \
  --suffix=none *.c *.cpp *.h *.hpp
  ```
- [clang-format](http://clang.llvm.org/docs/ClangFormat.html)  
  [用 ClangFormat 插件格式化 Objective-C 代码](http://phenmod.com/blog/2015/11/17/use-clangformat-to-format-objective-c-code/)
