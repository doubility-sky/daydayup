https://git-scm.com/

# Git 
- https://git-scm.com/downloads  
  不管用不用GUI Client，这个都是必需的。

# GUI Client
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
- https://www.gitkraken.com/
  支持ubuntu，macosx，windows
  如果在ubuntu下，除了编辑器集成的git，可以使用它

# Git服务器
### Gitlab
- [Gitlab](https://about.gitlab.com/)是一款可自搭建的Git服务器，以web可视化界面、便捷操作著称，适合公司、团体使用。
- [Gitlab简单教程](https://wuyuans.com/2017/05/gitlab-simple-tutorial)

# Learn
### 官方文档 
- https://git-scm.com/doc
- [Pro Git book V2](https://git-scm.com/book/en/v2)
- [Pro Git book 中文版](https://git-scm.com/book/zh)

### 其他教程
- http://rogerdudler.github.io/git-guide/
- [猴子都能懂的GIT入门](http://backlogtool.com/git-guide/cn/)
- [廖雪峰GIT教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [闯过这 54 关，点亮你的 Git 技能树](https://codingstyle.cn/topics/51)
- [GitHub 漫游指南](https://github.com/phodal/github-roam)

# 常用 Git 命令
- http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html
### [删除本地所有未提交的更改](https://www.v2ex.com/t/66718)
- `git clean -df` 只删除所有untracked的文件
- `git clean -xdf` 删除untracked以及ignore的文件
- `git reset --hard` 把tracked的文件revert到前一个版本


# 玩转~~基佬Hub~~GitHub社区
- https://guides.github.com/  
  注意看本组织在哪里？  
- https://hexo.io/    
  A fast, simple & powerful blog framework, powered by Node.js

# git flow : 项目开发分支模型
- [git flow原文](http://nvie.com/posts/a-successful-git-branching-model/)
- [git flow翻译](http://www.ituring.com.cn/article/56870)


# FAQ
#### 换行符 CRLF 问题
- **Q** [换行符自动转换](https://github.com/cssmagic/blog/issues/22)
- **A** [换行符问题 - Git权威指南](http://www.worldhello.net/gotgit/08-git-misc/040-eol.html)  
  - 不要手动去设置 `core.autocrlf`，默认即可(`linux`,`macosx`为`false`, `win`为`true`)  
  - 设置: `git config --global core.safecrlf true`
  - 特别需求添加 `.gitattributes` 去约束

#### push卡住的问题
- **Q** push时卡在write objects.后续报fatal:The remote end hung up unexpectedly
- **A** 问题原因是http.postBuffer默认上限为1M所致。将上限设为500M： 
```
git config --global http.postBuffer 524288000
```

#### 解决冲突出错
- `git reset --hard` 无效  
```
fatal: Unable to create '/.git/index.lock': File exists.
If no other git process is currently running, this probably means a
git process crashed in this repository earlier. Make sure no other git
process is running and remove the file manually to continue.
```
- http://stackoverflow.com/questions/8198966/how-do-i-fix-a-failed-git-commit  
Removing index.lock file manually from .git directory worked.  
or From command line:  
`$ rm -rf .git/index.lock`  
Note: Make sure that only one index file exist on .git directory
