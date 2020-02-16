- https://git-scm.com/
- https://git-scm.com/downloads **必需**
### GUI
- https://git-scm.com/downloads/guis 官方推荐大合集
- https://www.sourcetreeapp.com/ win/mac, free
- https://www.gitkraken.com/ linux/win/mac，linux下推荐使用



## Learn
### 文档 
- https://git-scm.com/doc
- [Pro Git book V2](https://git-scm.com/book/en/v2)
- [Pro Git book 中文版](https://git-scm.com/book/zh)
### 教程
- https://github.com/geeeeeeeeek/git-recipes
- http://rogerdudler.github.io/git-guide/
- [猴子都能懂的GIT入门](http://backlogtool.com/git-guide/cn/)
- [廖雪峰GIT教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [闯过这 54 关，点亮你的 Git 技能树](https://codingstyle.cn/topics/51)
- [GitHub 漫游指南](https://github.com/phodal/github-roam)
- [githug](https://github.com/Gazler/githug)
- https://github.com/521xueweihan/git-tips
### git flow : 项目开发分支模型
- [git flow原文](http://nvie.com/posts/a-successful-git-branching-model/)
- [git flow翻译](http://www.ituring.com.cn/article/56870)
### 资料 reference
- [Git如何存储文件-git存储数据结构](http://eagain.net/articles/git-for-computer-scientists/)
### 玩转GitHub
- [enhanced-github](https://github.com/softvar/enhanced-github/), [Chrome extension](https://chrome.google.com/webstore/detail/github-plus/anlikcnbgdeidpacdbdljnabclhahhmd) to display size of each file, download link and copy file contents directly to clipboard 
- https://guides.github.com/
- https://hexo.io/ A fast, simple & powerful blog framework, powered by Node.js
- https://github.com/kamranahmedse/githunt
- https://github.com/521xueweihan/HelloGitHub


## 常用 Git 操作
- http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html
- [删除本地所有未提交的更改](https://www.v2ex.com/t/66718)
  - `git clean -df` 只删除所有untracked的文件，可后接指定目录
  - `git clean -xdf` 删除untracked以及ignore的文件
  - `git reset --hard` 把tracked的文件revert到前一个版本
- gitignore
  - https://github.com/github/gitignore
  - [忽略特定结构目录](https://ruby-china.org/topics/23561)
- 统计
  - https://github.com/oleander/git-fame-rb
- 永久删除某个文件，包括服务器端
  ```
  git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch FILENAME' --prune-empty --tag-name-filter cat -- --all
  git push origin master --force
  ```



## Self-hosted
- [Gitlab](https://about.gitlab.com/)
  - 可自建的Git服务器，web可视化界面、操作便捷，适合公司/团体使用。
  - [Gitlab简单教程](https://wuyuans.com/2017/05/gitlab-simple-tutorial)
  - [Gitlab架构](https://docs.gitlab.com/ee/development/architecture.html)
  - [Gitlab高可用](https://docs.gitlab.com/ee/administration/high_availability/)
- [Gogs](https://github.com/gogs/gogs) is a painless self-hosted Git service https://gogs.io
- [gitea](https://github.com/go-gitea/gitea) Git with a cup of tea, painless self-hosted git service https://gitea.io



## FAQ
- svn迁移到git
  - 官方文档：[迁移到 Git](https://git-scm.com/book/zh/v1/Git-%E4%B8%8E%E5%85%B6%E4%BB%96%E7%B3%BB%E7%BB%9F-%E8%BF%81%E7%A7%BB%E5%88%B0-Git)
- 换行符 CRLF 问题
  - **Q** [换行符自动转换](https://github.com/cssmagic/blog/issues/22)
  - **A** [换行符问题 - Git权威指南](http://www.worldhello.net/gotgit/08-git-misc/040-eol.html)  
    - 不要手动去设置 `core.autocrlf`，默认即可(`linux`,`macosx`为`false`, `win`为`true`)  
    - 设置: `git config --global core.safecrlf true`
    - 特别需求添加 `.gitattributes` 去约束
- push卡住的问题
  - **Q** push时卡在write objects.后续报fatal:The remote end hung up unexpectedly
  - **A** 问题原因是http.postBuffer默认上限为1M所致。将上限设为500M： 
    ```
    git config --global http.postBuffer 524288000
    ```
- [gitlab fetch/pull 失败](https://stackoverflow.com/questions/21277806/fatal-early-eof-fatal-index-pack-failed)
- 解决冲突出错
  - `git reset --hard` 无效  
    ```
    fatal: Unable to create '/.git/index.lock': File exists.
    If no other git process is currently running, this probably means a
    git process crashed in this repository earlier. Make sure no other git
    process is running and remove the file manually to continue.
    ```
  - [How do I fix a failed git commit?](http://stackoverflow.com/questions/8198966/how-do-i-fix-a-failed-git-commit)  
    Removing index.lock file manually from .git directory worked.  
    or From command line:  
    `$ rm -rf .git/index.lock`  
    Note: Make sure that only one index file exist on .git directory

- office文档的diff方案
  - [Microsoft Office and Git](https://www.ficonsulting.com/filabs/MSOfficeGit)
- [Pushing to Multiple Git Repos](https://gist.github.com/rvl/c3f156e117e22a25f242)
- [How to restore a deleted branch](https://confluence.atlassian.com/bbkb/how-to-restore-a-deleted-branch-765757540.html)

