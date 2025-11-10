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
