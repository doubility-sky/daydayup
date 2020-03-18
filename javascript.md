[ECMAScript](https://en.wikipedia.org/wiki/ECMAScript) (or ES) is a scripting-language specification standardized by Ecma International in ECMA-262 and ISO/IEC 16262. It was created to standardize JavaScript to help foster multiple independent implementations.

JavaScript has remained the best-known implementation of ECMAScript since the standard was first published, with other well-known implementations including JScript and ActionScript.

ECMAScript is commonly used for client-side scripting on the World Wide Web, and it is increasingly being used for writing server applications and services using Node.js.


- [[node.js]]
- [[typescript]]
- [[react]], [[vue]]
- [awesome-javascript](https://github.com/sorrycc/awesome-javascript) A collection of awesome browser-side JavaScript libraries, resources and shiny things.


## Learn
- :star:[Spellbook of Modern Web Dev](https://github.com/dexteryy/spellbook-of-modern-webdev) A Big Picture, Thesaurus, and Taxonomy of Modern JavaScript Web Development
- [The Modern JavaScript Tutorial](https://github.com/javascript-tutorial) - [read online](https://javascript.info/)
- [Javascript tutorial book](https://github.com/ruanyf/jstutorial) - http://javascript.ruanyifeng.com
  - [JavaScript 教程](https://github.com/wangdoc/javascript-tutorial) - https://wangdoc.com/javascript
- [ES6 入门教程](http://es6.ruanyifeng.com/)
  - [学习Javascript的书籍](http://www.ruanyifeng.com/blog/2008/01/javascript_book_recommendation.html)
  - [ECMAScript 6 简介](http://es6.ruanyifeng.com/#docs/intro)
- [ES6、ES7、ES8、ES9、ES10新特性一览](https://juejin.im/post/5ca2e1935188254416288eb2)
- [You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS) A book series on JavaScript. @YDKJS on twitter.

#### Coding Style
- [clean-code-javascript](https://github.com/ryanmcdermott/clean-code-javascript), Software engineering principles, from Robert C. Martin's book Clean Code, adapted for JavaScript. This is not a style guide. It's a guide to producing readable, reusable, and refactorable software in JavaScript.
- [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- [JavaScript编码规范](https://github.com/fex-team/styleguide/blob/master/javascript.md)
- [Cocos Creator 推荐编码规范](https://docs.cocos.com/creator/manual/zh/scripting/reference/coding-standards.html)



## Library
- [jQuery](https://github.com/jquery/jquery) JavaScript Library https://jquery.com/
- [D3](https://github.com/d3/d3): Data-Driven Documents (or D3.js) is a JavaScript library for visualizing data using web standards. 
- [Modernizr](https://github.com/modernizr/modernizr) is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser. https://modernizr.com



## Frameworks
- [Prototype](https://github.com/prototypejs/prototype) is a JavaScript framework that aims to ease development of dynamic web applications. It offers a familiar class-style OO framework, extensive Ajax support, higher-order programming constructs, and easy DOM manipulation.



## Projects
- [Best of JavaScript](https://github.com/bestofjs/bestofjs-webui) gathers the latest trends about open source projects related to Node.js and the web platform: JavaScript of course (client and server side) but also HTML, CSS...
- [JavaScript Algorithms and Data Structures](https://github.com/trekhleb/javascript-algorithms), This repository contains JavaScript based examples of many popular algorithms and data structures. [zh-CN](https://github.com/trekhleb/javascript-algorithms/blob/master/README.zh-CN.md)
- [Data Structures and Algorithms in JavaScript](https://github.com/amejiarosario/dsa.js-data-structures-algorithms-javascript) https://books.adrianmejia.com
- [Algorithm Visualizer](https://github.com/algorithm-visualizer/algorithm-visualizer)



## Compiler
- [Babel](https://babeljs.io/) is a JavaScript compiler.
  - Babel is a toolchain that is mainly used to convert ECMAScript 2015+ code into a backwards compatible version of JavaScript in current and older browsers or environments. 



## Engine
- [V8](https://v8.dev/) is Google’s open source high-performance JavaScript and WebAssembly engine, written in C++. It is used in Chrome and in Node.js, among others. It implements [ECMAScript](https://tc39.es/ecma262/) and [WebAssembly](https://webassembly.github.io/spec/core/), and runs on Windows 7 or later, macOS 10.12+, and Linux systems that use x64, IA-32, ARM, or MIPS processors. V8 can run standalone, or can be embedded into any C++ application.
- [QuickJS Javascript Engine](https://bellard.org/quickjs/)
  - QuickJS is a small and embeddable Javascript engine. It supports the ES2020 specification including modules, asynchronous generators and proxies.
  - It optionally supports mathematical extensions such as big integers (BigInt), big floating point numbers (BigFloat) and operator overloading.
- [mJS: Restricted JavaScript engine](https://github.com/cesanta/mjs), Embedded JavaScript engine for C/C++
  - mJS is designed for microcontrollers with limited resources. Main design goals are: small footprint and simple C/C++ interoperability. mJS implements a strict subset of ES6 (JavaScript version 6):
    - Any valid mJS code is a valid ES6 code.
    - Any valid ES6 code is not necessarily a valid mJS code.
  - On 32-bit ARM mJS engine takes about 50k of flash memory, and less than 1k of RAM (see intro article). mJS is part of MongooseOS, where it enables scripting for IoT devices.
- [jerryscript](https://github.com/jerryscript-project/jerryscript) is a lightweight JavaScript engine for resource-constrained devices such as microcontrollers. It can run on devices with less than 64 KB of RAM and less than 200 KB of flash memory.



## Tools
- [webpack](https://github.com/webpack/webpack) is a module bundler. Its main purpose is to bundle JavaScript files for usage in a browser, yet it is also capable of transforming, bundling, or packaging just about any resource or asset.
- [PDF.js](https://github.com/mozilla/pdf.js) is a Portable Document Format (PDF) viewer that is built with HTML5.



## FAQ
- [undefined与null的区别](https://www.ruanyifeng.com/blog/2014/03/undefined-vs-null.html)
  - undefined 和 null 在 if 语句中，都会被自动转为 false，相等运算符甚至直接报告两者相等。
  - JavaScript 的最初版本是这样区分的：
    - null 是一个表示"无"的对象，转为数值时为 0；
    - undefined 是一个表示"无"的原始值，转为数值时为NaN。
    - 但是，上面这样的区分，在实践中很快就被证明不可行。目前，null 和 undefined 基本是同义的，只有一些细微的差别。
  - 目前的用法
    - null 表示"没有对象"，即该处不应该有值。典型用法是：
      1. 作为函数的参数，表示该函数的参数不是对象。
      2. 作为对象原型链的终点。
    - undefined 表示"缺少值"，就是此处应该有一个值，但是还没有定义。典型用法是：
      1. 变量被声明了，但没有赋值时，就等于 undefined。
      2. 调用函数时，应该提供的参数没有提供，该参数等于 undefined。
      3. 对象没有赋值的属性，该属性的值为 undefined。
      4. 函数没有返回值时，默认返回 undefined。
    



