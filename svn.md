很无奈，虽然更推荐 [[git]] 
但还是可能在工作中再接触到 svn - Subversion

- [svn-book Version Control with Subversion](http://svnbook.red-bean.com/en/1.7/svn-book.html)
- [Subversion 版本控制](http://svnbook.red-bean.com/nightly/zh/svn-book.html)


### 常用命令
- `svn help`
- [SVN常用命令](https://gaomf.cn/2017/03/30/SVN/)

### 添加忽略
- [svn ignore 的用法](http://www.cnblogs.com/youxin/p/6624704.html)
- [使用命令行设置svn忽略列表](http://www.cnblogs.com/yuanyq/p/3667190.html)
- `svn propset svn:ignore 'xxx' xdir` 为 `xdir` 添加 `xxx` 忽略内容
- `svn propedit svn:ignore xdir` 打开 svn 的编辑器，编辑针对 `xdir` 的忽略列表

### 清除未版本控制文件，类似 `git clean -fd`
- [清除SVN未版控文件](http://blog.csdn.net/caz28/article/details/50246951)
    - `svn st | grep '^?' | awk '{print $2}' | xargs rm -rf`




