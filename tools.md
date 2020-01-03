- [programming/development tools](programming-and-development#Tools)
- development [[document]] tools



# Search
- 指定url内查找相关信息，将以下内容放入Google的搜索框内并回车  
  `site:https://github.com/doubility-sky/daydayup/wiki 搜索`



# Design
- [Awesome Design Tools](https://github.com/LisaDziuba/Awesome-Design-Tools), The best design tools and plugins for everything. https://flawlessapp.io/designtools.
- [Axure RP](http://www.axure.com/) UI设计软件



# Image
### [ImageMagick](https://www.imagemagick.org/script/index.php)
- [ImageMagick：批量处理图像的超级利器](http://blog.sina.com.cn/s/blog_ba532aea0101bty5.html)
- [使用ImageMagick在命令行下处理图片](http://blog.just4fun.site/use-ImageMagick.html)
- [Linux命令 ImageMagick](http://pytool.com/2016/01/06/%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4-2016-01-01-Linux%E5%91%BD%E4%BB%A4-ImageMagick/)
- 常用 IM 命令
  - `convert image.png image.jpg`
  - `convert -resize 2732x2048! image.jpg new_image.jpg`
  - `convert image.png -background white -alpha off out.png` 关闭 alpha 通道 设置背景色
  - 批量转换当前目录所有png至jpg: `mogrify -format jpg *.png`
  - 批量拉伸(强制拉伸)当前目录下所有jpg至指定大小: `mogrify -resize 2732x2048! *.jpg`
  - 批量关闭 alpha 通道，设置背景色 `mogrify -background white -alpha off *.png`
  - 裁剪 `convert xxx.png -crop 229X81+0+82 +repage xxx-1.png`
- 生成 android icon 集合
  ```shell
  #!/bin/sh
  if [ "$1" == "" ]; then
  	echo "must have name of png"
  	exit 1
  fi
  dir=$1-res
  pic=$1.png
  mkdir ./$dir
  convert -resize 180x180! $pic ./$dir/shareicon.png
  mkdir -p ./$dir/drawable
  convert -resize 180x180! $pic ./$dir/drawable/$pic
  mkdir -p ./$dir/drawable-hdpi
  convert -resize 72x72!   $pic ./$dir/drawable-hdpi/$pic
  mkdir -p ./$dir/drawable-ldpi
  convert -resize 36x36!   $pic ./$dir/drawable-ldpi/$pic
  mkdir -p ./$dir/drawable-mdpi
  convert -resize 48x48!   $pic ./$dir/drawable-mdpi/$pic
  mkdir -p ./$dir/drawable-xhdpi
  convert -resize 96x96!   $pic ./$dir/drawable-xhdpi/$pic
  mkdir -p ./$dir/drawable-xxhdpi
  convert -resize 144x144! $pic ./$dir/drawable-xxhdpi/$pic
  mkdir -p ./$dir/drawable-xxxhdpi
  convert -resize 192x192! $pic ./$dir/drawable-xxxhdpi/$pic
  ```

### Compression
- [pngquant](https://pngquant.org/)
  - GUI https://imageoptim.com/
  - [recursively-batch-process-files-with-pngquant](https://stackoverflow.com/questions/9647920/recursively-batch-process-files-with-pngquant)
    - `find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;` 
    - `find . -name '*.png' -print0 | xargs -0 -P2 -L1 pngquant --ext .png --force 256` 多核处理(-P2)
- https://tinypng.com/ - Up to 20 images, max 5 MB each
- http://ppduck.com/
- https://github.com/chrissimpkins/Crunch
- ~~http://nullice.com/limitPNG , http://nullice.com/gluttonyPNG~~ 已无人维护，bug多不推荐



# Multimedia
- [VLC](https://www.videolan.org/) is a free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols.

## Audio
- `lame --mp3input --abr 32 ${infile} ${outfile}.mp3`
- `ffmpeg -i "${filename}.wav" -f mp3 "${filename}.mp3"`
- [使用 audacity/lame/ffmpeg 进行 mp3 文件瘦身](http://blog.zengrong.net/post/2624.html)


## Video
- [OBS Studio](https://github.com/obsproject/obs-studio), Free and open source software for live streaming and screen recording
- [LICEcap](https://github.com/justinfrankel/licecap) simple animated screen capture tool for Windows and OS X 


# SAAS
- [Atarity/deploy-your-own-saas](https://github.com/Atarity/deploy-your-own-saas) List of "only yours" cloud services for everyday needs

