- Reading notes of [ECMAScript 6 Tutorial](https://github.com/ruanyf/es6tutorial)


# ECMAScript 6 简介
## ECMAScript 和 JavaScript 的关系
- 前者是后者的规格，后者是前者的一种实现（另外的 ECMAScript 方言还有 JScript 和 ActionScript）。
- 日常场合，这两个词是可以互换的。
## ES6 与 ECMAScript 2015 的关系
- 2011 年，ECMAScript 5.1 版发布后，就开始制定 6.0 版了。因此，ES6 这个词的原意，就是指 JavaScript 语言的下一个版本。
- 标准委员会最终决定，标准在每年的 6 月份正式发布一次，作为当年的正式版本。接下来的时间，就在这个版本的基础上做改动，直到下一年的 6 月份，草案就成了新一年的版本。这样一来，就不需要以前的版本号了，只要用年份标记就可以了。
- ES6 的第一个版本，在 2015 年 6 月发布了，正式名称就是《ECMAScript 2015 标准》（简称 ES2015）
- ES6 既是一个历史名词，也是一个泛指，含义是 5.1 版以后的 JavaScript 的下一代标准，涵盖了 ES2015、ES2016、ES2017 等等，而 ES2015 则是正式名称，特指该年发布的正式版本的语言标准
## ECMAScript 的历史
- 1997 年，发布 ECMAScript 1.0
- 1998 年 6 月，发布 ECMAScript 2.0
- 1999 年 12 月，发布 ECMAScript 3.0
  - ECMAScript 3.0 版是一个巨大的成功，在业界得到广泛支持，成为通行标准，奠定了 JavaScript 语言的基本语法，以后的版本完全继承。直到今天，初学者一开始学习 JavaScript，其实就是在学 ECMAScript 3.0 版的语法。
- 2000 年，ECMAScript 4.0 开始酝酿。这个版本最后没有通过，但大部分内容被 ES6 继承了。因此，ES6 制定的起点其实是 2000 年。
- 2007 年 10 月，ECMAScript 4.0 版草案发布。
- 2008 年 7 月 ECMA 开会决定，中止 ECMAScript 4.0 的开发，将其中涉及现有功能改善的一小部分，发布为 ECMAScript 3.1，而将其他激进的设想扩大范围，放入以后的版本，由于会议的气氛，该版本的项目代号起名为 **Harmony**（和谐）。
  - 会后不久，ECMAScript 3.1 就改名为 ECMAScript 5。
- 2009 年 12 月，ECMAScript 5.0 版正式发布。
- 2011 年 6 月，ECMAScript 5.1 版发布，并且成为 ISO 国际标准（ISO/IEC 16262:2011）。
- 2013 年 3 月，ECMAScript 6 草案冻结，不再添加新功能。新的功能设想将被放到 ECMAScript 7。
- 2013 年 12 月，ECMAScript 6 草案发布。然后是 12 个月的讨论期，听取各方反馈。
- 2015 年 6 月，ECMAScript 6 正式通过，成为国际标准。从 2000 年算起，这时已经过去了 15 年。



# let 和 const
## let 关键字
### 基本用法
- ES6 新增了`let`关键字，用来声明变量。它的用法类似于`var`，但是所声明的变量，只在`let`关键字所在的代码块内有效。
- 标准`for`循环中，每一轮循环的变量`i`都是重新声明的，JavaScript 引擎内部会记住上一轮循环的值，初始化本轮的变量i时，就在上一轮循环的基础上进行计算。
```javascript
for (let i = 0; i < 3; i++) {
  let i = 'abc';
  console.log(i);
}
```
- 上面代码正确运行，输出了 3 次 `abc`。这表明函数内部的变量`i`与循环变量`i`不在同一个作用域，有各自单独的作用域。
### 不存在变量提升
- `let`所声明的变量一定要在声明后使用，否则报错。
```javascript
// let 的情况
console.log(bar); // 报错ReferenceError
let bar = 2;
```
### 暂时性死区
- 代码块内，使用let命令声明变量之前，该变量都是不可用的。这在语法上，称为“暂时性死区”（temporal dead zone，简称 TDZ）。
- “暂时性死区”也意味着typeof不再是一个百分之百安全的操作。
- ES6 规定暂时性死区和let、const语句不出现变量提升，主要是为了减少运行时错误，防止在变量声明前就使用这个变量，从而导致意料之外的行为。这样的错误在 ES5 是很常见的，现在有了这种规定，避免此类错误就很容易了。
### 不允许重复声明
- let不允许在相同作用域内，重复声明同一个变量。因此，不能在函数内部重新声明参数。
## 块级作用域
### ES6 的块级作用域
- ES6 允许块级作用域的任意嵌套。
- 内层作用域可以定义外层作用域的同名变量。
- 块级作用域的出现，实际上使得获得广泛应用的匿名立即执行函数表达式（匿名 IIFE）不再必要了。
### 块级作用域与函数声明
- ES6 引入了块级作用域，明确允许在块级作用域之中声明函数
- 为了减轻因此产生的不兼容问题，ES6 在[附录 B](http://www.ecma-international.org/ecma-262/6.0/index.html#sec-block-level-function-declarations-web-legacy-compatibility-semantics)里面规定，浏览器的实现可以不遵守上面的规定，有自己的[行为方式](http://stackoverflow.com/questions/31419897/what-are-the-precise-semantics-of-block-level-functions-in-es6)。

