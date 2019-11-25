- [[node.js]]
- [[typescript]]
- [[react]], [[vue]]

## Learn
- [w3school ：前期入门，后期手册](http://www.w3school.com.cn/b.asp)
- https://github.com/Pana/node-books
- [阮一峰 ES6](http://es6.ruanyifeng.com/)
- [JavaScript编码规范](https://github.com/fex-team/styleguide/blob/master/javascript.md)
- [clean-code-javascript](https://github.com/ryanmcdermott/clean-code-javascript), Software engineering principles, from Robert C. Martin's book Clean Code, adapted for JavaScript. This is not a style guide. It's a guide to producing readable, reusable, and refactorable software in JavaScript.

## Engine
- [QuickJS Javascript Engine](https://bellard.org/quickjs/)
  - QuickJS is a small and embeddable Javascript engine. It supports the ES2020 specification including modules, asynchronous generators and proxies.
  - It optionally supports mathematical extensions such as big integers (BigInt), big floating point numbers (BigFloat) and operator overloading.
- [mJS: Restricted JavaScript engine](https://github.com/cesanta/mjs), Embedded JavaScript engine for C/C++
  - mJS is designed for microcontrollers with limited resources. Main design goals are: small footprint and simple C/C++ interoperability. mJS implements a strict subset of ES6 (JavaScript version 6):
    - Any valid mJS code is a valid ES6 code.
    - Any valid ES6 code is not necessarily a valid mJS code.
  - On 32-bit ARM mJS engine takes about 50k of flash memory, and less than 1k of RAM (see intro article). mJS is part of MongooseOS, where it enables scripting for IoT devices.
