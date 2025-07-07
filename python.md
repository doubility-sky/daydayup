[Python](https://www.python.org) is a programming language that lets you work quickly and integrate systems more effectively. >>>[Learn More](https://www.python.org/doc/)

- [python for shell](shell#python)
- [[django]]
- [[pygame]]



## Learn
- [The Python Wiki](https://wiki.python.org)
- [Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)

### tutorial
- [learn-python](https://github.com/trekhleb/learn-python) Playground and cheatsheet for learning Python. Collection of Python scripts that are split by topics and contain code examples with explanations.
- [OnlinePythonTutor](https://github.com/pgbovine/OnlinePythonTutor), Visualize Python, Java, JavaScript, TypeScript, Ruby, C, and C++ code execution in your Web browser http://pythontutor.com/
- [What the f*ck Python! 😱](https://github.com/satwikkansal/wtfpython) Exploring and understanding Python through surprising snippets.

### books
- [A Byte of Python](https://python.swaroopch.com/)
- [Introduction to Programming in Python](https://introcs.cs.princeton.edu/python/home/): a textbook for a first course in computer science for the next generation of scientists and engineers
- :star:[Full Stack Python](https://www.fullstackpython.com/) is an [open source book](https://github.com/mattmakai/fullstackpython.com) that explains technical concepts in plain language. 
- [Hitchhiker's Guide to Python](https://github.com/realpython/python-guide): Python best practices guidebook, written for humans.
- [《Python Cookbook》 3rd Edition Translation](https://github.com/yidao620c/python3-cookbook)
- [《Python 3 源码剖析》](https://github.com/flaggo/python3-source-code-analysis)



## Implementation
- [Numba](https://github.com/numba/numba) is an open source JIT compiler that translates a subset of Python and NumPy code into fast machine code.
- [Cython](https://github.com/cython/cython) is an optimising static compiler for both the Python programming language and the extended Cython programming language (based on [Pyrex](https://www.csse.canterbury.ac.nz/greg.ewing/python/Pyrex/)). It makes writing C extensions for Python as easy as Python itself.
- [PyPy](https://github.com/pypy/pypy) is a replacement for CPython. It is built using the RPython language that was co-developed with it. The main reason to use it instead of CPython is speed: it runs generally faster (see next section).
- [Pythran](https://github.com/serge-sans-paille/pythran) is an ahead of time compiler for a subset of the Python language, with a focus on scientific computing.
- [Codon](https://github.com/exaloop/codon) is a high-performance Python implementation that compiles to native machine code without any runtime overhead. 
- [Nuitka](https://github.com/Nuitka/Nuitka) is a Python compiler written in Python. It's fully compatible with Python 2.6, 2.7, 3.4-3.13. You feed it your Python app, it does a lot of clever things, and spits out an executable or extension module.



## Practice
- [Python 练习册](https://github.com/Yixiaohan/show-me-the-code)
- [101 NumPy Exercises for Data Analysis (Python)](https://www.machinelearningplus.com/python/101-numpy-exercises-python/)
- [jackfrued/Python-100-Days](https://github.com/jackfrued/Python-100-Days) Python - 100天从新手到大师
  - Make English as your working language. Practice makes perfect. All experience comes from mistakes. Don't be one of the leeches. Either stand out or kicked out.



## Libraries
- [Requests](https://github.com/psf/requests) is an elegant and simple HTTP library for Python, built for human beings.
- [Pillow](https://github.com/python-pillow/Pillow), The friendly PIL fork (Python Imaging Library) https://python-pillow.org
- [openpyxl](https://openpyxl.readthedocs.io/en/stable/) is a Python library to read/write Excel 2010 xlsx/xlsm/xltx/xltm files.
- [pywebview](https://github.com/r0x0r/pywebview) is a lightweight cross-platform wrapper around a webview component that allows to display HTML content in its own native GUI window.



## Frameworks
- [Twisted](https://github.com/twisted/twisted) is an event-based framework for internet applications, supporting Python 2.7 and Python 3.5+.

### [Web Frameworks for Python](https://wiki.python.org/moin/WebFrameworks)
- [Django](https://github.com/django/django) is a high-level Python Web framework that encourages rapid development and clean, pragmatic design.
- [Tornado](https://github.com/tornadoweb/tornado) is a Python web framework and asynchronous networking library, originally developed at FriendFeed. By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long polling, WebSockets, and other applications that require a long-lived connection to each user. 
  - [Introduction to Tornado](https://docs.hacknode.org/itt2zh/)
- [Flask](https://github.com/pallets/flask) is a lightweight [WSGI](https://wsgi.readthedocs.io/) web application framework. It is designed to make getting started quick and easy, with the ability to scale up to complex applications. It began as a simple wrapper around [Werkzeug](https://www.palletsprojects.com/p/werkzeug/) and [Jinja](https://www.palletsprojects.com/p/jinja/) and has become one of the most popular Python web application frameworks.
- [FastAPI](https://github.com/tiangolo/fastapi) framework, high performance, easy to learn, fast to code, ready for production

### GUI
- [BeeWare](https://github.com/beeware) allows you to write your app in Python and release it on multiple platforms. No need to rewrite the app in multiple programming languages. It means no issues with build tools, environments, compatibility, etc.
- [Kivy](https://github.com/kivy/kivy): Open source UI framework written in Python, running on Windows, Linux, macOS, Android and iOS
  - [python-for-android](https://github.com/kivy/python-for-android) is a packaging tool for Python apps on Android. You can create your own Python distribution including the modules and dependencies you want, and bundle it in an APK along with your own code.
  - [Kivy for iOS](https://github.com/kivy/kivy-ios): Toolchain for compiling Python / Kivy / other libraries for iOS
- [wxPython's Project Phoenix](https://github.com/wxWidgets/Phoenix/). A new implementation of wxPython, better, stronger, faster than he was before. Just like ["Classic" wxPython](https://github.com/wxWidgets/wxPython-Classic), Phoenix wraps the wxWidgets C++ toolkit and provides access to the user interface portions of the wxWidgets API, enabling Python applications to have a native GUI on Windows, Macs or Unix systems, with a native look and feel and requiring very little (if any) platform specific code.
- [DearPyGui](https://github.com/hoffstadt/DearPyGui): A GPU Accelerated Python GUI Framework
- [fbs](https://github.com/mherrmann/fbs) is the fastest way to create a Python GUI. It solves common pain points such as packaging and deployment. Based on Python and Qt, fbs is a lightweight alternative to Electron.
  - [tutorial](https://github.com/mherrmann/fbs-tutorial) for creating Python/Qt GUIs with fbs



## Crawlers
- [scrapy](https://scrapy.org/), An open source and collaborative framework for extracting the data you need from websites. In a fast, simple, yet extensible way.
- [pyspider](https://github.com/binux/pyspider), A Powerful Spider(Web Crawler) System in Python. http://docs.pyspider.org/
- [Portia](https://github.com/scrapinghub/portia) is a tool that allows you to visually scrape websites without any programming knowledge required. With Portia you can annotate a web page to identify the data you wish to extract, and Portia will understand based on these annotations how to scrape data from similar pages.
- [Newspaper3k: Article scraping & curation](https://github.com/codelucas/newspaper), News, full-text, and article metadata extraction in Python 3. Advanced docs: https://goo.gl/VX41yK
- [Grab](https://github.com/lorien/grab) is a python web scraping framework. Grab provides a number of helpful methods to perform network requests, scrape web sites and process the scraped content ...



## Tools
- [pipx](https://github.com/pypa/pipx) — Install and Run Python Applications in Isolated Environments
- [pyenv](https://github.com/pyenv/pyenv) lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.
  - `pyenv install -l` List all available versions
  - `pyenv install 2.7.18`
  - `pyenv versions` Show the current Python version(s) and its origin
  - `pyenv global 2.7.18`
  - `python --version`
  - FAQ: after `pyenv global system` got: `pyenv: python: command not found ...` on macOS 12+
    - `ln -s /usr/local/bin/python3 /usr/local/bin/python`
- [SimpleHTTPServer](https://docs.python.org/2/library/simplehttpserver.html)  
  - `python -m SimpleHTTPServer 8000` OR `python3 -m http.server`
- [Python's many command-line utilities](https://www.pythonmorsels.com/cli-tools/)



## FAQs
- [Python 为什么？](https://github.com/chinesehuazhou/python-whydo)
- [Python 的练手项目有哪些值得推荐？](https://www.zhihu.com/question/29372574/answer/554481284)
- [What are the best game engines for Python?](https://www.slant.co/topics/10908/~game-engines-for-python)
- [pyinstaller打包的exe太大？](https://zhuanlan.zhihu.com/p/76974787)
- [How to correctly close files in Python](https://www.30secondsofcode.org/articles/s/python-file-close)
  - Use a `with` statement which will ensure the file is closed when the code that uses it finishes running. This holds true even if an exception is thrown.
    ```py
      with open('filename', 'w') as f:
        f.write('Hello world!')
    ```
- `list.sort()` 使用 ASCII 字符顺序，字典序排序: `list.sort(key=str.lower)`
- PyInstaller打包后某些文件未包含进去，需要用[--add-data](https://pyinstaller.org/en/stable/spec-files.html#adding-data-files)或[--add-binary](https://pyinstaller.org/en/stable/spec-files.html#adding-binary-files)。
  ```
  格式：pyinstaller --add-data="SRC;DST"
  例如将第三方库zhconv/zhcdict.json打包到zhconv目录下：
  # cmd:
    pyinstaller --add-data="%LocalAppData%\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\zhconv\zhcdict.json;zhconv" -F translate.py --distpath "."
  # powershell:
    pyinstaller --add-data="$env:LocalAppData\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\zhconv\zhcdict.json;zhconv" -F translate.py --distpath "."
  ```
- [On MacOS 14, pip install throws error: externally-managed-environment](https://discuss.python.org/t/on-macos-14-pip-install-throws-error-externally-managed-environment/50352/6)



## Resources
- [Awesome Python](https://github.com/vinta/awesome-python), A curated list of awesome Python frameworks, libraries, software and resources https://awesome-python.com/
- [awesome-python-cn](https://github.com/jobbole/awesome-python-cn) Python资源大全中文版，包括：Web框架、网络爬虫、模板引擎、数据库、数据可视化、图片处理等，由伯乐在线持续更新。http://jobbole.github.io/awesome-python-cn/
- [PythonShare](https://github.com/Yixiaohan/codeparkshare) Python初学者（零基础学习Python、Python入门）书籍、视频、资料、社区推荐
- [awesome-spider](https://github.com/facert/awesome-spider) - 爬虫集合
- [Free Python Courses List](https://www.pythonkitchen.com/free-python-courses-list/)
- [Legally Free Python Books List](https://www.pythonkitchen.com/legally-free-python-books-list/)
- [Free Python Books](https://github.com/pamoroso/free-python-books)
