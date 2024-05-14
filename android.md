[Android](https://www.android.com/) is a [mobile operating system](https://en.wikipedia.org/wiki/Mobile_operating_system) based on a modified version of the [[Linux]] kernel and other open source software, designed primarily for touchscreen mobile devices such as [smartphones](https://en.wikipedia.org/wiki/Smartphone) and tablets. Android is developed by a consortium of developers known as the Open Handset Alliance and commercially sponsored by Google. It was unveiled in November 2007, with the [first commercial Android device](https://en.wikipedia.org/wiki/HTC_Dream) launched in September 2008.


- https://developer.android.com/index.html



## Learn
- [Android Developer](https://roadmap.sh/android): Step by step guide to becoming an Android developer
- [Android Developer Roadmap](https://github.com/mobile-roadmap/android-developer-roadmap)
- [Training for Android developers](https://developer.android.com/training/index.html) - [zh-CN](http://hukai.me/android-training-course-in-chinese/)
- [Android Examples](https://github.com/nisrulz/android-examples) :shipit: [Examples] Simple basic isolated apps, for budding android devs.
- [Android Tips & Tricks](https://github.com/nisrulz/android-tips-tricks) ☑️ [Cheatsheet] Tips and tricks for Android Development



## Practice
- [Best practices in Android development](https://github.com/futurice/android-best-practices): Do's and Don'ts for Android development, by Futurice developers
- [Android Interview Questions](https://github.com/MindorksOpenSource/android-interview-questions)

### build
- [多渠道打包的进化史](http://www.dss886.com/2017/11/22/01/)

### apk unpack & repack
- `apktool d test.apk`
- `apktool b test -o test.apk`
- ~~`jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore test.keystore test.apk test -signedjar test_signed.apk`~~
- `apksigner sign --v1-signing-enabled true --v2-signing-enabled false --v3-signing-enabled false --ks test.keystore test.apk`

### sign
- 查看签名：
  - `apksigner verify -v ./XXX.apk`
  - [Get APK Certificate Signature](https://gist.github.com/arturokunder/161a2a0d70bdca13931c0303bab348a9)
    - unzip the APK and extract the file `/META-INF/XXX.RSA`
    - `keytool -printcert -file XXX.RSA`
- 重新签名（仅 V1）：
  - `apksigner sign --v1-signing-enabled true --v2-signing-enabled false --v3-signing-enabled false --ks ./XXX.keystore ./XXX.apk`
- `keytool -printcert -jarfile XXX.apk`
- `keytool -list -v -keystore XXX.keystore`

### [Android App Bundles](https://developer.android.com/guide/app-bundle)
- [Bundletool](https://github.com/google/bundletool) is a command-line tool to manipulate Android App Bundles
  - 查询 aab version code `bundletool dump manifest --xpath /manifest/@android:versionCode --bundle AAB_FILE_PATH`



## Projects
- [Telegram for Android source](https://github.com/DrKLO/Telegram)
- [topeka](https://github.com/googlesamples/android-topeka), A fun to play quiz that showcases material design on Android
- [androidpn](https://github.com/dannytiehui/androidpn), An open source project to provide push notification support for Android -- a xmpp based notification server and a client tool kit.



## Tools
- [scrcpy](https://github.com/Genymobile/scrcpy), Display and control your Android device
- [LeakCanary](https://github.com/square/leakcanary/) is a memory leak detection library for Android. https://square.github.io/leakcanary
- [AndroidGodEye](https://github.com/Kyson/AndroidGodEye) A performance monitor tool , like "Android Studio profiler" for Android , you can easily monitor the performance of your app real time in pc browser
- [Anbox](https://github.com/anbox/anbox) is a container-based approach to boot a full Android system on a regular GNU/Linux system https://anbox.io
- [AndroidAutoSize](https://github.com/JessYanCoding/AndroidAutoSize): A low-cost Android screen adaptation solution (今日头条屏幕适配方案终极版，一个极低成本的 Android 屏幕适配方案).



## FAQs
- 旋转引起 Activity 销毁、创建
  - [Android旋转屏幕时阻止activity重建](https://blog.csdn.net/u011421608/article/details/50883665)
    - `android:configChanges="orientation|screenSize"`
  - [最近碰到的接微信支付引起的坑爹问题](https://www.cnblogs.com/lbfamous/p/5144425.html)
- [网易MuMu模拟器MacOS环境连接调试](https://www.jianshu.com/p/9e6fc03705f3)
  - `adb connect 127.0.0.1:22471`
- [AndroidStudio 代码全红，但可正常运行解决方法及解决后续代理的问题](https://blog.csdn.net/liujie33852964/article/details/80590554)
  - File -> Invalidate Caches/Restart...
- [Error type 3 Error: Activity class {} does not exist](https://stackoverflow.com/questions/20915266/error-type-3-error-activity-class-does-not-exist)
  - File -> Invalidate Caches/Restart...
- 查看手机 OpenGLES 版本方法
  ```sh
  adb shell getprop ro.opengles.version
  # 确认返回值
  # ro.opengles.version=65535 # OpenGL ES 1.0
  # ro.opengles.version=65536 # OpenGL ES 1.1
  # ro.opengles.version=131072 # OpenGL ES 2.0
  # ro.opengles.version=196608 # OpenGL ES 3.0
  # ro.opengles.version=196609 # OpenGL ES 3.1
  ```
- 使用 adb 卸载指定 app
  ```
  adb devices
  adb shell pm list packages
  adb uninstall com.xxx.xxx
  ```
- [小米电视使用ADB模式安装软件](https://zhuanlan.zhihu.com/p/374069891)
  - 局域网链接 `adb connect 192.168.50.91`
  - 文本输入   `adb shell input text "something very long ...."`
- [adb: error: failed to read copy response](https://github.com/Genymobile/scrcpy/issues/3241)
  - You should try with another USB cable/port: https://github.com/Genymobile/scrcpy/blob/master/FAQ.md#device-disconnected
  - If this does not fix the problem, might be a bug in the ROM (try with another device to confirm).
- [App size increases when upgrading build tools and gradle version](https://github.com/flutter/flutter/issues/79619)
  - v3.6+ The so library is no longer compressed, so that the operating system can map the so memory.
  - [Native libraries packaged uncompressed by default](https://developer.android.com/studio/past-releases/past-agp-releases/agp-3-6-0-release-notes#extractNativeLibs)
- [关于Android12安装apk出现-108异常INSTALL_PARSE_FAILED_MANIFEST_MALFORMED的解决方法](https://stars-one.site/2022/11/22/android12-install-108)
- [This app was built for an older version of Android and doesn't include the latest privacy protections](https://stackoverflow.com/questions/73517346/this-app-was-built-for-an-older-version-of-android-and-doesnt-include-the-lates/73933945#73933945)
  - Google started to enforce using minimum targetSdkVersion of 26 for APK installed outside the Google Play Store.
  - Playing with Android 14 Beta 3 and targetSdkVersion is minimum at '28' now.



## Resources
- [Awesome Android](https://github.com/JStumpp/awesome-android), A curated list of awesome Android libraries and resources. For general Java libraries have a look at [awesome-java](https://github.com/akullpp/awesome-java).
- [Open-Source Android Apps](https://github.com/pcqpcq/open-source-android-apps), This is a collection of Android Apps which are open source.
- [AndroidDevTools](https://github.com/inferjay/AndroidDevTools): 收集整理Android开发所需的Android SDK、开发中用到的工具、Android开发教程、Android设计规范，免费的设计素材等。

