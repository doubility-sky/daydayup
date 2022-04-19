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

### build & sign
- [多渠道打包的进化史](http://www.dss886.com/2017/11/22/01/)
- 查看签名：`apksigner verify -v ./XXX.apk`
- 重新签名（仅 V1）：`apksigner sign --v1-signing-enabled true --v2-signing-enabled false --v3-signing-enabled false --v4-signing-enabled false --ks ./XXX.keystore ./XXX.apk`



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



## Resources
- [Awesome Android](https://github.com/JStumpp/awesome-android), A curated list of awesome Android libraries and resources. For general Java libraries have a look at [awesome-java](https://github.com/akullpp/awesome-java).
- [Open-Source Android Apps](https://github.com/pcqpcq/open-source-android-apps), This is a collection of Android Apps which are open source.
- [AndroidDevTools](https://github.com/inferjay/AndroidDevTools): 收集整理Android开发所需的Android SDK、开发中用到的工具、Android开发教程、Android设计规范，免费的设计素材等。

