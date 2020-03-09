[JavaScript DOM 编程艺术 （第2版）](https://book.douban.com/subject/6038371/)
- 注意：本书[英文原版](https://book.douban.com/subject/5436113/)出版于 2010 年，有些地方已显得过时，但是仍不失为经典之作。
- 类似的经典书籍还有 [Eloquent Javascript](https://eloquentjavascript.net/)，[You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS) 等。 



## 序
- 整本书仍然一直在强调最佳实践（特别是渐进增强）
- 作者曾在 [Bulletproof Ajax](https://book.douban.com/subject/1936787/) 中提出观点：永远不要假设 Ajax（或 JavaScript 等）一定可用。



## 前言
- 这是一本讲述一种程序设计语言的书，但它不是专门写给程序员的，而主要是写给 Web 设计师的
- 本书真正目的是让大家理解DOM脚本编程技术背后的思路和原则，平稳退化、渐进增强、以用户为中心的设计对任何前端 Web 开发工作都非常重要



## 第1章 JavaScript 简史 
- JavaScript 1.0版本，出现在1995年推出的Netscape Navigator 2浏览器中
  - 面对微软公司的竞争，Netscape和Sun公司联合ECMA（欧洲计算机制造商协会）对 JavaScript 语言进行了标准化。于是出现了 ECMAScript 语言，这是同一种语言的另一个名字。
  - 虽说ECMAScript这个名字没有流行开来，但人们现在谈论的 JavaScript 实际上就是 ECMAScript
- JavaScript 是一种脚本语言，通常只能通过 Web 浏览器去完成一些操作而不能像普通意义上的程序那样独立运行
- JavaScript 还向程序员提供了一些操控 Web 浏览器的手段。
  - 例如，JavaScript 语言可以用来调整 Web 浏览器窗口的高度、宽度和位置等属性。
  - 这种设定浏览器属性的办法可以看做是 BOM（浏览器对象模型）。JavaScript 的早期版本还提供了一种初级的 DOM
- DOM 是一套对文档的内容进行抽象和概念化的方法
  - DOM 是一种 API（应用编程接口）
  - Netscape、微软和其他一些浏览器制造商们抛开彼此的敌意与W3C携手制定新的标准，并于1998年10月完成了“第1级DOM”（DOM Level 1）。
  - W3C 对 DOM 的定义是：“一个与系统平台和编程语言无关的接口，程序和脚本可以通过这个接口动态地访问和修改文档的内容、结构和样式。”
  - 异步数据传输技术（Ajax）引发了学习DOM脚本编程的热潮
- DHTML 是 “Dynamic HTML”（动态 HTML）的简称。
  - DHTML 并不是一项新技术，而是描述 HTML、CSS 和 JavaScript 技术组合的术语。
  - 本书后面的内容中将不再使用 “DHTML” 这个术语，因为这个术语与其说是一个技术性词语，不如说是一个市场营销噱头
  - DHTML 曾被认为是 HTML/XHTML、CSS 和 JavaScript 相结合的产物，就像今天的 HTML5 那样，但把这些东西真正凝聚在一起的是 DOM
- HTML5 极大地改进了标记的语义，让我们通过 `<audio>` 和 `<video>` 得以控制各种媒体，`<canvas>` 元素具备了完善的绘图能力，浏览器本地存储超越了 cookie 限制，更有内置的拖放支持，等等



## 第2章 JavaScript 语法 
- 用 JavaScript 编写的代码必须通过 HTML/XHTML 文档才能执行。有两种方式可以做到这点。
  - 第一种方式是将 JavaScript 代码放到文档`<head>`标签中的`<script>`标签之间
  - 更好的方式是把 JavaScript 代码存为一个扩展名为 `.js` 的独立文件
    - 典型的作法是在文档的 `<head>` 部分放一个 `<script>` 标签，并把它的 src 属性指向该文件
    - 但最好的做法是把 `<script>` 标签放到HTML文档的最后，`</body>` 标签之前，这样能使浏览器更快地加载页面
- 建议大家用 `//` 来注释单行，用 `/*` 注释多行
- JavaScript 允许程序员直接对变量赋值而无需事先声明
- 通常驼峰格式是函数名、方法名和对象属性名命名的首选格式
- 必须明确类型声明的语言称为强类型（strongly typed）语言。JavaScript 不需要进行类型声明，因此它是一种弱类型（weakly typed）语言。
- 字符串必须包在引号里，单引号或双引号都可以
- JavaScript 用反斜线对字符进行转义（escaping）
- 相等操作符`==`并不表示严格相等，这一点很容易让人犯糊涂
  - 因为相等操作符`==`认为空字符串与`false`的含义相同。
  - 要进行严格比较，就要使用另一种等号（`===`）。这个全等操作符会执行严格的比较，不仅比较值，而且会比较变量的类型
- 由浏览器提供的预定义对象被称为宿主对象（host object）
  - 宿主对象包括Form、Image和Element等。我们可以通过这些对象获得关于网页上表单、图像和各种表单元素等信息。
  - 另一种宿主对象也能用来获得网页上的任何一个元素的信息，它就是document对象



## 第3章 DOM 
- 5个常用DOM方法：
  - `getElementById`、`getElementsByTagName`、`getElementsByClassName`、`getAttribute` 和 `setAttribute`
- DOM 中的字母 “D” 代表 document（文档）
  - 当创建了一个网页并把它加载到Web浏览器中时，DOM 就在幕后悄然而生。它把你编写的网页文档转换为一个文档对象。
  - document 对象的主要功能就是处理网页内容
- DOM 中的字母 “O” 代表 object（对象）
  - JavaScript 语言里的对象可以分为三种类型。
    1. 用户定义对象（user-defined object）：由程序员自行创建的对象。本书不讨论这种对象。
    2. 内建对象（native object）：内建在JavaScript语言里的对象，如 Array、Math 和 Date 等。
    3. 宿主对象（host object）：由浏览器提供的对象。
  - `window` 对象对应着浏览器窗口本身，这个对象的属性和方法通常统称为 BOM（浏览器对象模型）
    - 称为 Window Object Model（窗口对象模型）或许更为贴切
    - 值得庆幸的是，我们不需要与 BOM 打太多的交道，而是把注意力集中在浏览器窗口内的网页内容上
- DOM 中的 “M” 代表着 “Model”（模型），但说它代表着 “Map”（地图）也未尝不可
  - 模型也好，地图也罢，它们的含义都是某种事物的表现形式
  - 就像一个模型火车代表着一列真正的火车、一张城市街道图代表着一个实际存在的城市那样，DOM 代表着加载到浏览器窗口的当前网页。
  - 浏览器提供了网页的地图（或者说模型），而我们可以通过 JavaScript 去读取这张地图
  - DOM 把一份文档表示为一棵树（这里所说的“树”是数学意义上的概念）
    - 更具体地说，DOM把文档表示为一棵家谱树。家谱树本身又是一种模型。
    - 家谱树的典型用法是表示一个人类家族的谱系，并使用parent（父）、child（子）、sibling（兄弟）等记号来表明家族成员之间的关系
    - 与使用“家谱树”这个术语相比，把文档称为“节点树”更准确，文档是由节点构成的集合。
- DOM 的原子是元素节点（element node）
  - 在 XHTML 文档里，文本节点总是被包含在元素节点的内部。但并非所有的元素节点都包含有文本节点
- DOM 并不是与网页结构打交道的唯一技术。我们还可以通过 CSS（层叠样式表）告诉浏览器应该如何显示一份文档的内容
  - 类似 JavaScript 脚本，对样式的声明既可以嵌在文档的`<head>`部分（`<style>`标签之间），也可以放在另外一个样式表文件里
- DOM 的 3 种获取元素节点方法
  1. getElementById 方法将返回一个与那个有着给定id属性值的元素节点对应的对象
  2. getElementsByTagName 方法返回一个对象数组，每个对象分别对应着文档里有着给定标签的一个元素
  3. getElementsByClassName 是 [HTML5 DOM](http://www.whatwg.org/specs/web-apps/current-work/) 新增的一个令人期待已久的方法。  
    使用这个方法还可以查找那些带有多个类名的元素。要指定多个类名，只要在字符串参数中用空格分隔类名即可。
  - 相应地，setAttribute 方法则可以更改属性节点的值。
    - 通过 setAttribute 对文档做出修改后，在通过浏览器的 viewsource（查看源代码）选项去查看文档的源代码时看到的仍将是改变前的属性值
    - 也就是说，setAttribute做出的修改不会反映在文档本身的源代码里
- DOM的工作模式：
  - 先加载文档的静态内容，再动态刷新，动态刷新不影响文档的静态内容。
  - 这正是DOM的真正威力：对页面内容进行刷新却不需要在浏览器里刷新页面。



## 第4章 案例研究：JavaScript图片库 
- “第1级DOM”（DOM Level 1）的另一个优势是可移植性更好
  - `setAttribute`方法是“第1级DOM”的组成部分，它可以设置任意元素节点的任意属性
  - 牢牢记住这一点：DOM 是一种适用于多种环境和多种程序设计语言的通用型 API
- 若一个站点用到多个 JavaScript 文件，为了减少对站点的请求次数（提高性能），应该把这些 .js 文件合并到一个文件中
- 事件处理函数的作用是，在特定事件发生时调用特定的 JavaScript 代码。工作机制如下：
  - 在给某个元素添加了事件处理函数后，一旦事件发生，相应的 JavaScript 代码就会得到执行。
  - 被调用的 JavaScript 代码可以返回一个值，这个值将被传递给那个事件处理函数。
  - 例如，我们可以给某个链接添加一个 onclick 事件处理函数，并让这个处理函数所触发的 JavaScript 代码返回布尔值 true 或 false。这样一来，当这个链接被点击时，如果那段 JavaScript 代码返回的值是 true, onclick 事件处理函数就认为“这个链接被点击了”；反之，如果返回的值是 false, onclick 事件处理函数就认为“这个链接没有被点击”。
  - 在 onclick 事件处理函数所触发的 JavaScript 代码里增加一条 `return false` 语句，就可以防止用户被带到目标链接窗口
- 在一棵节点树上，childNodes 属性可以用来获取任何一个元素的所有子元素
- 我们使用 getElementsBy-TagName 得到 body 元素。
  - 因为每份文档只有一个 body 元素，所以它将是 `getElementsByTagName("body")` 所返回的数组中的第一个（也是唯一一个）元素
  ```javascript
  var body_element = document.getElementsByTagName("body")[0];
  body_element.childNodes // 获取 body 元素的全体子元素
  body_element.length     // 所包含的元素的个数
  ```
- 数组元素 `childNodes[0]` 有个更直观易读的同义词。
  - 无论何时何地，只要需要访问 childNodes 数组的第一个元素，都可以把它写成 firstChild，DOM 还提供了一个与之对应的 lastChild 属性
  ```javascript
  node.firstChild === node.childNodes[0]
  node.lastChild === node.childNodes[node.childNodes.length-1]
  ```
- 想让函数在页面加载时执行，需要使用 onload 事件处理函数 
  ```javascript
  window.onload = funcX;
  ```
- 每一个节点都有 nodeType 属性，值是一个数字，总共有12种可取值，但其中仅有3种具有实用价值。
  1. 元素节点值是 1
  2. 属性节点值是 2
  3. 文本节点值是 3
- 每一个节点都有 nodeValue 属性，可用来检索节点的值，或者设置节点的值



## 第5章 最佳实践 
- 易学易用的技术就像一把双刃剑
  - 与HTML语言相比，JavaScript 语言的生存环境的要求要苛刻得多。
  - 如果 JavaScript 代码不符合语法规定，JavaScript解释器（对 Web 应用而言就是浏览器）将拒绝执行它们并报错；
  - 而浏览器在遇到不符合语法规定的HTML代码时，则会千方百计地将其呈现出来。
  - 尽管如此，在如今的Web上还是充斥着质量低劣的 JavaScript 代码
  - 如果人们在开始使用一种新技术时没有经过深思熟虑，而这种新技术又很快地成为了一种潮流，则纠正在早期阶段养成的坏习惯将会非常困难
  - 在所有的 JavaScript 特效当中，最臭名昭著的莫过于那些在人们打开网页时弹出的广告窗口。弹出的广告窗口和内容覆盖是一个典型的滥用 JavaScript 的例子
- 平稳退化（graceful degradation）：确保网页在没有 JavaScript 的情况下也能正常工作。就是说，虽然某些功能无法使用，但最基本的操作仍能顺利完成。
  - 网站的访问者完全有可能使用的是不支持 JavaScript 的浏览器
  - 只有极少数搜索机器人能够理解 JavaScript 代码，所以JavaScript 网页不能平稳退化，它们在搜索引擎上的排名就可能大受损害
  - 注意 应该只在绝对必要的情况下才使用弹出窗口
  - JavaScript 使用 window 对象的 open() 方法来创建新的浏览器窗口 
    ```javascript
    window.open(url, name, features) // 这三个参数都是可选的
    ```
    1. 第一个参数是想在新窗口里打开的网页的URL地址。如果省略这个参数，屏幕上将弹出一个空白的浏览器窗口。
    2. 第二个参数是新窗口的名字。可以在代码里通过这个名字与新窗口进行通信。
    3. 最后一个参数是一个以逗号分隔的字符串，其内容是新窗口的各种属性。这些属性包括新窗口的尺寸（宽度和高度）以及新窗口被启用或禁用的各种浏览功能（工具条、菜单条、初始显示位置，等等）。对于这个参数应该掌握以下原则：新窗口的浏览功能要少而精。
  - `open()` 方法是使用 `BOM` 的一个好案例，它的功能对文档的内容也无任何影响（那是 `DOM` 的地盘）。这个方法只与浏览环境（具体到这个例子，就是 `window` 对象）有关
  ```javascript
  function popUp(winURL) {
      // 打开一个320像素宽、480像素高的新窗口“popup”
      window.open(winURL, "popup", "width=320,height=480"); 
  }
  ```
  - `javascript:` 伪协议让我们通过一个链接来调用 JavaScript 函数。
    - “真”协议用来在因特网上的计算机之间传输数据包，如 HTTP 协议（http://）、FTP 协议（ftp://）等，伪协议则是一种非标准化的协议。
    - 在 HTML 文档里通过 “javascript:” 伪协议调用 JavaScript 代码的做法非常不好
  - `#` 符号是一个仅供文档内部使用的链接记号
    - 在某些浏览器里，“#”链接指向当前文档的开头。把href属性的值设置为“#”只是为了创建一个空链接。实际工作全部由 onclick 属性负责完成。
    - 这个技巧与用 “javascript:” 伪协议调用 JavaScript 代码的做法同样糟糕，因为它们都不能平稳退化
  - 所以，在把 `href` 属性设置为真实存在的URL地址后，即使 `JavaScript` 已被禁用（或遇到了搜索机），这个链接也是可用的。虽然这个链接在功能上打了点儿折扣（因为它没有打开一个新窗口），但它并没有彻底失效。这是一个经典的“平稳退化”的例子
    ```html
    <a href="http://www.example.com/" onclick="popUp(this.href); return false;">Example</a>
    ```
    - 如果能把包括事件处理函数在内的所有JavaScript代码全都放在外部文件里，这个技巧将更加完善
- `CSS`（层叠样式表）是一项了不起的技术
  - 表面上看，CSS技术并无新内容，CSS能做到的用`<table>`和`<font>`等标签也能做到
  - CSS技术的最大优点是，它能够帮助你将Web文档的内容结构（标记）和版面设计（样式）分离开来。
  - 作为CSS技术的突出优点，文档结构与文档样式的分离可以确保网页都能平稳退化。具备CSS支持的浏览器固然可以把网页呈现得美仑美奂，不支持或禁用了CSS功能的浏览器同样可以把网页的内容按照正确的结构显示出来。
- 渐进增强（progressive enhancement）就是用一些额外的信息层去包裹原始数据，渐进增强的实现必然支持平稳退化
  - 渐进增强原则基于这样一种思想：你应该总是从最核心的部分，也就是从内容开始。应该根据内容使用标记实现良好的结构；然后再逐步加强这些内容。这些增强工作既可以是通过 CSS 改进呈现效果，也可以是通过 DOM 添加各种行为。如果你正在使用 DOM 添加核心内容，那么你添加的时机未免太迟了，内容应该在刚开始编写文档时就成为文档的组成部分。
  - 类似于 CSS, JavaScript 和 DOM 提供的所有功能也应该构成一个额外的指令层。CSS 代码负责提供关于“表示”的信息，JavaScript 代码负责提供关于“行为”的信息。行为层的应用方式与表示层一样。
  - 要想获得最佳的“表示”效果，就应该把 CSS 代码从 HTML 文档里分离出来放在一些外部文件里
  - 显然，把 CSS 代码从 HTML 文档里分离出来可以让 CSS 工作得最好。这个适用于CSS表示层的结论同样适用于 JavaScript 行为层
- 分离 JavaScript：把网页的结构和内容与 JavaScript 脚本的动作行为分开。
  - 类似于使用 style 属性，在 HTML 文档里使用诸如 onclick 之类的属性也是一种既没有效率又容易引发问题的做法
  - JavaScript 语言不要求事件必须在 HTML 文档里处理，我们可以在外部 JavaScript 文件里把一个事件添加到 HTML 文档中的某个元素上
    ```javascript
    element.event = actionX;
    getElementById(id).event = actionX; // 事件添加到特定id属性的元素上
    ```
- 向后兼容性：确保老版本的浏览器不会因为你的 JavaScript 脚本而死掉。
  - 网站的访问者很可能未启用 JavaScript 功能，且不同的浏览器对 JavaScript 的支持程度也不一样
  - 绝大多数浏览器都能或多或少地支持 JavaScript，而绝大多数现代的浏览器对 DOM 的支持都非常不错。但比较古老的浏览器却很可能无法理解 DOM 提供的方法和属性
  - 对象检测（object detection）
    - 例如，如果有一个使用了`getElementById()`方法的函数，就可以在调用`getElementById()`方法之前先检查用户所使用的浏览器是否支持这个方法
    - 唯一不足是，如此编写出来的函数会增加一对花括号。如果需要在函数里检测多个 DOM 方法和/或属性是否存在，这个函数中最重要的语句就会被深埋在一层又一层的花括号里。而这样的代码往往很难阅读和理解
    - 把测试条件改为“如果你不理解这个方法，请离开”则更简单。
      - :star:[代码大全（第2版）](https://book.douban.com/subject/1477390/)
        > 17.1 用防卫句子(guard clause)(早返回或早退出) 来简化复杂的错误处理。Use guard clauses (early returns or exits) to simplify complex error processing
  - 浏览器嗅探（browser sniffing）技术曾经非常流行，指通过提取浏览器供应商提供的信息来解决向后兼容问题
    - 但这是一种风险非常大的技术，首先，浏览器有时会“撒谎”，其次，为了适用于多种不同的浏览器，浏览器嗅探脚本会变得越来越复杂
    - 充满着风险的浏览器嗅探技术正在被更简单也更健壮的对象检测技术所取代
- 性能考虑：确定脚本执行的性能最优。
  - 访问 DOM 的方式对脚本性能会产生非常大的影响
  - 要尽量减少文档中的标记数量。过多不必要的元素只会增加 DOM 树的规模，进而增加遍历 DOM 树以查找特定元素的时间
  - 包含脚本的最佳方式就是使用外部文件，因为外部文件与标记能清晰地分离开，而且浏览器也能对站点中的多个页面重用缓存过的相同脚本
  - 推荐的做法是把多个`.js`文件合并到一个脚本文件中。这样，就可以减少加载页面时发送的请求数量。而减少请求数量通常都是在性能优化时首先要考虑的。
  - :star:脚本在标记中的位置对页面的初次加载时间也有很大影响 
    - 传统上，我们都把脚本放在文档的`<head>`区域，这种放置方法有一个问题。位于`<head>`块中的脚本会导致浏览器无法并行加载其他文件（如图像或其他脚本）。
    - 一般来说，根据HTTP规范，浏览器每次从同一个域名中最多只能同时下载两个文件。
    - 而在下载脚本期间，浏览器不会下载其他任何文件，即使是来自不同域名的文件也不会下载，所有其他资源都要等脚本加载完毕后才能下载。
    - 按照本章前面讨论的渐进增强和分离JavaScript观点，把`<script>`标签放到别的地方并不是问题。把所有`<script>`标签都放到文档的末尾，`</body>`标记之前，就可以让页面变得更快。即使这样，在加载脚本时，window对象的load事件依然可以执行对文档进行的各种操作。
  - 还有一件事可以加快加载速度：压缩脚本文件
    - 把脚本文件中不必要的字节，如空格和注释，统统删除，从而达到“压缩”文件的目的。精简后的代码虽然不容易看懂，却能大幅减少文件大小
    - 多数情况下，你应该有两个版本，一个是工作副本，可以修改代码并添加注释；另一个是精简副本，用于放在站点上
    - 通常，为了与非精简版本区分开，最好在精简副本的文件名中加上min字样
    - 几个有代表性的代码压缩工具：
      - Douglas Crockford的JSMin（http://www.crockford.com/javascript/jsmin.html）
      - 雅虎的YUI Compressor（http://developer.yahoo.com/yui/compressor）
      - 谷歌的Closure Compiler（http://closure-compiler.appspot.com/home）



## 第6章 案例研究：图片库改进版 
- 结构化程序设计（structed programming）。其中有一条原则：函数应该只有一个入口和一个出口。
  - 实际工作中，过分拘泥于这项原则往往会使代码变得非常难以阅读
  - 如果为了避免留下多个出口点而去改写那些if语句的话，这个函数的核心代码就会被掩埋在一层又一层的花括号里
  - 个人认为，如果一个函数有多个出口，只要这些出口集中出现在函数的开头部分，就是可以接受的
    - :star:[代码大全（第2版）](https://book.douban.com/subject/1477390/)
      > 17.1 用防卫句子(guard clause)(早返回或早退出) 来简化复杂的错误处理。Use guard clauses (early returns or exits) to simplify complex error processing
- 假设有两个函数：`firstFunction` 和 `secondFunction`。如果想让它们俩都在页面加载时得到执行，该怎么办？
  - 可以先创建一个匿名函数来容纳这两个函数，然后把那个匿名函数绑定到onload事件上
    ```javascript
    window.onload = function() {
        firstFunction();
        secondFunction();
    }
    ```
  - 一个弹性最佳的解决方案——不管你打算在页面加载完毕时执行多少个函数，它都可以应付自如。
    ```javascript
    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        } else {
            window.onload = function() {
                oldonload();
                func();
            }
        }
    }
    addLoadEvent(firstFunction);
    addLoadEvent(secondFunction);
    ```
- nodeName 属性总是返回一个大写字母的值，即使元素在 HTML 文档里是小写字母
- onclick 事件处理函数，
  - 虽然它的名字“onclick”给人一种它只与鼠标点击动作相关联的印象，但在几乎所有的浏览器里，用Tab键移动到某个链接然后按下回车键的动作也会触发 onclick 事件
  - 最好不要使用 onkeypress 事件处理函数。onclick 事件处理函数已经能满足需要。虽然它叫“onclick”，但它对键盘访问的支持相当完美
- DOM 方法：getElementById, getElementsByTagName, getAttribute, setAttribute 都是 **DOM Core** 的组成部分。它们并不专属于JavaScript，支持DOM的任何一种程序设计语言都可以使用它们。它们的用途也并非仅限于处理网页，它们可以用来处理用任何一种标记语言（比如XML）编写出来的文档。
- 在使用 JavaScript 语言和 DOM 为 HTML 文件编写脚本时，还有许多属性可供选用。例如，我已经使用了一个属性 onclick，用于图片库中的事件管理。这些属性属于 **HTML-DOM**，它们在 **DOM Core** 出现之前很久就已经为人们所熟悉了。HTML-DOM 还提供了许多描述各种 HTML 元素的属性
  - 同样的操作既可以只使用 DOM Core 来实现，也可以使用 HTML-DOM 来实现
    ```javascript
    document.getElementByTagName("form")  // DOM Core
    element.getAttribute("src")           // DOM Core
    document.forms  // HTML-DOM
    element.src     // HTML-DOM
    ```
  - 正如大家看到的那样，HTML-DOM 代码通常会更短，必须提醒一下，它们只能用来处理 Web 文档。如果你打算用 DOM 处理其他类型的文档，请千万注意这一点。
  - 即使你决定只使用 DOM Core 方法，也应该了解 HTML-DOM。在阅读别人编写的脚本时难免会遇到各种 HTML-DOM 记号，你至少应该知道都是干什么用的。
  - 在本书的绝大多数章节里，只使用 DOM Core 来编写代码。虽然代码会因此而变得有点儿冗长，但 DOM Core 方法更容易使用
- 结构与行为的分离程度越大越好。



## 第7章 动态创建标记 
- 两个过去使用的技术，document.write 和 innerHTML
  - document 对象的 write() 方法可以方便快捷地把字符串插入到文档里
  - document.write 的最大缺点是它违背了“行为应该与表现分离”的原则。即使把 document.write 语句挪到外部函数里，也还是需要在标记的`<body>`部分使用`<script>`标签才能调用那个函数。
  - 把JavaScript和HTML代码混杂在一起是一种很不好的做法。
  - MIME 类型 application/xhtml+xml 与 document.write 不兼容，浏览器在呈现这种 XHTML 文档时根本不会执行 document.write 方法。
  - 从某种意义上讲，使用 document.write 方法有点儿像使用`<font>`标签去设定字体和颜色。虽然这两种技术在 HTML 文档里都工作得不错，但它们都不够优雅。
  - :star:把结构、行为和样式分开永远都是一个好主意。只要有可能，就应该用外部 CSS 文件代替`<font>`标签去设定和管理网页的样式信息，最好用外部JavaScript文件去控制网页的行为。
  - 应该避免在`<body>`部分乱用`<script>`标签，避免使用 document.write 方法。
- innerHTML 属性可以用来读、写某给定元素里的 HTML 内容
  - 现如今的浏览器几乎都支持属性 innerHTML，这个属性并不是 W3C DOM 标准的组成部分，但现已经包含到 HTML5 规范中
  - 它始见于微软公司的 IE 4 浏览器，并从那时起逐渐被其他的浏览器接受。
  - innerHTML 属性无细节可言。要想获得细节，就必须使用DOM方法和属性。
  - 在你需要把一大段 HTML 内容插入网页时，innerHTML 属性更适用。支持读写。
  - innerHTML 属性不会返回任何对刚插入的内容的引用。如果想对刚插入的内容进行处理，则需要使用 DOM 提供的那些精确的方法和属性。
  - innerHTML 属性要比 document.write() 方法更值得推荐
  - 类似于 document.write，innerHTML 属性也是 HTML 专有属性，不能用于任何其他标记语言文档。浏览器在呈现正宗的XHTML文档（即 MIME 类型是 application/xhtml+xml的XHTML文档）时会直接忽略掉 innerHTML 属性。
  - 任何时候，标准的 DOM 都可以用来替代 innerHTML。虽说这往往需要多编写一些代码才能获得同样的效果，但 DOM 同时也提供了更高的精确性和更强大的功能。
- DOM是一条双向车道。不仅可以获取文档的内容，还可以更新文档的内容
  ```javascript
  var para = document.createElement("p");
  ```
  - 新创建出来的`p`元素已经存在了，但它还不是任何一棵`DOM`节点树的组成部分，它只是游荡在`JavaScript`世界里的一个孤儿。它这种情况称为文档碎片(document fragment)，还无法显示在浏览器的窗口画面里。不过，它已经像任何其他的节点那样有了自己的`DOM`属性
  ```javascript
  var testdiv = document.getElementById("testdiv");
  testdiv.appendChild(para);
  ```
  - 新创建的p元素现在成为了`testdiv`元素的一个子节点。它不再是 JavaScript 世界里的一个孤儿，它已经被插入到 test.html 文档的节点树里了
  ```javascript
  var txt = document.createTextNode("Hello world!");
  para.appendChild(txt);
  ```
  - 现在已经创建出了一个元素节点并把它插入了文档的节点树，这个节点是一个空白的`p`元素。把一些文本放入这个p元素，需要用createTextNode方法创建一个文本节点。
- DOM 提供了名为 insertBefore() 方法，这个方法将把一个新元素插入到一个现有元素的前面。
  ```javascript
  parentElement.insertBefore(newElement, targetElement)
  ```
  - 在调用此方法时，你必须告诉它三件事。
  - (1) 新元素：你想插入的元素（newElement）。
  - (2) 目标元素：你想把这个新元素插入到哪个元素（targetElement）之前。
  - (3) 父元素：目标元素的父元素（parentElement）。
- DOM 没有提供 insertAfter()方法，可以利用已有的 DOM 方法和属性编写一个insertAfter函数
  ```javascript
  function insertAfter(newElement,targetElement) {
    var parent = targetElement.parentNode;
    if (parent.lastChild == targetElement) {
      parent.appendChild(newElement);
    } else {
      parent.insertBefore(newElement,targetElement.nextSibling);
    }
  }
  ```
- 使用 Ajax 就可以做到只更新页面中的一小部分
  - Ajax 的主要优势就是对页面的请求以异步方式发送到服务器
  - Ajax 有它自己的适用范围。它依赖 JavaScript，所以可能会有浏览器不支持它，而搜索引擎的蜘蛛程序也不会抓取到有关内容
  - Ajax 技术的核心就是 XMLHttpRequest 对象
    - 虽然有关 XMLHttpRequest 对象的标准还比较新（参见HTML5），但这个对象的历史可谓久远，因而得到了几乎所有现代浏览器的支持
    - 微软最早在 IE5 中以 ActiveX 对象的形式实现了一个名叫 XMLHTTP 的对象。
    - 麻烦的是，不同 IE 版本中使用的 XMLHTTP 对象也不完全相同。
    - 为了兼容所有浏览器，getHTTPObject 函数要这样来写：
    ```javascript
    function getHTTPObject() {
      if (typeof XMLHttpRequest == "undefined")
        XMLHttpRequest = function () {
          try { return new ActiveXObject("Msxml2.XMLHTTP.6.0"); }
            catch (e) {}
          try { return new ActiveXObject("Msxml2.XMLHTTP.3.0"); }
            catch (e) {}
          try { return new ActiveXObject("Msxml2.XMLHTTP"); }
            catch (e) {}
          return false;
      }
      return new XMLHttpRequest();
    }
    ```
    - 访问服务器发送回来的数据要通过两个属性完成。一个是responseText属性，这个属性用于保存文本字符串形式的数据。另一个属性是responseXML属性，用于保存Content-Type头部中指定为"text/xml"的数据，其实是一个DocumentFragment对象。你可使用各种DOM方法来处理这个对象。而这也正是XMLHttpRequest这个名称里有XML的原因。
    - 要构建成功的Ajax应用，关键在于将Ajax功能看做一般的JavaScript增强功能，在平稳退化的基础上求得渐进增强。
    - 构建Ajax网站的最好方法，是先构建一个常规的网站，然后Hijax它
    - Ajax应用主要依赖于服务器端处理，而非客户端处理




## 第8章 充实文档的内容 
- 两项原则要牢记在心。
  - 渐进增强（progressive enhancement）。渐进增强原则基于这样一种思想：你应该总是从最核心的部分，也就是从内容开始。应该根据内容使用标记实现良好的结构；然后再逐步加强这些内容。这些增强工作既可以是通过CSS改进呈现效果，也可以是通过DOM添加各种行为。如果你正在使用DOM添加核心内容，那么你添加的时机未免太迟了，内容应该在刚开始编写文档时就成为文档的组成部分。
  - 平稳退化（graceful degradation）。渐进增强的实现必然支持平稳退化。如果你按照渐进增强的原则去充实内容，你为内容添加的样式和行为就自然支持平稳退化，那些缺乏必要的CSS和DOM支持的访问者仍可以访问到你的核心内容。如果你用JavaScript去添加这些重要内容，它就没法支持平稳退化，不支持JavaScript，就看不到内容。这好像是一种限制，其实不是，利用DOM去生成内容有着广泛的用途。
- 我更喜欢使用XHTML规则，使用一个DOCTYPE让浏览器采用更严格的呈现方案。它对允许使用的标记有着更严格的要求，而这可以督促我写出更严谨清晰的文档
  - HTML既允许使用大写字母（比如`<P>`），也允许使用小写字母（比如`<p>`）; XHTML却要求所有的标签名和属性名都必须使用小写字母
  - HTML在某些情况下会允许省略结束标签，比如说，你可以省略`</p>`和`</li>`标签。表面上看它提供了一种弹性，但事实上一旦文档在浏览器里的呈现效果与你的预期不符，追查问题的根源将变得十分困难。在XHTML的世界里，所有的标签都必须闭合
  - 使用严格的DOCTYPE对验证工具跟踪错误会有很大的帮助
  - HTML5 DOCTYPE默认对应的就是标准模式
- 每种浏览器都有一些自己的默认样式
- 希望大家始终记住：JavaScript脚本只应该用来充实文档的内容，要避免使用DOM技术来创建核心内容




## 第9章 CSS-DOM 
- 在浏览器里看到的网页其实是由三层信息构成的一个共同体：结构层、表示层、行为层
- 网页的结构层（structural layer）由HTML或XHTML之类的标记语言负责创建
- 表示层（presentation layer）由CSS负责完成。CSS描述页面内容应该如何呈现
- 行为层（behavior layer）负责内容应该如何响应事件这一问题。这是JavaScript语言和DOM主宰的领域
- 在这三种技术之间存在着一些潜在的重叠区域
  - 用DOM可以改变网页的结构，诸如`createElement`和`appendChild`之类的DOM方法允许你动态地创建和添加标记
  - 在 CSS 上也有这种技术相互重叠的例子。
    - 诸如：hover和：focus之类的伪类允许你根据用户触发事件改变元素的呈现效果
    - 改变元素的呈现效果当然是表示层的“势力范围”，但响应用户触发的事件却是行为层的领地。
    - 表示层和行为层的这种重叠形成了一个灰色地带
    - CSS 正在利用伪类走进 DOM 的领地，但 DOM 也有反击之道。
- 你可以利用 DOM style 给元素设定样式
  - 当你需要引用一个中间带减号的CSS属性时，DOM要求你用驼峰命名法。CSS 属性 `font-family` 变为 DOM 属性 `fontFamily`
  - style 对象的各个属性都是可读写的
  - style 对象的属性值永远是一个字符串
  - 通过 style 属性获取样式有很大的局限性。style 属性只能返回内嵌样式。
    - 换句话说，只有把 CSS style 属性插入到标记里，才可以用 DOM style 属性去查询那些信息
- 在绝大多数场合，应该使用 CSS 去声明样式。
- 就像你不应该利用 DOM 去创建重要的内容那样，你也不应该利用 DOM 为文档设置重要的样式。
- CSS提供的：hover等伪class属性允许我们根据HTML元素的状态来改变样式。DOM也可以通过onmouseover等事件对HTML元素的状态变化做出响应。很难判断何时应该使用：hover属性、何时应该使用onmouseover事件。
  - 最简单的答案是选择最容易实现的办法。比如说，如果只是想让链接在鼠标指针悬停在其上时改变颜色，就应该选用CSS
  ```css
  a:hover {
    color: #c60;
  }
  ```
- 如果想改变某个元素的呈现效果，使用 CSS；如果想改变某个元素的行为，使用 DOM
- 使用 DOM 直接设置或修改样式的做法让“行为层”干“表示层”的活，并不是理想的工作方式。
  - 有一种简明的解决方案：与其使用 DOM 直接改变某个元素的样式，不如通过 JavaScript 代码去更新这个元素的 class 属性。
  - 即更新 className 属性。className 属性是一个可读/可写的属性，凡是元素节点都有这个属性
  - 通过 className 属性设置某个元素的 class 属性时将替换（而不是追加）该元素原有的 class 设置
    - 可以利用字符串拼接操作，把新的 class 设置值追加到 className 属性上去
  - 只要有可能，就应选择更新 className 属性，而不是去直接更新 style 对象的有关属性



## 第10章 用JavaScript实现动画效果 



## 第11章 HTML5 



## 第12章 综合示例 



## 附录 JavaScript库 




