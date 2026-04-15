In [computing](https://en.wikipedia.org/wiki/Computing), a [shell](https://en.wikipedia.org/wiki/Shell_(computing)) is a command-line interpreter which exposes access to an operating system's services. In general, operating system shells use either a [command-line interface](https://en.wikipedia.org/wiki/Command-line_interface) (CLI) or [graphical user interface](https://en.wikipedia.org/wiki/Graphical_user_interface) (GUI), depending on a computer's role and particular operation. It is named a shell because it is the outermost layer around the operating system.

Command-line shells require the user to be familiar with commands and their calling [syntax](https://en.wikipedia.org/wiki/Syntax), and to understand concepts about the shell-specific scripting language (for example, [bash](https://en.wikipedia.org/wiki/Bash_shell)).


- [[linux]]
- [[macos]]
- [[operating-system]]


## Learn
- [You Don't Need GUI](https://github.com/you-dont-need/You-Dont-Need-GUI): Stop relying on GUI; CLI **ROCKS**
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line), Master the command line, in one page. - [zh-CN](https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md)
- [命令行通配符教程](https://www.ruanyifeng.com/blog/2018/09/bash-wildcards.html)
  - [What do double-asterisk (**) wildcards mean?](https://stackoverflow.com/questions/28176590/what-do-double-asterisk-wildcards-mean/28199633#28199633)
- [Modern PATH environment variable](https://blog.izissise.net/posts/env-path/)

### scripting
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html): An in-depth exploration of the art of shell scripting
- [Shell 脚本编程30分钟入门](https://github.com/qinjx/30min_guides/blob/master/shell.md)
- [Shell 脚本传参方法总结](https://www.jianshu.com/p/d3cd36c97abc)
  ```shell
  echo $0    # 当前脚本的文件名（间接运行时还包括绝对路径）。
  echo $n    # 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1 。
  echo $#    # 传递给脚本或函数的参数个数。
  echo $*    # 传递给脚本或函数的所有参数。
  echo $@    # 传递给脚本或函数的所有参数。被双引号 (" ") 包含时，与 $* 不同，下面将会讲到。
  echo $?    # 上个命令的退出状态，或函数的返回值。
  echo $$    # 当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。
  echo $_    # 上一个命令的最后一个参数
  echo $!    # 后台运行的最后一个进程的 ID 号
  ```
- [useful scripts](https://github.com/oldratlee/useful-scripts) for making developer's everyday life easier and happier, involved java, shell etc. 
- [Minimal safe Bash script template](https://betterdev.blog/minimal-safe-bash-script-template/)
- [Advanced Shell Scripting Techniques: Automating Complex Tasks with Bash](https://omid.dev/2024/06/19/advanced-shell-scripting-techniques-automating-complex-tasks-with-bash/)


## [Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell) (sh)
The Bourne shell was the default shell for [Version 7 Unix](https://en.wikipedia.org/wiki/Version_7_Unix). [Unix-like](https://en.wikipedia.org/wiki/Unix-like) systems continue to have /bin/sh—which will be the Bourne shell, or a [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link) or [hard link](https://en.wikipedia.org/wiki/Hard_link) to a compatible shell—even when other shells are used by most users.
- [pure sh bible](https://github.com/dylanaraps/pure-sh-bible): A collection of pure POSIX sh alternatives to external processes.

### [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) (the Bourne-Again shell)
Bash is a Unix [[shell]] and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell. First released in 1989, it has been used as the default login shell for most Linux distributions and all releases of Apple's macOS prior to macOS Catalina. A version is also available for Windows 10 via the Windows Subsystem for Linux. It is also the default user shell in Solaris 11.
- [pure bash bible](https://github.com/dylanaraps/pure-bash-bible): A collection of pure bash alternatives to external processes.
- [bash-tutorial](https://github.com/wangdoc/bash-tutorial) 本教程介绍 Linux 命令行 Bash 的基本用法和脚本编程。 https://wangdoc.com/bash/
  - [ruanyf/simple-bash-scripts](https://github.com/ruanyf/simple-bash-scripts) A collection of simple Bash scripts
- [bash cheatsheet](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/bash.sh), [中文速查表](https://github.com/skywind3000/awesome-cheatsheets/blob/master/languages/bash.sh)
- [Bash-Oneliner](https://github.com/onceupon/Bash-Oneliner): A collection of handy Bash One-Liners and terminal tricks for data processing and Linux system maintenance.
- :star:[[linux]] default `sh` is `dash` 
  - `ls -al /bin/sh`
    - `lrwxrwxrwx 1 root root 4 Feb 20 14:30 /bin/sh -> dash`
  - let `sh` to be `bash`: `ln -sf /bin/bash /bin/sh`
- [Bash Shortcuts](https://gist.github.com/tuxfight3r/60051ac67c5f0445efee)

### [Zsh](https://www.zsh.org/)
The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.
- [Moving to zsh](https://scriptingosx.com/2019/06/moving-to-zsh/)
- [你不需要花哨的命令提示符](https://zhuanlan.zhihu.com/p/51008087)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) is an open source, community-driven framework for managing your zsh configuration.
- [Antigen](https://github.com/zsh-users/antigen) is a small set of functions that help you easily manage your shell (zsh) plugins, called bundles. The concept is pretty much the same as bundles in a typical vim+pathogen setup. Antigen is to zsh, what [Vundle](https://github.com/gmarik/vundle) is to vim.
- [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins): A collection of ZSH frameworks, plugins, tutorials & themes inspired by the various awesome list collections out there.


## [Terminal multiplexer](https://en.wikipedia.org/wiki/Terminal_multiplexer)
- [Zellij](https://github.com/zellij-org/zellij) is a workspace aimed at developers, ops-oriented people and anyone who loves the terminal. Similar programs are sometimes called "Terminal Multiplexers".

### [screen](https://www.gnu.org/software/screen/)
Screen is a full-screen window manager that multiplexes a physical terminal between several processes, typically interactive shells.
- [How To Use Screen](https://linuxize.com/post/how-to-use-linux-screen/)
- [linux screen 命令详解](http://www.cnblogs.com/mchina/archive/2013/01/30/2880680.html)  
- Frequently Command:
  ```
  screen -ls             列出当前所有的session
         -r <作业名称>    恢复离线的screen作业。
  ```
- In Session Command:
  ```
  C-a n -> Next，切换到下一个 window 
  C-a p -> Previous，切换到前一个 window 
  C-a d -> detach，暂时离开当前session，
          将目前的 screen session (可能含有多个 windows) 丢到后台执行，
          并会回到还没进 screen 时的状态，此时在 screen session 里，
          每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
  ```
- [man screen](https://www.gnu.org/software/screen/manual/screen.html)

### [tmux](https://github.com/tmux/tmux) 
[tmux](https://en.wikipedia.org/wiki/Tmux) is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.
- [Getting Started](https://github.com/tmux/tmux/wiki/Getting-Started)
- [Gentle Guide to Get Started With tmux](https://pragmaticpineapple.com/gentle-guide-to-get-started-with-tmux/)
- [Getting started with Tmux](https://linuxize.com/post/getting-started-with-tmux/)
- [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)
- frequently used commands
  ```bash
  tmux ls                         # or `tmux list-session`
  tmux new -s <session-name>
  tmux at -t <session-name>       # or `tmux attach -t <session-name>`
  tmux rename-session -t <session-name> <new-name>
  tmux switch -t <session-name>
  tmux detach                         # or `C-b d`
  tmux kill-session -t <session-name>
  # inside a tmux session
  tmux new-window -n <window-name>    # or `C-b c`
  tmux rename-window <new-name>
  tmux select-window -t <window-name>
  ```
- frequently used shortcuts (prefix key `C-b`):
  - `C-b c` Create a new window
  - `C-b s` List all sessions
  - `C-b w` List all sessions' windows
  - `C-b n` Next window in current session
  - `C-b p` Previous window in current session
  - `C-b <0~9>` Select window 0~9 in current session
  - `C-b $` Rename current session
  - `C-b t` Show a clock
- [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058) - [zh-CN](https://gist.github.com/ryerh/14b7c24dfd623ef8edc7)


<details> <summary> tmux help `C-b ?` </summary>

```
C-b Space   Select next layout
C-b !       Break pane to a new window
C-b "       Split window vertically
C-b #       List all paste buffers
C-b $       Rename current session
C-b %       Split window horizontally
C-b &       Kill current window
C-b '       Prompt for window index to select
C-b (       Switch to previous client
C-b )       Switch to next client
C-b ,       Rename current window
C-b -       Delete the most recent paste buffer
C-b .       Move the current window
C-b /       Describe key binding
C-b <0~9>   Select window 0~9
C-b :       Prompt for a command
C-b ;       Move to the previously active pane
C-b =       Choose a paste buffer from a list
C-b ?       List key bindings
C-b C       Customize options
C-b D       Choose and detach a client from a list
C-b E       Spread panes out evenly
C-b L       Switch to the last client
C-b M       Clear the marked pane
C-b [       Enter copy mode
C-b ]       Paste the most recent paste buffer
C-b c       Create a new window
C-b d       Detach the current client
C-b f       Search for a pane
C-b i       Display window information
C-b l       Select the previously current window
C-b m       Toggle the marked pane
C-b n       Select the next window
C-b o       Select the next pane
C-b p       Select the previous window
C-b q       Display pane numbers
C-b r       Redraw the current client
C-b s       Choose a session from a list
C-b t       Show a clock
C-b w       Choose a window from a list
C-b x       Kill the active pane
C-b z       Zoom the active pane
C-b {       Swap the active pane with the pane above
C-b }       Swap the active pane with the pane below
C-b ~       Show messages
C-b DC      Reset so the visible part of the window follows the cursor
C-b PPage   Enter copy mode and scroll up
C-b Up      Select the pane above the active pane
C-b Down    Select the pane below the active pane
C-b Left    Select the pane to the left of the active pane
C-b Right   Select the pane to the right of the active pane
C-b M-1     Set the even-horizontal layout
C-b M-2     Set the even-vertical layout
C-b M-3     Set the main-horizontal layout
C-b M-4     Set the main-vertical layout
C-b M-5     Select the tiled layout
C-b M-6     Set the main-horizontal-mirrored layout
C-b M-7     Set the main-vertical-mirrored layout
C-b M-n     Select the next window with an alert
C-b M-o     Rotate through the panes in reverse
C-b M-p     Select the previous window with an alert
C-b M-Up    Resize the pane up by 5
C-b M-Down  Resize the pane down by 5
C-b M-Left  Resize the pane left by 5
C-b M-Right Resize the pane right by 5
C-b C-b     Send the prefix key
C-b C-o     Rotate through the panes
C-b C-z     Suspend the current client
C-b C-Up    Resize the pane up
C-b C-Down  Resize the pane down
C-b C-Left  Resize the pane left
C-b C-Right Resize the pane right
C-b S-Up    Move the visible part of the window up
C-b S-Down  Move the visible part of the window down
C-b S-Left  Move the visible part of the window left
C-b S-Right Move the visible part of the window right
```
</details>

<details> <summary> ~/.tmux.conf — 精简实用配置（适配 Ghostty 终端） </summary>

```bash
# =============================================================================
# ~/.tmux.conf — 精简实用配置（适配 Ghostty 终端）
# 放到 ~/.tmux.conf
# - 无 server 运行时，tmux new 会自动加载
# - server 已运行时，需手动加载：tmux source-file ~/.tmux.conf
#   或在 tmux 内按 Ctrl-b r 热重载
# - history-limit 只对之后新建的 pane 生效
# - terminal-overrides 等终端能力相关的修改，source-file 不够，
#   需要重启 tmux server 才能生效：
#     tmux kill-server
#     tmux new -s main
# =============================================================================

# ── 终端与显示 ──────────────────────────────────────────────

# 告诉 tmux 内部程序"你运行在什么终端里"
# screen-256color 兼容性最好，几乎所有服务器都有这个 terminfo
set -g default-terminal "screen-256color"

# 告诉 tmux："如果外层终端是 ghostty 或 xterm-256color，就启用真彩色和 OSC 52 剪贴板"
# Tc = True Color，RGB 颜色不会被降级成 256 色
# Ms = 声明终端支持 OSC 52 剪贴板（远程 SSH 场景必须，否则 tmux 不会发送 OSC 52）
set -ga terminal-overrides ",xterm-ghostty:Tc:Ms=\\E]52;c;%p2%s\\7,xterm-256color:Tc:Ms=\\E]52;c;%p2%s\\7"

# 减少按 ESC 后的等待时间（毫秒）
# 默认 500ms，在 vim/neovim 里按 ESC 会明显卡顿，设成 10 基本无感
set -g escape-time 10

# ── 滚动与历史 ──────────────────────────────────────────────

# 每个 pane 保留多少行历史（默认只有 2000 行，太少了）
# 注意：只对设置后新创建的 pane 生效
set -g history-limit 50000

# ── 鼠标 ──────────────────────────────────────────────────────

# 开启鼠标支持后：
#   - 滚轮 → 自动进入 copy mode 并滚动（不用记 Ctrl-b [）
#   - 点击 pane → 切换焦点
#   - 拖拽 pane 边框 → 调整大小
#   - 点击状态栏窗口名 → 切换窗口
set -g mouse on

# ── 编号 ──────────────────────────────────────────────────────

# 窗口和面板编号从 1 开始（键盘上 1 比 0 好按）
set -g base-index 1
setw -g pane-base-index 1

# 关闭某个窗口后，后面的窗口编号自动补位（不会出现 1,3,4 的空洞）
set -g renumber-windows on

# ── Copy Mode（复制模式）─────────────────────────────────────

# 在 copy mode 中使用 vi 风格的按键
# 进入: Ctrl-b [    退出: q
# 移动: h/j/k/l 或方向键    搜索: / 或 ?
# 选择: v（开始） → y（复制并退出）
setw -g mode-keys vi
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-pipe-and-cancel

# ── 剪贴板（OSC 52）─────────────────────────────────────────

# 允许 tmux 通过 OSC 52 转义序列将复制内容写入系统剪贴板
# 配合上面的 copy-pipe-and-cancel，按 y 复制后可直接 Cmd+V 粘贴
# 适用于 SSH 远程场景：远程 tmux → SSH → 本地终端 → 系统剪贴板
# 需要本地终端支持 OSC 52（Ghostty/kitty/iTerm2 等均支持）
set -g set-clipboard on

# ── 快捷键 ────────────────────────────────────────────────────

# 前缀键保持默认 Ctrl-b（不改，避免和其他工具冲突）

# 竖直分屏（左|右），保留当前目录
#   默认是 Ctrl-b %，不直观
bind | split-window -h -c "#{pane_current_path}"

# 水平分屏（上—下），保留当前目录
#   默认是 Ctrl-b "，不直观
bind - split-window -v -c "#{pane_current_path}"

# 新建窗口时保留当前目录（默认会跳回 home）
bind c new-window -c "#{pane_current_path}"

# 快速重载本配置文件（修改 .tmux.conf 后不用退出 tmux）
bind r source-file ~/.tmux.conf \; display "配置已重载!"

# ── 状态栏 ────────────────────────────────────────────────────

# 简洁的深色状态栏
set -g status-style "bg=#282c34,fg=#abb2bf"
set -g status-left "#[fg=#61afef,bold] #S "      # 左侧显示 session 名
set -g status-right "#[fg=#98c379] %m-%d %H:%M "  # 右侧显示日期时间
set -g status-left-length 20
setw -g window-status-current-style "fg=#61afef,bold,underscore"  # 当前窗口高亮

# =============================================================================
# 常用操作速查（不是配置，纯注释备忘）
#
# Ctrl-b d        脱离 session（回到普通 shell，session 后台继续运行）
# Ctrl-b |        竖直分屏（上面自定义的）
# Ctrl-b -        水平分屏（上面自定义的）
# Ctrl-b 方向键   切换到相邻面板
# Ctrl-b c        新建窗口
# Ctrl-b 1/2/3    切换到第 1/2/3 号窗口
# Ctrl-b ,        重命名当前窗口
# Ctrl-b x        关闭当前面板（会确认）
# Ctrl-b z        当前面板全屏/恢复（zoom toggle）
# Ctrl-b [        进入 copy mode（然后用滚轮或 j/k 翻页）
# Ctrl-b r        重载配置（上面自定义的）
# tmux ls         列出所有 session
# tmux attach     重新连回 session
# =============================================================================
```
</details>

<details> <summary> tmux 剪贴板与 OSC 52 </summary>

#### 什么是 OSC 52
[OSC 52](https://invisible-island.net/xterm/ctlseqs/ctlseqs.html) 是 xterm 控制序列标准中的一个转义序列（Operating System Command #52），允许终端内运行的程序通过发送特殊转义字符**直接操作宿主终端的系统剪贴板**：
```
ESC ] 52 ; c ; <base64编码的文本> ST
```
关键价值：**穿透 SSH 和 tmux 等中间层**。即使 SSH 到远程服务器、在 tmux 里运行程序，只要本地终端（Ghostty、kitty、iTerm2 等）支持 OSC 52，转义码会一路传递到本地终端并写入系统剪贴板，不需要在远程安装 `pbcopy`、`xclip` 等工具。

#### tmux 复制相关配置说明
- `copy-selection-and-cancel`：只复制到 **tmux 内部 paste buffer**，`Ctrl-b ]` 可粘贴，但 `Cmd+V` 无法粘贴
- `copy-pipe-and-cancel`（推荐）：复制到 tmux buffer 的同时，通过 OSC 52 发送到终端写入系统剪贴板
- `set -g set-clipboard on`：启用 OSC 52 支持（比默认值 `external` 更宽松，允许 copy mode 和内部应用都使用）
- `terminal-overrides` 中的 `Ms=\E]52;c;%p2%s\7`：**关键！** 告诉 tmux 该终端支持 OSC 52。没有这个声明，即使 `set-clipboard on`，tmux 也不会发送 OSC 52 序列

#### 排查 OSC 52 不生效
1. 先在 tmux **外面**（裸 SSH shell）测试终端是否支持 OSC 52：
   ```bash
   printf '\033]52;c;%s\a' "$(echo -n 'hello clipboard' | base64)"
   # 然后 Cmd+V，能粘贴出 "hello clipboard" 说明终端链路正常
   ```
2. 确认 `terminal-overrides` 包含 `Ms=...` 声明
3. 修改 `terminal-overrides` 后必须 **重启 tmux server**（`tmux kill-server && tmux new`），`source-file` 不够

#### macOS 本地 tmux 与远程 tmux 的区别
| 场景 | 鼠标拖选 | `v` → `y` 复制 | `Cmd+V` 粘贴 |
|------|---------|----------------|---------------|
| macOS 本地 tmux | Ghostty 可能直接处理（按住 Option 拖选绕过 tmux） | 需要 `set-clipboard on` + `copy-pipe-and-cancel` | 依赖 OSC 52 |
| SSH 远程 Ubuntu tmux | 同上 | 同上，远程 `~/.tmux.conf` 也需要配置 | OSC 52 穿透 SSH 到本地终端 |

> **注意**：远程服务器的 tmux 版本需 ≥ 3.3 才能可靠支持 OSC 52。可用 `tmux -V` 检查版本。

</details>

### [Zellij](https://github.com/zellij-org/zellij)
[Zellij](https://en.wikipedia.org/wiki/Zellij) is a workspace aimed at developers, ops-oriented people and anyone who loves the terminal. At its core, it is a terminal multiplexer (similar to tmux and screen), but this is merely its infrastructure layer.


## Tools
- :star:[shellcheck](https://github.com/koalaman/shellcheck), a static analysis tool for shell scripts https://www.shellcheck.net
- [explainshell](https://github.com/idank/explainshell/) is a tool (with a web interface) capable of parsing man pages, extracting options and explain a given command-line by matching each argument to the relevant help text in the man page. http://www.explainshell.com/
- [cheat](https://github.com/cheat/cheat) allows you to create and view interactive cheatsheets on the command-line. It was designed to help remind *nix system administrators of options for commands that they use frequently, but not frequently enough to remember.
- [cli](https://github.com/urfave/cli) is a simple, fast, and fun package for building command line apps in Go. The goal is to enable developers to write fast and distributable command line applications in an expressive way.
- [Generic Colouriser](https://github.com/garabik/grc) is yet another colouriser (written in python) for beautifying your logfiles or output of commands.

### alternative
- [CLI: improved](https://remysharp.com/2018/08/23/cli-improved) - [zh-CN](https://docs.xindong.com/utilities/cli-improved.html)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix): A collection of modern/faster/saner alternatives to common unix commands.
- [fzf](https://github.com/junegunn/fzf) is a general-purpose command-line fuzzy finder.

### [[python]]
- [When You Should Use Bash Over Python](https://dnastacio.medium.com/bash-over-python-39e0eba502f9/)
- [sh](https://github.com/amoffat/sh) Python process launching http://amoffat.github.com/sh
- [xonsh](https://github.com/xonsh/xonsh) is a Python-powered, cross-platform, Unix-gazing shell language and command prompt. The language is a superset of Python 3.5+ with additional shell primitives. xonsh (pronounced conch) is meant for the daily use of experts and novices alike.
- [sarge](https://bitbucket.org/vinay.sajip/sarge/src/master/), a wrapper for subprocess which aims to make life easier for anyone who needs to interact with external applications from their Python code.
- (:warning:May be outdated)[Plumbum](https://github.com/tomerfiliba/plumbum): Shell Combinators http://plumbum.readthedocs.org

### [[ruby]]
- [Ruby: a great language for shell scripts!](https://lucasoshiro.github.io/posts-en/2024-06-17-ruby-shellscript/)

### terminal emulators
- [流行终端模拟器 汇总](https://www.v2ex.com/t/900640)
- [kitty](https://github.com/kovidgoyal/kitty) - the fast, feature-rich, cross-platform, GPU based terminal
  - [Search current terminal contents](https://github.com/kovidgoyal/kitty/issues/718)
  - [Add Cursor Trail Feature to Enhance Cursor Visibility](https://github.com/kovidgoyal/kitty/pull/7970)
- 👻 [Ghostty](https://github.com/ghostty-org/ghostty) is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.
- [Tabby](https://github.com/eugeny/tabby) (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows 10, macOS and Linux
- [Alacritty](https://github.com/alacritty/alacritty) - A fast, cross-platform, OpenGL terminal emulator
- [wezterm](https://github.com/wezterm/wezterm) - A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust
- [hyper](https://github.com/vercel/hyper) - A terminal built on web technologies
- [sshx](https://github.com/ekzhang/sshx) - Fast, collaborative live terminal sharing over the web


## FAQs
- [Difference between .bashrc and .bash_profile](https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile)
- [Linux shell配置文件加载顺序](https://www.jianshu.com/p/0c7ea235b473)
- [ubuntu中sh执行shell脚本报错问题](https://blog.csdn.net/dylloveyou/article/details/53393906)
- [Read a JSON Value in Bash](http://dailyraisin.com/read-json-value-in-bash/)
  <details> <summary> view shell codes </summary> 

  ```bash
  function readJson {
    UNAMESTR=`uname`
    if [[ "$UNAMESTR" == 'Linux' ]]; then
      SED_EXTENDED='-r'
    elif [[ "$UNAMESTR" == 'Darwin' ]]; then
      SED_EXTENDED='-E'
    fi; 
    VALUE=`grep -m 1 "\"${2}\"" ${1} | sed ${SED_EXTENDED} 's/^ *//;s/.*: *"//;s/",?//'`
    if [ ! "$VALUE" ]; then
      echo "Error: Cannot find \"${2}\" in ${1}" >&2;
      exit 1;
    else
      echo $VALUE ;
    fi; 
  }
  ```
  </details>
- [如何在Python中实现常见的bash习惯用法？](https://www.codenong.com/209470/)


## Resources
- [Awesome Shell](https://github.com/alebcay/awesome-shell): A curated list of awesome command-line frameworks, toolkits, guides and gizmos. Inspired by awesome-php.
- [Awesome Bash](https://github.com/awesome-lists/awesome-bash): A curated list of delightful Bash scripts and resources.
- [awesome-cli-apps](https://github.com/agarrharr/awesome-cli-apps) A curated list of command line apps
