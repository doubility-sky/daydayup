## Programming Languages
- [[Objective-C]]
- [[swift]]



## Learn
- [斯坦福大学公开课 ios7-objective-c](http://open.163.com/special/opencourse/ios7.html)
- [斯坦福大学公开课 ios8-swift](http://open.163.com/special/opencourse/ios8.html)
- [IOS 绘图机制](http://www.cocoachina.com/industry/20140115/7703.html)
- https://github.com/futurice/ios-good-practices
- [iOS-InterviewQuestion-collection](https://github.com/liberalisman/iOS-InterviewQuestion-collection)



## Projects
- https://github.com/vsouza/awesome-ios
- https://github.com/learn-anything/ios-apps
- [Open-Source iOS Apps](https://github.com/dkhamsing/open-source-ios-apps), A collaborative list of open-source iOS, watchOS and tvOS apps



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



## FAQ
- [iOS如何获得网络状态相关信息](http://www.jianshu.com/p/e8e8803c3b5d)
- 协作开发时，team设置为个人账号或none，如果在fix issuse时出现内购错误，可以删除linked库StoreKit.framework、并重新fix issue

