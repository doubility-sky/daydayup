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



## 第5章 最佳实践 



## 第6章 案例研究：图片库改进版 



## 第7章 动态创建标记 



## 第8章 充实文档的内容 



## 第9章 CSS-DOM 



## 第10章 用JavaScript实现动画效果 



## 第11章 HTML5 



## 第12章 综合示例 



## 附录 JavaScript库 




