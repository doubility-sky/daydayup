- [[Objective-C]]
- [[swift]]



## Learn
- https://github.com/BohdanOrlov/iOS-Developer-Roadmap
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/): Get in-depth information and UI resources for designing great apps that integrate seamlessly with Apple platforms.
- [IOS 绘图机制](http://www.cocoachina.com/industry/20140115/7703.html)
- [ios-good-practices](https://github.com/futurice/ios-good-practices) Good ideas for iOS development, by Futurice developers. http://www.futurice.com
- [iOS-InterviewQuestion-collection](https://github.com/liberalisman/iOS-InterviewQuestion-collection)

### Courses
- [斯坦福大学公开课 ios7-objective-c](http://open.163.com/special/opencourse/ios7.html)
- [斯坦福大学公开课 ios8-swift](http://open.163.com/special/opencourse/ios8.html)



## Projects
- [Open-Source iOS Apps](https://github.com/dkhamsing/open-source-ios-apps), A collaborative list of open-source iOS, watchOS and tvOS apps
- [Telegram-iOS](https://github.com/TelegramMessenger/Telegram-iOS)



## AppStore
- Xcode中Upload到AppStore时不成功，可以尝试用Application Loader上传，需要先在Xcode的Organizer中导出AppStore的ipa。
- [iOS Crash（崩溃）调试技巧](http://blog.csdn.net/studyrecord/article/details/7744809)   每次Upload前的归档文件一定要留着，其中包含了二进制文件，可以用于调试。
- [AppStore证书详解](http://blog.csdn.net/phunxm/article/details/42685597)
- 上传时报ERROR ITMS 90209段错误：
  删除luajit用于模拟器调试时添加的
  `-pagezero_size 10000 -image_base 100000000`
- 两个iphone搭建ipv6环境 https://zhang759740844.github.io/2017/03/31/%E7%94%B1%E4%BA%8EIPv6%E8%A2%AB%E6%8B%92/



## Tools
- [STCObfuscator](https://github.com/chenxiancai/STCObfuscator) iOS全局自动化 代码混淆 工具！支持cocoapod组件代码一并 混淆，完美避开hardcode方法、静态库方法和系统库方法！
- [Python-ZFJObsLib完美生成iOS垃圾代码](https://blog.csdn.net/u014220518/article/details/99086206)
- [App Icon Generator](https://appicon.co/)



## FAQs
- [iOS如何获得网络状态相关信息](http://www.jianshu.com/p/e8e8803c3b5d)
- 协作开发时，team设置为个人账号或none，如果在fix issuse时出现内购错误，可以删除linked库StoreKit.framework、并重新fix issue
- [WKWebView捕获JS Error 跨域解决](https://blog.csdn.net/lfdanding/article/details/104267874)
  ```objc
  [configuration setValue:@TRUE forKey:@"allowUniversalAccessFromFileURLs"];
  [configuration.preferences setValue:@"TRUE" forKey:@"allowFileAccessFromFileURLs"] ;
  ```



## Resources
- [awesome-ios](https://github.com/vsouza/awesome-ios)A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects
- [iOS apps](https://github.com/learn-anything/ios-apps): Awesome iOS apps
