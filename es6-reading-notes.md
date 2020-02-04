- Reading notes of [ECMAScript 6 Tutorial](https://github.com/ruanyf/es6tutorial) - http://es6.ruanyifeng.com/



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


## let 命令
- 关键字分成不同用途，有的是命令（`delete`），有的是语言结构（比如`if`）。见此 [issue](https://github.com/ruanyf/es6tutorial/issues/946)

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
- 代码块内，使用`let`命令声明变量之前，该变量都是不可用的。这在语法上，称为“暂时性死区”（temporal dead zone，简称 TDZ）。
- “暂时性死区”也意味着`typeof`不再是一个百分之百安全的操作。
- ES6 规定暂时性死区和`let`、`const`语句不出现变量提升，主要是为了减少运行时错误，防止在变量声明前就使用这个变量，从而导致意料之外的行为。这样的错误在 ES5 是很常见的，现在有了这种规定，避免此类错误就很容易了。

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
- ES6 的块级作用域必须有大括号，如果没有大括号，JavaScript 引擎就认为不存在块级作用域。


## const 命令

### 基本用法
- `const`一旦声明变量，就必须立即初始化。
- `const`的作用域与`let`命令相同：只在声明所在的块级作用域内有效。
- `const`命令声明的常量也是不提升，同样存在暂时性死区，只能在声明的位置后面使用。

### ES6 声明变量的六种方法
- ES5 只有两种声明变量的方法：`var`命令和`function`命令。
- ES6 除了添加`let`和`const`命令，还有：`import`命令和`class`命令。


## 顶层对象的属性
- 顶层对象，在浏览器环境指的是`window`对象，在 Node 指的是`global`对象。
- ES5 之中，顶层对象的属性与全局变量是等价的。
- 顶层对象的属性与全局变量挂钩，被认为是 JavaScript 语言最大的设计败笔之一。
- ES6 为保持兼容性，`var`命令和`function`命令声明的全局变量，依旧是顶层对象的属性；:star:
  - `let`命令、`const`命令、`class`命令声明的全局变量，不属于顶层对象的属性。
  - 从 ES6 开始，全局变量将逐步与顶层对象的属性脱钩。

### [globalThis 对象](http://es6.ruanyifeng.com/#docs/let#globalThis-%E5%AF%B9%E8%B1%A1)
- 很难找到一种方法，可以在所有情况下，都取到顶层对象。
- ES2020 在语言标准的层面，引入`globalThis`作为顶层对象。也就是说，任何环境下，`globalThis`都是存在的，都可以从它拿到顶层对象，指向全局环境下的`this`。



# 变量的解构赋值


## 数组的解构赋值

### 基本用法
- ES6 允许按照一定模式，从数组和对象中提取值，对变量进行赋值，称为解构（Destructuring）。属于“模式匹配”
```javascript 
let [a, b, c] = [1, 2, 3];
let [foo, [[bar], baz]] = [1, [[2], 3]];
let [ , , third] = ["foo", "bar", "baz"];
let [head, ...tail] = [1, 2, 3, 4];  // tail: [2, 3, 4]
let [x, y, ...z] = ['a'];  // y: undefined,  z: []
let [x, y, z] = new Set(['a', 'b', 'c']);  // x: "a"
```
- 如果解构不成功，变量的值就等于`undefined`。
- 不完全解构，即等号左边的模式，只匹配一部分的等号右边的数组。这种情况下，解构依然可以成功。
- 如果等号的右边不是数组（或者严格地说，不是可遍历的结构，参见《Iterator》一章），那么将会报错。


## 默认值
```javascript
let [foo = true] = [];
let [x = 1] = [undefined];  // x: 1
let [x = 1] = [null];  // x: null
```
- ES6 内部使用严格相等运算符（`===`），判断一个位置是否有值。所以，只有当一个数组成员严格等于`undefined`，默认值才会生效。
- 如果默认值是一个表达式，那么这个表达式是惰性求值的。
- 默认值可以引用解构赋值的其他变量，但该变量必须已经声明。


## 对象的解构赋值

### 简介
```javascript
let { foo, bar } = { foo: 'aaa', bar: 'bbb' };
```
- 如果解构失败，变量的值等于`undefined`。
- 对象的解构赋值是下面形式的简写
```javascript
let { foo: foo, bar: bar } = { foo: 'aaa', bar: 'bbb' };
```
- 与数组一样，解构也可以用于嵌套结构的对象。

### 默认值
- 对象的解构也可以指定默认值。
- 默认值生效的条件是，对象的属性值严格等于undefined。
```javascript
var {x = 3} = {x: undefined};  // x: 3
var {x = 3} = {x: null};  // x: null
```

### 注意点
- 将大括号写在行首，JavaScript 会将其解释为代码块。
```javascript
let x;
{x} = {x: 1};  // SyntaxError: syntax error
({x} = {x: 1});  // right way!
```
- 由于数组本质是特殊的对象，因此可以对数组进行对象属性的解构。
```javascript
let arr = [1, 2, 3];
let {0 : first, [arr.length - 1] : last} = arr;  // first: 1, last: 3
```


## 字符串的解构赋值
```javascript
const [a, b, c, d, e] = 'hello';  // a: "h", ...
let {length : len} = 'hello';  // len: 5
```
- 字符串也可以解构赋值。此时，字符串被转换成了一个类似数组的对象。
- 数组的对象都有一个length属性，因此还可以对这个属性解构赋值。


## 数值和布尔值的解构赋值
- 解构赋值时，如果等号右边是数值和布尔值，则会先转为对象。
- 由于`undefined`和`null`无法转为对象，所以对它们进行解构赋值，都会报错。


## 函数参数的解构赋值
- 函数的参数也可以使用解构赋值。
- 函数参数的解构也可以使用默认值。


## 圆括号问题
- ES6 的规则是，只要有可能导致解构的歧义，就不得使用圆括号。
- 建议只要有可能，就不要在模式中放置圆括号。

### 不能使用圆括号的情况
1. 变量声明语句：
2. 函数参数 （也属于变量声明）
3. 赋值语句的模式（整个或部分模式放在圆括号之中）
```javascript
let [(a)] = [1];  // 1
function f([(z)]) { return z; }  // 2
([a]) = [5];  // 3a
[({ p: a }), { x: c }] = [{}, {}];  // 3b
```

### 可以使用圆括号的情况
- 只有一种：赋值语句的非模式部分，可以使用圆括号。
```javascript
[(b)] = [3]; // 正确
({ p: (d) } = {}); // 正确  模式是p，而不是d
[(parseInt.prop)] = [3]; // 正确
```


## 用途
1. 交换变量的值
```javascript
let x = 1, y = 2;
[x, y] = [y, x];  // 简洁、易读、语义清晰
```
2. 从函数返回多个值
- 函数只能返回一个值，如果要返回多个值，只能将它们放在数组或对象里返回。有了解构赋值，取出这些值就非常方便。
3. 函数参数的定义
```javascript
function f1([x, y, z]) { ... } // 参数是一组有次序的值
f1([1, 2, 3]);
function f2({x, y, z}) { ... } // 参数是一组无次序的值
f2({z: 3, y: 2, x: 1});
```
4. 提取 JSON 数据
- **//貌似用途不是特别大**
5. 函数参数的默认值
- 避免了在函数体内部再写`var foo = config.foo || 'default foo';`这样的语句。
6. 遍历 Map 结构
- Map 结构原生支持 Iterator 接口，配合变量的解构赋值，获取键名和键值就非常方便
7. 输入模块的指定方法
```javascript
const { SourceMapConsumer, SourceNode } = require("source-map");
```



# 字符串的扩展


## 字符的 Unicode 表示法




# 字符串的新增方法



# 正则的扩展



# 数值的扩展



# 函数的扩展



# 数组的扩展



# 对象的扩展



# 对象的新增方法



# Symbol



# Set 和 Map 数据结构



# Proxy



# Reflect



# Promise 对象



# Iterator 和 for...of 循环



# Generator 函数的语法



# Generator 函数的异步应用



# async 函数



# Class 的基本语法



# Class 的继承



# Module 的语法



# Module 的加载实现



# 编程风格



# 读懂规格



# 异步遍历器



# ArrayBuffer



# 最新提案



# Decorator



# 参考链接
- http://es6.ruanyifeng.com/#docs/reference
