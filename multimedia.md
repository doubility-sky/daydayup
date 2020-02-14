[Multimedia](https://en.wikipedia.org/wiki/Multimedia) is content that uses a combination of different content forms such as text, audio, images, animations, video and interactive content. Multimedia contrasts with media that use only rudimentary computer displays such as text-only or traditional forms of printed or hand-produced material.



## Image
- [Caire](https://github.com/esimov/caire) is a content aware image resize library based on [Seam Carving for Content-Aware Image Resizing](https://inst.eecs.berkeley.edu/~cs194-26/fa16/hw/proj4-seamcarving/imret.pdf) paper.

### [ImageMagick](https://www.imagemagick.org/script/index.php)
- [ImageMagick：批量处理图像的超级利器](http://blog.sina.com.cn/s/blog_ba532aea0101bty5.html)
- [使用ImageMagick在命令行下处理图片](http://blog.just4fun.site/use-ImageMagick.html)
- [Linux命令 ImageMagick](http://pytool.com/2016/01/06/%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4-2016-01-01-Linux%E5%91%BD%E4%BB%A4-ImageMagick/)
- <details> <summary> 常用 IM 命令 </summary>

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

</details>

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



## Audio
- `lame --mp3input --abr 32 ${infile} ${outfile}.mp3`
- `ffmpeg -i "${filename}.wav" -f mp3 "${filename}.mp3"`
- [使用 audacity/lame/ffmpeg 进行 mp3 文件瘦身](http://blog.zengrong.net/post/2624.html)
- [aubio](https://github.com/aubio/aubio) a library for audio and music analysis https://aubio.org
- [RtAudio](https://github.com/thestk/rtaudio) A set of C++ classes that provide a common API for realtime audio input/output across Linux (native ALSA, JACK, PulseAudio and OSS), Macintosh OS X (CoreAudio and JACK), and Windows (DirectSound, ASIO and WASAPI) operating systems.
- [libsoundio](https://github.com/andrewrk/libsoundio) C library providing cross-platform audio input and output. The API is suitable for real-time software such as digital audio workstations as well as consumer software such as music players.



## Video
- [VLC](https://www.videolan.org/) is a free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols.
- [OBS Studio](https://github.com/obsproject/obs-studio), Free and open source software for live streaming and screen recording
- [LICEcap](https://github.com/justinfrankel/licecap) simple animated screen capture tool for Windows and OS X 
- [mpv](https://github.com/mpv-player/mpv) is a free (as in freedom) media player for the command line. It supports a wide variety of media file formats, audio and video codecs, and subtitle types.
- [ijkplayer](https://github.com/bilibili/ijkplayer) Android/iOS video player based on FFmpeg n3.4, with MediaCodec, VideoToolbox support.
- [Bento4](https://github.com/axiomatic-systems/Bento4) Full-featured MP4 format and MPEG DASH library and tools



## Projects
- [NodeTube](https://github.com/mayeaux/nodetube) is an open-source YouTube alt that offers video, audio and image uploads, livestreaming and built-in monetization
