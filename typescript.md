[TypeScript](https://www.typescriptlang.org/) :  
JavaScript that scales.  
TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.  
Any browser. Any host. Any OS. Open source.  


- [[deno]]



## Learn
- [Official Documentation](https://www.typescriptlang.org/docs/home.html)
- 🌟[TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) - [zh-CN](https://github.com/zhongsp/TypeScript)
- [TypeScript Deep Dive](https://github.com/basarat/typescript-book) - [read online](https://basarat.gitbooks.io/typescript/content/docs/getting-started.html), [深入理解 TypeScript](https://github.com/jkchao/typescript-book-chinese) - [在线阅读](https://jkchao.github.io/typescript-book-chinese/)
- [TypeScript 入门教程](https://github.com/xcatliu/typescript-tutorial) - [在线阅读](https://ts.xcatliu.com/)

### Playground
- [Official Playground](https://www.typescriptlang.org/play)
- [Better TypeScript playground](https://typescript-play.js.org), [open source](https://github.com/agentcooper/typescript-play)



## [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped)
The repository for high quality TypeScript type definitions. http://definitelytyped.org/
- [TypeScript 类型系统 - @types](https://jkchao.github.io/typescript-book-chinese/typings/types.html)
- [Microsoft/TypeSearch](https://microsoft.github.io/TypeSearch/) A web-based search for @types/* packages.  
When using TypeScript an easy way to install library Type Definitions is using "@types" npm packages.  
View the running site: http://microsoft.github.io/TypeSearch.  



## Tools
- [ts-migrate](https://github.com/airbnb/ts-migrate) is a tool for helping migrate code to TypeScript. It takes a JavaScript, or a partial TypeScript, project in and gives a compiling TypeScript project out.



## FAQs
- [tsconfig.json 全解析](https://lq782655835.github.io/blogs/project/ts-tsconfig.html)
- [Modules](https://www.typescriptlang.org/docs/handbook/modules.html)
  - 旧术语
    - **A note about terminology**: It’s important to note that in TypeScript 1.5, the nomenclature has changed. “Internal modules” are now “namespaces”. “External modules” are now simply “modules”, as to align with [ECMAScript 2015](http://www.ecma-international.org/ecma-262/6.0/)’s terminology, (namely that `module X {` is equivalent to the now-preferred `namespace X {`).
    - 在早期还没有 ES6 的时候，ts 提供了一种模块化方案，使用 module 关键字表示内部模块。
    - 但由于后来 ES6 也使用了 module 关键字，ts 为了兼容 ES6，使用 namespace 替代了自己的 module，更名为命名空间。
- [Namespaces](https://www.typescriptlang.org/docs/handbook/namespaces.html)
  - `namespace` 是 ts 早期时为了解决模块化而创造的关键字，中文称为命名空间。
  - 随着 ES6 的广泛应用，现在已经不建议再使用 ts 中的 namespace，而推荐使用 ES6 的模块化方案了，故我们不再需要学习 namespace 的使用了。
  - namespace 被淘汰了，但是在声明文件中，declare namespace 还是比较常用的，它用来表示全局变量是一个对象，包含很多子属性。
  - [declare namespace](https://ts.xcatliu.com/basics/declaration-files#declare-namespace)
- [Namespaces and Modules](https://www.typescriptlang.org/docs/handbook/namespaces-and-modules.html)
  - 从 `ECMAScript 2015` (ES6) 开始，模块成为了语言内置的部分，应该会被所有正常的解释引擎所支持。
  - 因此，对于新项目来说推荐使用模块做为组织代码的方式。
- [npm 包](https://ts.xcatliu.com/basics/declaration-files#npm-bao)
- [How to Iterate Over String Indexed Array In TypeScript?](https://stackoverflow.com/questions/35370414/how-to-iterate-over-string-indexed-array-in-typescript)
  ```typescript
  for (const key in indexedObject) {
    const val = indexedObject[key];
    // Use it...
  }
  ```



## Resources
- https://github.com/dzharii/awesome-typescript
