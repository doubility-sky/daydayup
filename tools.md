
# Search
- 指定url内查找相关信息 - 将以下内容放入Google的搜索框内并回车:   
    `site:https://github.com/doubility-sky/daydayup/wiki 搜索`

# 设计工具
- [Axure RP](http://www.axure.com/) UI设计软件

# 绘图工具
### [Graphviz](http://www.graphviz.org/) 
- 贝尔实验室AT&T出品
- 成品质量奇佳，超高端
- C++ boost 库都有API支持
- 有独立语言DOT支持，入门不易

###### 入门指南
- [使用 Graphviz 生成自动化系统图](http://www.ibm.com/developerworks/cn/aix/library/au-aix-graphviz/)

#### [draw.io](https://www.draw.io/)
- 云端绘图，可导出各个网盘
- 需要翻墙2016-01-20


# 图像处理
### ImageMagick
- [ImageMagick：批量处理图像的超级利器](http://blog.sina.com.cn/s/blog_ba532aea0101bty5.html)
- [使用ImageMagick在命令行下处理图片](http://blog.just4fun.site/use-ImageMagick.html)
- [Linux命令 ImageMagick](http://pytool.com/2016/01/06/%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4-2016-01-01-Linux%E5%91%BD%E4%BB%A4-ImageMagick/)

#### 常用 IM 命令
- `convert image.png image.jpg`
- `convert -resize 2732x2048! image.jpg new_image.jpg`
- `convert image.png -background white -alpha off out.png` 关闭 alpha 通道 设置背景色
- 批量转换当前目录所有png至jpg: `mogrify -format jpg *.png`
- 批量拉伸(强制拉伸)当前目录下所有jpg至指定大小: `mogrify -resize 2732x2048! *.jpg`
- 批量关闭 alpha 通道，设置背景色 `mogrify -background white -alpha off *.png`
- 裁剪 `convert xxx.png -crop 229X81+0+82 +repage xxx-1.png`

### 图像压缩
- https://tinypng.com/ - Up to 20 images, max 5 MB each.

### [pngquant](https://pngquant.org/)
- [recursively-batch-process-files-with-pngquant](https://stackoverflow.com/questions/9647920/recursively-batch-process-files-with-pngquant)
  - `find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;` 
  - `find . -name '*.png' -print0 | xargs -0 -P2 -L1 pngquant --ext .png --force 256` 多核处理(-P2)
- GUI https://imageoptim.com/

# 音频处理
- `lame --mp3input --abr 32 ${infile} ${outfile}.mp3`
- `ffmpeg -i "$file" -f mp3 "${filename}.mp3"`
- [使用 audacity/lame/ffmpeg 进行 mp3 文件瘦身](http://blog.zengrong.net/post/2624.html)

# 代码相关
### 编辑器
- vim
  - [The Ultimate vimrc](https://github.com/amix/vimrc)
- emacs
- 新世纪编辑器
    - [atom](https://github.com/doubility-sky/daydayup/wiki/atom-editor "GitHub 出品") 基于 electron
    - [vscode](https://code.visualstudio.com/) 微软出品，与 atom 一样基于 electron
- 小清新
    - [[sublime]] 速度飞快 (打开大文件表现好）
    - notepad++ (Windows Only)
- 重量级
    - [source insight](http://www.sourceinsight.com/) 收费，windows only

### 格式化
- [Artistic Style](http://astyle.sourceforge.net/)   
  格式化利器，别人代码瞬间变成你熟悉的风格。以下为一个使用命令案例:
```
AStyle.exe --mode=c --style=kr --indent=force-tab --attach-namespaces --attach-classes --attach-inlines --indent-switches --indent-col1-comments --pad-oper --pad-header --unpad-paren --align-pointer=type --fill-empty-lines --add-brackets --recursive --suffix=none *.c *.cpp *.h *.hpp
```
- [clang-format](http://clang.llvm.org/docs/ClangFormat.html)  
  [用 ClangFormat 插件格式化 Objective-C 代码](http://phenmod.com/blog/2015/11/17/use-clangformat-to-format-objective-c-code/)

### 行数统计
- [Count Lines of Code](https://github.com/AlDanial/cloc)
