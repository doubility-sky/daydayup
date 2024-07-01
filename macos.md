- [[BSD]], [[Linux]]
- [[Objective-C]], [[swift]]



## Learn
- [macOS-Security-and-Privacy-Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide) - [zh-CN](https://github.com/drduh/macOS-Security-and-Privacy-Guide/blob/master/README-cn.md)



## Common Usage
- System infomation
  - `brew install neofetch`
- CPU infomation
  - `sysctl -a | sort | grep cpu`
  - `sysctl -n hw.ncpu`
  - `sysctl -n hw.physicalcpu`
- 清屏 Terminal `clear` （实际上仅是滚动光标至顶部）
- 彻底清屏 Termimal `cmd + k`
- 选中多个文件 `command+option+i` 查看总大小
- 查看 Bundle ID: 
  - `osascript -e 'id of app "SomeApp"'`
  - `mdls -name kMDItemCFBundleIdentifier -r AbsolutePathOfSomeApp.app`
- 查看当前监听的端口列表： `netstat -AaLlnW`



## Softwares
- [Homebrew](https://github.com/Homebrew/brew): 🍺 The missing package manager for macOS (or Linux)
- [Homebrew Cask](https://github.com/Homebrew/homebrew-cask): 🍻 A CLI workflow for the administration of macOS applications distributed as binaries

### Command-line
- [neofetch](https://github.com/dylanaraps/neofetch): Fast, highly customisable system info script
- [tree 命令，终端展示你的目录树结构](http://yijiebuyi.com/blog/c0defa3a47d16e675d58195adc35514b.html)
- [OS X 磁盘空间分析工具: ncdu](http://www.yewen.us/blog/2015/09/ncdu-on-os-x/)
  - `brew install ncdu`
  - `ncdu / --exclude /Volumes`
- `du -hd1` 以 human readable 格式，展示当前目录所有子目录大小
  - 注：与 linux 下不同，a 与 d 互斥

### Menu-bar
- [eul](https://github.com/gao-sun/eul): 🖥️ macOS status monitoring app written in SwiftUI.
- [hidden](https://github.com/dwarvesf/hidden) A ultra-light MacOS utility that helps hide menu bar icons https://d.foundation/opensource

### Finder
- :star:[Quick Look plugins](https://github.com/sindresorhus/quick-look-plugins) List of useful Quick Look plugins for developers
  - install all `brew install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package apparency quicklookase qlvideo`
  - install more `brew install provisionql quicklookapk quicklook-pat webpquicklook syntax-highlight`
- [Go2Shell](https://zipzapmac.com/Go2Shell) opens a terminal window to the current directory in Finder. `brew cask install go2shell`
- [OpenInTerminal](https://github.com/Ji4n1ng/OpenInTerminal) Finder Toolbar app for macOS to open the current directory in Terminal, iTerm, Hyper or Alacritty.

### Applications
- [LICEcap](https://github.com/justinfrankel/licecap) simple animated screen capture tool for Windows and OS X 
- [IINA](https://github.com/iina/iina) is the modern video player for macOS. https://iina.io



## Xcode
- [Xcode 缓存及垃圾文件清理](https://www.jianshu.com/p/c695b68ef951)
  - 删除旧设备支持 `~/Library/Developer/Xcode/iOS DeviceSupport`
  - 删除旧模拟支持 `~/Library/Application Support/iPhone Simulator`
  - 项目索引及日志 `~/Library/Developer/Xcode/DerivedData`

### Projects
- [Source code of Telegram](https://github.com/overtake/TelegramSwift) for macos on Swift 5.0 https://macos.telegram.org
  - [Source code of Telegram](https://github.com/overtake/telegram) obj-c version of macos client, now is no longer supported.



## Tools
- [mackup](https://github.com/lra/mackup) Keep your application settings in sync (OS X/Linux)
- [How to set a file or folder to be ignored](https://help.dropbox.com/sync/ignored-files)
  - If you’re running macOS 12.3 or earlier:
    - Ignore it `xattr -w com.dropbox.ignored 1 '/Users/yourname/Dropbox (Personal)/YourFileName.pdf'`
    - Don't ignore `xattr -d com.dropbox.ignored '/Users/yourname/Dropbox (Personal)/YourFileName.pdf'`
  - If you’re running macOS 12.5 or later and have the updated version of Dropbox for macOS on File Provider:
    - Switch it `xattr -d 'com.apple.fileprovider.ignore#P' '/Users/yourname/Library/CloudStorage/Dropbox-Personal/YourFileName.pdf'`



## FAQs
- [How to identify the terminal from a script?](https://superuser.com/questions/683962/how-to-identify-the-terminal-from-a-script)
  - `$TERM_PROGRAM`, iTerm sets it to `iTerm.app`, and Terminal.app to `Apple_Terminal`.
- [Mac的最大连接数限制和端口的相关参数的设置](http://tinylee.info/mac-maxfiles-portrange.html)
- [让终端走代理的几种方法](https://blog.fazero.me/2015/09/15/%E8%AE%A9%E7%BB%88%E7%AB%AF%E8%B5%B0%E4%BB%A3%E7%90%86%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E6%B3%95/)
- 网络编程 macOS 总是弹出防火墙链接确认
    - https://github.com/codegangsta/gin/issues/12#issuecomment-40519008
    - [Suppressing Accept Incoming Network Connections warnings on OSX](https://medium.com/@leeprovoost/suppressing-accept-incoming-network-connections-warnings-on-osx-7665b33927ca)
- macOS 删除 chrome 地址栏联想内容
  - 按向下箭头键以突出显示相应内容，然后按 Shift + fn + Delete 键
- [Mac关闭顽固的开机启动程序](https://www.jianshu.com/p/dcf6de92a2b5)
  - 使用登录项添加自启动项 `设置 -> 用户与群组 -> 登录项`
  - 使用 Homebrew `brew services [run/start/stop/restart/../list/help]`
  - 使用 launchctl 工具
    - 所在目录：
      ```bash
      ~/Library/LaunchAgents        # 特定用户登录后以当前用户启动，第三方程序一般都放这里
      /Library/LaunchAgents         # 任一用户登录后以当前用户启动，管理员使用
      /Library/LaunchDaemons        # 系统装载时以root用户启动，管理员使用
      /System/Library/LaunchAgents  # 系统组件，任一用户登录后以当前用户启动
      /System/Library/LaunchDaemons # 系统组件，系统装载时以root用户启动
      ```
    - `launchctl list` 查看当前所有自启动项
    - `launchctl load XXX` 添加自启动项
    - `launchctl unload XXX` 删除自启动项
    - for example
      ```bash
      # 以下重启后无效
      launchctl stop /Library/LaunchAgents/com.epson.esua.launcher.plist
      launchctl stop /Library/LaunchAgents/com.epson.eventmanager.agent.plist
      launchctl stop /Library/LaunchAgents/com.epson.scannermonitor.plist
      launchctl unload /Library/LaunchAgents/com.epson.esua.launcher.plist
      launchctl unload /Library/LaunchAgents/com.epson.eventmanager.agent.plist
      launchctl unload /Library/LaunchAgents/com.epson.scannermonitor.plist
      ```
    - 修改 plist 文件，将 KeepAlive 和 RunAtLoad 等改为 false
- xargs 之类的 shell 命令，参数格式与 Linux 有些不一样，如何与 Linux 统一起来？
  - 需要 GNU 系列工具 `brew install coreutils gnu-sed`
  - 把 PATH 路径放到前面，确保使用的都是 brew 安装的 GNU 命令
- 重置 launchpad：`defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock`
- 弹框无法关闭 `Command ＋ Option + Shift ＋ Ecs`
- [MacBook Pro充不进电?](https://www.zhihu.com/question/27832008)
- [macOS App debug](https://twitter.com/tualatrix/status/1777574176330789143?s=61&t=5RWMOkan8LQlrorqSXmjQw)
  - [-_NS_4445425547 YES](https://mjtsai.com/blog/2024/03/22/_eventfirstresponderchaindescription/#comment-4059578)



## Resources
- [awesome-mac](https://github.com/jaywcjlove/awesome-mac) Now we have become very big, Different from the original idea. Collect premium software in various categories. https://git.io/macx
- [awesome-macOS](https://github.com/iCHAIT/awesome-macOS) A curated list of awesome applications, softwares, tools and shiny things for macOS.

### applications
- [my-mac-os](https://github.com/nikitavoloboev/my-mac-os) List of applications and tools that make my macOS experience even more amazing
- [open-source-mac-os-apps](https://github.com/serhii-londar/open-source-mac-os-apps) Awesome list of open source applications for macOS.
- [程序员的macOS系列：精选 Mac App](https://ihtcboy.com/2018/07/15/2018-07-15_%E7%A8%8B%E5%BA%8F%E5%91%98%E7%9A%84macOS%E7%B3%BB%E5%88%97%EF%BC%9A%E7%B2%BE%E9%80%89MacApp/)
