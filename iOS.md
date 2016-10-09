# 学习资料
### 入门资料
- [斯坦福大学公开课 ios7-objective-c](http://open.163.com/special/opencourse/ios7.html)
- [斯坦福大学公开课 ios8-swift](http://open.163.com/special/opencourse/ios8.html)

- [IOS 绘图机制](http://www.cocoachina.com/industry/20140115/7703.html)

### Swift 
- https://github.com/ipader/SwiftGuide
- http://wiki.jikexueyuan.com/project/swift/  
  The Swift Programming Language 中文版

### AppStore
- Xcode中Upload到AppStore时不成功，可以尝试用Application Loader上传，需要先在Xcode的Organizer中导出AppStore的ipa。
- [iOS Crash（崩溃）调试技巧](http://blog.csdn.net/studyrecord/article/details/7744809)   每次Upload前的归档文件一定要留着，其中包含了二进制文件，可以用于调试。
- [AppStore证书详解](http://blog.csdn.net/phunxm/article/details/42685597)
- 上传时报ERROR ITMS 90209段错误：删除luajit用于模拟器调试时添加的-pagezero_size 10000 -image_base 100000000

### 其他
- 协作开发时，team设置为个人账号或none，如果在fix issuse时出现内购错误，可以删除linked库StoreKit.framework、并重新fix issue