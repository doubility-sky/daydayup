[Cocos Creator](https://github.com/cocos-creator) is a flexible, efficient and data-driven game engine, focused on content creation.


- [Official Blog](https://www.cocos.com/category/blog), [Download Cocos Creator](https://www.cocos.com/creator)
- [engine](https://github.com/cocos-creator/engine): This repo is the engine framework for Cocos Creator. Cocos Creator's in-editor scene view and web runtime share the same framework, which is the content of this repo. It's originally forked from [Cocos2d-html5](https://github.com/cocos2d/cocos2d-html5/), we build up an Entity Component architecture on it to meet the needs of Cocos Creator.
- [cocos2d-x-lite](https://github.com/cocos-creator/cocos2d-x-lite): Lite version [[cocos2d-x]] based on Cocos Runtime; Cocos2d-x compact version, It is based on cocos2d-x[version 3.9], but remove 3D and other features. It works on iOS, Android, macOS and Windows.



## Learn
- [Cocos Creator 用户手册](https://docs.cocos.com/creator/manual/zh/)
  - [配置代码编辑环境](https://docs.cocos.com/creator/manual/zh/getting-started/coding-setup.html?h=vscode)
- [Cocos Creator 开发范例](https://github.com/cocos-creator/example-cases): 本项目同时面向 Cocos Creator 引擎开发人员和最终用户，目的是建立一套贯穿开发、测试、学习使用的完整的功能范例。 [在线演示](https://cocos-creator.github.io/example-cases/)

### [Tutorial](https://github.com/cocos-creator?q=tutorial)
- [cocos-creator/tutorial-first-game](https://github.com/cocos-creator/tutorial-first-game), Quick start game for Cocos Creator
- [cocos-creator/tutorial-blackjack](https://github.com/cocos-creator/tutorial-blackjack), 21点游戏 - Cocos Creator 制造
- [cocos-creator/tutorial-dark-slash](https://github.com/cocos-creator/tutorial-dark-slash), 暗黑斩游戏制作演示 - Cocos Creator制造
- [demo-ball](https://github.com/cocos-creator/demo-ball) A jumping ball demo created by Cocos Creator 3D
- [Tutorial-Taxi-Game](https://github.com/cocos-creator/tutorial-taxi-game): This is an open source demo game using Cocos Creator 3D v1.0.x, with [17 episodes of video tutorial on Bilibili](https://www.bilibili.com/video/BV1AE411j7L9). From this project, you can learn how to use Cocos Creator 3D to develop a 3D game from sratch.



## Practice
- [COCOS 文章](https://www.chainnews.com/u/655723746819.htm)，含 官方博客 + 官方微信公众号文章
- [腾讯在线教育部技术博客](https://oedx.github.io/)
  - [CocosCreator 纹理压缩插件](https://github.com/OEDx/ccc-texturecompression)
  - [Cocos Creator 支持ETC1 + Alpha 纹理压缩](https://oedx.github.io/2019/05/15/cocos-creator-support-etc1-alpha/)
  - [cocos-jsc-endecryptor](https://github.com/OEDx/cocos-jsc-endecryptor)
- [hahack](https://www.hahack.com/tags#Cocos)
  - [基于 Cocos 的高性能跨平台开发方案](https://www.hahack.com/codes/cocos-based-high-performance-cross-platform-app-developing/)
- [Creator星球游戏开发社区](https://cloud.tencent.com/developer/column/80686)文章列表



## [[TypeScript]]
- [JavaScript 标准支持](https://docs.cocos.com/creator/manual/zh/scripting/reference/javascript-support.html)
  - Creator 使用的是标准的 JavaScript，JavaScript 目前常见的标准是几乎所有平台都支持的 ES5，如果你还想要使用更高版本的特性，需要先确认支持情况：
  - Creator 集成了 [babel](https://babeljs.io/) 编译器，能够自动转译项目里除了插件以外的所有 JavaScript 脚本。这步操作会将一部分常用的 ES2015(ES6) 特性翻译为原生的 ES5，这样开发者就不用担心跨平台的兼容性。
  - ES2015 入门教程及 Creator 支持的特性列表请参考 [Learn ES2015](https://babeljs.io/docs/en/learn)（在这份列表中，标记为“Support via polyfill”的部分暂不支持）。
  - 编辑器部分支持到常用的 ES2015，支持程度取决于 Creator 采用的 Node.js 引擎，截至 Creator 1.1，支持到了 Node.js 5.1.1（[详情](http://node.green/)）。
  - 在 Creator 的控制台中输入 process.versions.node 可以显示当前的 Node.js 版本号。
- [使用 TypeScript 脚本](https://docs.cocos.com/creator/manual/zh/scripting/typescript.html)
  - [语言支持](https://docs.cocos.com/creator3d/manual/en/scripting/language-support.html)
    - Creator 3D 使用 babel 而非 tsc（Microsoft TypeScript Compiler） 编译 TypeScript 脚本
  - [Cocos Creator TypeScript断点调试](https://blog.csdn.net/lxt610/article/details/91128045)



## Libraries
- [CocosCreator TypeScript项目引用第三方库的方法和问题记录](https://blog.k-res.net/archives/2428.html)
- [Creator | TS项目中引入第三方JS库的两种方式](https://mp.weixin.qq.com/s/bSy2XtK70F7OOCpI00nGDQ)
- [CocosCreator TypeScript使用protobuf](https://blog.csdn.net/xiefeifei316948714/article/details/90481643)
- [Creator | 微信小游戏使用 protobuf 的两种加载方式](https://mp.weixin.qq.com/s/OIkcsJQfLSXnZoUfXZ61AQ)
- 综上，使用代码引入（无需依赖 creator 编辑器插件功能）+ 静态加载 proto (支持微信小游戏) 最佳，以 macOS 为例：
  - `brew install node` ，并 `npm install -g protobufjs`
    - 方便复制起见，可以在 creator 项目根目录也执行 `npm install protobufjs`
  - 编译 `.proto` 文件，假设所在 creator 项目目录为 `myproj/assets/script/*.proto`
    - `pbjs -t static-module -w commonjs -o proto.js *.proto`
    - 得到：`myproj/assets/script/proto.js`
  - 将 `node_modules/protobufjs/dist/minimal/` 中内容，移至 `myproj/assets/script/protobufjs/minimal/`
    - 移动依据见 proto.js 前几行中，可自行修改：
    ```javascript
    var $protobuf = require("protobufjs/minimal");
    ```
  - 在需要处理 protobuffer 的地方，如： `myproj/assets/script/main.ts` 引入
    ```typescript
    import { AwesomeMessage } from "./proto.js";
    // example code
    let message = AwesomeMessage.create({ awesomeField: "hello" });
    let buffer  = AwesomeMessage.encode(message).finish();
    let decoded = AwesomeMessage.decode(buffer);
    ```
  - [Usage with TypeScript - Using generated static code](https://github.com/protobufjs/protobuf.js#using-generated-static-code)



## FAQs
- [王哲 - Cocos引擎首席客服，知乎上的回答](https://www.zhihu.com/people/walzer/answers)
  - [Cocos 引擎的创始人是谁？Cocos2d-x 和Cocos 有什么区别？](https://www.zhihu.com/question/41992081/answer/260427403)
- [序列化](https://docs.cocos.com/creator/manual/zh/getting-started/cocos2d-x-guide.html?q=#%E5%BA%8F%E5%88%97%E5%8C%96)和反序列化支持 Cocos Creator 中类的绝大多数公有属性，这些属性通过属性检查器面板暴露给开发者。
  - 开发者可以在编辑器中随意修改并保存，保存的过程就是将资源和场景数据序列化到资源数据库（Asset Database）中。反之，在加载场景的过程中，反序列化机制会根据场景数据实例化相应的对象，并加载编辑器中设置的所有属性。
  - 也就是说，序列化会将这些修改后的属性保存到场景中。而反序列化是每次启动场景的时候，这些属性都会被加载。
  - 不仅如此，数据驱动的强大之处在于，用户自己编辑的组件也可以进行属性声明。这些属性可以在编辑器中被编辑，也会被保存到场景数据中，最后在运行时被反序列化到游戏场景中。
  - [serializable参数](https://docs.cocos.com/creator3d/manual/zh/scripting/ccclass.html#serializable%E5%8F%82%E6%95%B0)
    - 指定了 default 默认值的属性默认情况下都会被序列化，序列化后就会将编辑器中设置好的值保存到场景等资源文件中，并且在加载场景时自动还原之前设置好的值。如果不想序列化，可以设置serializable: false。
    ```typescript
    @property({serializable:false})
    private num = 0;
    ```



## Resources
- [cocos-creator/awesome](https://github.com/cocos-creator/awesome) Delightful Cocos Creator Utilities, Documents and more!
- [awesome-cocos-creator](https://github.com/potato47/awesome-cocos-creator) Cocos Creator 资源汇总
- [pomelo-cocos-creator-awesome](https://github.com/tumobi/pomelo-cocos-creator-awesome) 学习 pomelo 和 Cocos Creator 过程中收集的教程、麻将、斗地主棋牌项目
