https://git-scm.com/


## How to learn
### 官方文档 
- https://git-scm.com/doc
- [Pro Git book V2](https://git-scm.com/book/en/v2)
- [Pro Git book 中文版](https://git-scm.com/book/zh)

### 其他教程
- [猴子都能懂的GIT入门](http://backlogtool.com/git-guide/cn/)
- [廖雪峰GIT教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [闯过这 54 关，点亮你的 Git 技能树](https://codingstyle.cn/topics/51)

## Git 
- https://git-scm.com/downloads  
  不管用不用GUI Client，这个都是必需的。

## GUI Client
- https://git-scm.com/downloads/guis  
  官方推荐大合集
- https://desktop.github.com/   
  win/mac, free （尚未深入使用过）  
  官方首推，估计因为同是 Pro Git book 及 GitHub 作者的原因吧。
- http://www.sourcetreeapp.com/   
  win/mac, free  **推荐**   
  Atlassian 力作，同为 bitbucket, JIRA... 的母公司，靠谱商业公司的产品质量有保证。  
  PS: 因为伟大的G*F*W原因，下载更新不是很方便  
- https://tortoisegit.org/  
  windows only  
  如果用惯了 tortoiseSVN，那就试这个吧  
 
## 玩转~~基佬Hub~~GitHub社区
- https://guides.github.com/  
  注意看本组织在哪里？  
- https://hexo.io/    
  A fast, simple & powerful blog framework, powered by Node.js

## git flow : 项目开发分支模型
- [git flow原文](http://nvie.com/posts/a-successful-git-branching-model/)
- [git flow翻译](http://www.ituring.com.cn/article/56870)


## FAQ
#### 换行符 CRLF 问题
- **Q** [换行符自动转换](https://github.com/cssmagic/blog/issues/22)
- **A** [换行符问题 - Git权威指南](http://www.worldhello.net/gotgit/08-git-misc/040-eol.html)  
  - 不要手动去设置 `core.autocrlf`，默认即可(`linux`,`macosx`为`false`, `win`为`true`)  
  - 设置: `git config --global core.safecrlf true`
  - 特别需求添加 `.gitattributes` 去约束
