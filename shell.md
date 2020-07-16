- [Shell](https://en.wikipedia.org/wiki/Shell_(computing))
- https://github.com/alebcay/awesome-shell
- https://github.com/awesome-lists/awesome-bash



## Learn
- [bash-tutorial](https://github.com/wangdoc/bash-tutorial) 本教程介绍 Linux 命令行 Bash 的基本用法和脚本编程。 https://wangdoc.com/bash/
  - [ruanyf/simple-bash-scripts](https://github.com/ruanyf/simple-bash-scripts) A collection of simple Bash scripts
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line), Master the command line, in one page. 
  - [命令行的艺术](https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md)
- :star:[The Linux Command Line](http://linuxcommand.org/)
  - [快乐的 Linux 命令行](https://github.com/billie66/TLCL)
- [Linux工具快速教程](https://github.com/me115/linuxtools_rst)
- [Linux命令大全](https://man.linuxde.net/)
- [改进你的命令行工具](https://docs.xindong.com/utilities/cli-improved.html)
- [An Introduction To Data Science On The Linux Command Line](https://blog.robertelder.org/data-science-linux-command-line/)



## sh/bash
- linux default `sh` is `dash` 
  - `ls -al /bin/sh`
    - `lrwxrwxrwx 1 root root 4 Feb 20 14:30 /bin/sh -> dash`
  - let `sh` to be `bash`: `ln -sf /bin/bash /bin/sh`



## Scripting
- [bash cheatsheet](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/bash.sh), [中文速查表](https://github.com/skywind3000/awesome-cheatsheets/blob/master/languages/bash.sh)
- [Shell脚本编程30分钟入门](https://github.com/qinjx/30min_guides/blob/master/shell.md)
- [pure sh bible](https://github.com/dylanaraps/pure-sh-bible): A collection of pure POSIX sh alternatives to external processes.
- [pure bash bible](https://github.com/dylanaraps/pure-bash-bible): A collection of pure bash alternatives to external processes.
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



## Tools
- [explainshell](https://github.com/idank/explainshell/) is a tool (with a web interface) capable of parsing man pages, extracting options and explain a given command-line by matching each argument to the relevant help text in the man page. http://www.explainshell.com/
- [cheat](https://github.com/cheat/cheat) allows you to create and view interactive cheatsheets on the command-line. It was designed to help remind *nix system administrators of options for commands that they use frequently, but not frequently enough to remember.
- [shellcheck](https://github.com/koalaman/shellcheck), a static analysis tool for shell scripts https://www.shellcheck.net
- [awesome-cli-apps](https://github.com/agarrharr/awesome-cli-apps) A curated list of command line apps



## [[Python]]
- [我可以使用Python作为Bash替换吗？](http://www.tracholar.top/2018/06/08/can-i-use-python-as-a-bash-replacement/)
- [sh](https://github.com/amoffat/sh) Python process launching http://amoffat.github.com/sh
- [xonsh](https://github.com/xonsh/xonsh) is a Python-powered, cross-platform, Unix-gazing shell language and command prompt. The language is a superset of Python 3.5+ with additional shell primitives. xonsh (pronounced conch) is meant for the daily use of experts and novices alike.
- [sarge](https://bitbucket.org/vinay.sajip/sarge/src/master/), a wrapper for subprocess which aims to make life easier for anyone who needs to interact with external applications from their Python code.
- (:warning:May be outdated)[Plumbum](https://github.com/tomerfiliba/plumbum): Shell Combinators http://plumbum.readthedocs.org



## FAQ
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
