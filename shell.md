In [computing](https://en.wikipedia.org/wiki/Computing), a [shell](https://en.wikipedia.org/wiki/Shell_(computing)) is a command-line interpreter which exposes access to an operating system's services. In general, operating system shells use either a [command-line interface](https://en.wikipedia.org/wiki/Command-line_interface) (CLI) or [graphical user interface](https://en.wikipedia.org/wiki/Graphical_user_interface) (GUI), depending on a computer's role and particular operation. It is named a shell because it is the outermost layer around the operating system.

Command-line shells require the user to be familiar with commands and their calling [syntax](https://en.wikipedia.org/wiki/Syntax), and to understand concepts about the shell-specific scripting language (for example, [bash](https://en.wikipedia.org/wiki/Bash_shell)).


- [[linux]]
- [[macos]]
- [[operating-system]]



## Learn
- [You Don't Need GUI](https://github.com/you-dont-need/You-Dont-Need-GUI): Stop relying on GUI; CLI **ROCKS**
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line), Master the command line, in one page. - [zh-CN](https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md)

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



## [Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell) (sh)
The Bourne shell was the default shell for [Version 7 Unix](https://en.wikipedia.org/wiki/Version_7_Unix). [Unix-like](https://en.wikipedia.org/wiki/Unix-like) systems continue to have /bin/sh—which will be the Bourne shell, or a [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link) or [hard link](https://en.wikipedia.org/wiki/Hard_link) to a compatible shell—even when other shells are used by most users.
- [pure sh bible](https://github.com/dylanaraps/pure-sh-bible): A collection of pure POSIX sh alternatives to external processes.

### [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) (the Bourne-Again shell)
Bash is a Unix [[shell]] and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell. First released in 1989, it has been used as the default login shell for most Linux distributions and all releases of Apple's macOS prior to macOS Catalina. A version is also available for Windows 10 via the Windows Subsystem for Linux. It is also the default user shell in Solaris 11.
- [pure bash bible](https://github.com/dylanaraps/pure-bash-bible): A collection of pure bash alternatives to external processes.
- [bash-tutorial](https://github.com/wangdoc/bash-tutorial) 本教程介绍 Linux 命令行 Bash 的基本用法和脚本编程。 https://wangdoc.com/bash/
  - [ruanyf/simple-bash-scripts](https://github.com/ruanyf/simple-bash-scripts) A collection of simple Bash scripts
- [bash cheatsheet](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/bash.sh), [中文速查表](https://github.com/skywind3000/awesome-cheatsheets/blob/master/languages/bash.sh)
- :star:[[linux]] default `sh` is `dash` 
  - `ls -al /bin/sh`
    - `lrwxrwxrwx 1 root root 4 Feb 20 14:30 /bin/sh -> dash`
  - let `sh` to be `bash`: `ln -sf /bin/bash /bin/sh`

### [Zsh](https://www.zsh.org/)
The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.
- [Moving to zsh](https://scriptingosx.com/2019/06/moving-to-zsh/)
- [你不需要花哨的命令提示符](https://zhuanlan.zhihu.com/p/51008087)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) is an open source, community-driven framework for managing your zsh configuration.
- [Antigen](https://github.com/zsh-users/antigen) is a small set of functions that help you easily manage your shell (zsh) plugins, called bundles. The concept is pretty much the same as bundles in a typical vim+pathogen setup. Antigen is to zsh, what [Vundle](https://github.com/gmarik/vundle) is to vim.
- [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins): A collection of ZSH frameworks, plugins, tutorials & themes inspired by the various awesome list collections out there.



## Tools
- [explainshell](https://github.com/idank/explainshell/) is a tool (with a web interface) capable of parsing man pages, extracting options and explain a given command-line by matching each argument to the relevant help text in the man page. http://www.explainshell.com/
- [cheat](https://github.com/cheat/cheat) allows you to create and view interactive cheatsheets on the command-line. It was designed to help remind *nix system administrators of options for commands that they use frequently, but not frequently enough to remember.
- [shellcheck](https://github.com/koalaman/shellcheck), a static analysis tool for shell scripts https://www.shellcheck.net
- [cli](https://github.com/urfave/cli) is a simple, fast, and fun package for building command line apps in Go. The goal is to enable developers to write fast and distributable command line applications in an expressive way.
- [Generic Colouriser](https://github.com/garabik/grc) is yet another colouriser (written in python) for beautifying your logfiles or output of commands.
- [CLI: improved](https://remysharp.com/2018/08/23/cli-improved) - [zh-CN](https://docs.xindong.com/utilities/cli-improved.html)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix): A collection of modern/faster/saner alternatives to common unix commands.

### [[Python]]
- [我可以使用Python作为Bash替换吗？](http://www.tracholar.top/2018/06/08/can-i-use-python-as-a-bash-replacement/)
- [sh](https://github.com/amoffat/sh) Python process launching http://amoffat.github.com/sh
- [xonsh](https://github.com/xonsh/xonsh) is a Python-powered, cross-platform, Unix-gazing shell language and command prompt. The language is a superset of Python 3.5+ with additional shell primitives. xonsh (pronounced conch) is meant for the daily use of experts and novices alike.
- [sarge](https://bitbucket.org/vinay.sajip/sarge/src/master/), a wrapper for subprocess which aims to make life easier for anyone who needs to interact with external applications from their Python code.
- (:warning:May be outdated)[Plumbum](https://github.com/tomerfiliba/plumbum): Shell Combinators http://plumbum.readthedocs.org



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
