[Git](https://git-scm.com/) is a [free and open source](https://git-scm.com/about/free-and-open-source) distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Git is [easy to learn](https://git-scm.com/doc) and has a [tiny footprint with lightning fast performance](https://git-scm.com/about/small-and-fast). It outclasses SCM tools like Subversion, CVS, Perforce, and ClearCase with features like [cheap local branching](https://git-scm.com/about/branching-and-merging), convenient [staging areas](https://git-scm.com/about/staging-area), and [multiple workflows](https://git-scm.com/about/distributed).


- [Git Source Code Mirror](https://github.com/git/git) - This is a publish-only repository and all pull requests are ignored. Please follow Documentation/SubmittingPatches procedure for any of your improvements.
- https://git-scm.com/downloads



## [GUI Clients](https://git-scm.com/downloads/guis)
Git comes with built-in GUI tools for committing (git-gui) and browsing (gitk), but there are several third-party tools for users looking for platform-specific experience.
- :star:[Fork](https://fork.dev/) for Windows and Mac
- [Sourcetree](https://www.sourcetreeapp.com/): A free Git client for Windows and Mac
- [GitKraken](https://www.gitkraken.com/): Legendary Git client for Windows, Mac & Linux. Free for open source
- [lazygit](https://github.com/jesseduffield/lazygit): simple terminal UI for git commands



## Learn
- [Official Documentation](https://git-scm.com/doc)
- [Pro Git book](https://git-scm.com/book/en) - [zh-CN](https://git-scm.com/book/zh)
- [A Fast Intro to Git Internals](https://sites.google.com/a/chromium.org/dev/developers/fast-intro-to-git-internals)
- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) - [zh-CN](https://github.com/k88hudson/git-flight-rules/blob/master/README_zh-CN.md)
- [猴子都能懂的git入门](https://backlog.com/git-tutorial/cn/intro/intro1_1.html)

### tutorial
- [git - the simple guide](http://rogerdudler.github.io/git-guide/): just a simple guide for getting started with git. no deep shit ;)
- [Backlog Git Tutorial](https://backlog.com/git-tutorial/) - [猴子都能懂的GIT入门](http://backlogtool.com/git-guide/cn/)
- [Git for Computer Scientists](http://eagain.net/articles/git-for-computer-scientists/): Quick introduction to git internals for people who are not scared by words like [Directed Acyclic Graph](http://en.wikipedia.org/wiki/Directed_acyclic_graph) .
- [Githug](https://github.com/Gazler/githug) is designed to give you a practical way of learning git. It has a series of levels, each requiring you to use git commands to arrive at a correct answer.
- [Git 菜单](https://github.com/geeeeeeeeek/git-recipes): Git recipes in Chinese by Zhongyi Tong. 高质量的Git中文教程. https://geeeeeeeeek.github.io/git-recipes/
- [Git的奇技淫巧](https://github.com/521xueweihan/git-tips)

### commit style
- `git log --oneline $fromId..$toId`
- [Commit message 和 Change log 编写指南](http://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)
- [AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y)

### git flow
- [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
  - [基于git的源代码管理模型——git flow](http://www.ituring.com.cn/article/56870)



## Common Usage
- [常用 Git 命令清单](http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html)

### delete & clean
- [删除本地所有未提交的更改](https://www.v2ex.com/t/66718)
  - `git clean -df` 只删除所有untracked的文件，可后接指定目录
  - `git clean -xdf` 删除untracked以及ignore的文件
  - `git reset --hard` 把tracked的文件revert到前一个版本
- 永久删除某个文件，包括服务器端
  ```
  git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch FILENAME' --prune-empty --tag-name-filter cat -- --all
  git push origin master --force
  ```

### gitignore
- [github/gitignore](https://github.com/github/gitignore): A collection of useful .gitignore templates
- [忽略特定结构目录](https://ruby-china.org/topics/23561)
  - 忽略一个特定的文件：`/filename.extension`
  - 忽略所有同名的文件：`filename.extension`
  - 忽略一个特定的目录：`folder/`（这会连同其下所有子目录及文件都被忽略）
  - 但是排除一个特定的模式：（在 3 的基础上）`!folder/some/important/filename.extension`
  - 忽略指定目录下所有子目录下的特定文件：`folder/**/filename.extension`
  - 同上，但是只匹配文件扩展名：`folder/**/*.extension`
  - 同上，但是只匹配特定的目录：`folder/**/tmp/`



## [GitHub Guides](https://guides.github.com/)
- [GitHub CLI](https://github.com/cli/cli): GitHub’s official command line tool
- [GitHub Cheat Sheet](https://github.com/tiimgreen/github-cheat-sheet): A list of cool features of Git and GitHub.
- [The gist gem](https://github.com/defunkt/gist) provides a gist command that you can use from your terminal to upload content to https://gist.github.com/.
- [enhanced-github](https://github.com/softvar/enhanced-github/), [Chrome extension](https://chrome.google.com/webstore/detail/github-plus/anlikcnbgdeidpacdbdljnabclhahhmd) to display size of each file, download link and copy file contents directly to clipboard 
- [GitHub Audio](https://github.com/debugger22/github-audio): Listen to music generated by events happening across GitHub :octocat: 🎷
- [GitHub 漫游指南](https://github.com/phodal/github)- a Chinese ebook on how to build a good project on Github. Explore the users' behavior. Find some thing interest.

### projects
- [github-rank](https://github.com/jaywcjlove/github-rank): 🕷️Github 中国和全球用户排名，全球仓库 Star 最多排名(自动日更)。
- [GitHunt](https://github.com/kamranahmedse/githunt): Hunt the most starred projects on any date on GitHub
- [HelloGitHub](https://github.com/521xueweihan/HelloGitHub): Find pearls on open-source seashore 分享 GitHub 上有趣、入门级的开源项目

### profiles
- [GitHub Résumé](https://github.com/resume/resume.github.com), A service that creates a résumé based on your GitHub repos/activity.
- [profile-summary-for-github](https://github.com/tipsy/profile-summary-for-github): Tool for visualizing GitHub profiles
- [🦄 Sourcerer app](https://github.com/sourcerer-io/sourcerer-app) makes a visual profile from your GitHub and git repositories.
- [GitHub Readme Stats](https://github.com/anuraghazra/github-readme-stats)⚡ Dynamically generated stats for your github readmes



## Tools
- [git filter-repo](https://github.com/newren/git-filter-repo) is a versatile tool for rewriting history
- [Lepton](https://github.com/hackjutsu/Lepton) is a lean code snippet manager based on GitHub Gist. [Check out its latest release](https://github.com/hackjutsu/Lepton/releases).
- [GRV](https://github.com/rgburke/grv) is a terminal interface for viewing git repositories
- [git-crypt](https://github.com/AGWA/git-crypt) enables transparent encryption and decryption of files in a git repository.
- [Git Extensions](https://github.com/gitextensions/gitextensions) is a standalone UI tool for managing git repositories. It also integrates with Windows Explorer and Microsoft Visual Studio
- [hexo](https://hexo.io/): A fast, simple & powerful blog framework
- [dulwich](https://github.com/jelmer/dulwich): Pure-Python Git implementation

### statistics
- [▁▅▆▃▅ Git quick statistics](https://github.com/arzzen/git-quick-stats) is a simple and efficient way to access various statistics in git repository.
- [git-fame](https://github.com/oleander/git-fame-rb) is a command-line tool that helps you summarize and pretty-print collaborators in a git repository based on contributions.

### collaborate
- [Gitalk](https://github.com/gitalk/gitalk) is a modern comment component based on Github Issue and Preact.
- [git-bug](https://github.com/MichaelMure/git-bug): Distributed, offline-first bug tracker embedded in git, with bridges

### self-hosted
- [Gitlab](https://about.gitlab.com/), 可自建的Git服务器，web可视化界面、操作便捷，适合公司/团体使用
  - [GitLab architecture](https://docs.gitlab.com/ee/development/architecture.html)
  - [Running GitLab in a memory-constrained environment](https://docs.gitlab.com/omnibus/settings/memory_constrained_envs.html)
  - 自建 Docker 版本，端口映射内外不一致时（容器内部端口为默认）， 项目页面点击 `clone` 按钮后的 URL 展示问题
    - 假设：`--publish 8443:443 --publish 8080:80 --publish 8022:22`
    - 编辑配置 `vi /etc/gitlab/gitlab.rb` 
    - 选项 `Clone with SSH` 下的 URL
      - `gitlab_rails['gitlab_shell_ssh_port'] = 8022`
    - 选项 `Clone with HTTP[S]` 下的 URL
      - 修改 `external_url` 并带上端口（如果 docker 启动时未设置正确的话）
      - 重写 `nginx['listen_port'] = 80`（如不重写此端口，将会根据 `external_url` 改变监听端口）
    - `gitlab-ctl reconfigure`
- [Gogs](https://github.com/gogs/gogs) is a painless self-hosted Git service https://gogs.io
- [gitea](https://github.com/go-gitea/gitea) Git with a cup of tea, painless self-hosted git service https://gitea.io
- [onedev](https://github.com/theonedev/onedev) Super Easy All-In-One DevOps Platform

### others
- [Gource](https://github.com/acaudwell/Gource) is a visualization tool for source control repositories.



## FAQs
- [[svn]] 迁移到 git
  - 官方文档：[迁移到 Git](https://git-scm.com/book/zh/v1/Git-%E4%B8%8E%E5%85%B6%E4%BB%96%E7%B3%BB%E7%BB%9F-%E8%BF%81%E7%A7%BB%E5%88%B0-Git)
- 换行符 CRLF 问题
  - **Q** [换行符自动转换](https://github.com/cssmagic/blog/issues/22)
  - **A** [换行符问题 - Git权威指南](http://www.worldhello.net/gotgit/08-git-misc/040-eol.html)  
    - 不要手动去设置 `core.autocrlf`，默认即可(`linux`,`macosx`为`false`, `win`为`true`)  
    - 设置: `git config --global core.safecrlf true`
    - 特别需求添加 `.gitattributes` 去约束
      - 由于 `win` 为 `true`，会对文本文件自动添加 `CR`，如不希望此行为，将其视为二进制文件
- push卡住的问题
  - **Q** push时卡在write objects.后续报fatal:The remote end hung up unexpectedly
  - **A** 问题原因是http.postBuffer默认上限为1M所致。将上限设为500M： 
    ```
    git config --global http.postBuffer 524288000
    ```
- [gitlab fetch/pull 失败](https://stackoverflow.com/questions/21277806/fatal-early-eof-fatal-index-pack-failed)
- [error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)](https://stackoverflow.com/questions/59282476/error-rpc-failed-curl-92-http-2-stream-0-was-not-closed-cleanly-protocol-erro)
  - `git config --global http.version HTTP/1.1`
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
- 重命名某个文件时，仅改变大小写问题。如：`a.c` -> `A.c`
  1. 备份并删除 `a.c` 提交；添加并提交 `A.c`
  2. `git mv a.c A.c`
- 本地 repo 瘦身 `git reflog expire --expire=now --all && git gc --prune=now --aggressive`
- clean history and re-init
  ```shell
  git checkout --orphan latest_branch
  git add -A
  git commit -am "init"
  git branch -D master
  git branch -m master
  git push -f origin master
  ```
- Push an existing folder
  ```shell
  cd existing_folder
  git init --initial-branch=main
  git remote add origin XXXURL
  git add .
  git commit -m "Initial commit"
  git push -u origin main
  ```
- [should have been pointers, but weren't](https://stackoverflow.com/questions/46704572/git-error-encountered-7-files-that-should-have-been-pointers-but-werent)
  ```shell
  git lfs uninstall && git reset --hard && git lfs install && git lfs pull
  ```
- [GIT LFS file lock/unlocking and unable to write the file after unlock with --force option.](https://github.com/git-lfs/git-lfs/issues/3733)
- git lfs untrack
  - pull/update all lfs to local `git lfs pull`
  - remove all tracks `git lfs untrack "*.filetype1" "*.filetype2" ...`
  - refresh all cache `git rm --cached "*.filetype1" "*.filetype2" ...`
  - add `.gitattributes`
  - commit all previous lfs files
- Unload submodule from project but not remove/delete it.
  - `git submodule deinit -f SUB_PATH`
- 远程分支推送
  - `git push --prune <new-remote> +refs/remotes/<old-remote>/*:refs/heads/* +refs/tags/*:refs/tags/*`
- 检查忽略源头 `git check-ignore -v Data~`
- 查看全局忽略文件 `git config --global core.excludesFile`
- [git clone: warning: --depth is ignored in local clones; use file:// instead](https://stackoverflow.com/questions/40383230/git-clone-warning-depth-is-ignored-in-local-clones-use-file-instead)
  - `git clone --depth 1 file://$(pwd)/src_repo new_repo`
