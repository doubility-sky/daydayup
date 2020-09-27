- [[markdown]]



## Learn
- [Technical Writing Courses](https://developers.google.com/tech-writing) This collection of courses and learning resources aims to improve your technical documentation. Learn how to plan and author technical documents. You can also learn about the role of technical writers at Google.

### standards
- [中文技术文档的写作规范 - ruanyf](https://github.com/ruanyf/document-style-guide)
- [中文文案排版指北 - sparanoid](https://github.com/sparanoid/chinese-copywriting-guidelines)
- [中文文档编写规范 - creator-docs](https://github.com/cocos-creator/creator-docs/blob/v2.2/zh/CONTRIBUTING.md)
- [语种名称代码](http://www.ruanyifeng.com/blog/2008/02/codes_for_language_names.html)
  - 以往，人们常用 `zh-CN` 表示在中国大陆地区使用的中文，也就是简体中文，用 `zh-TW` 表示在台湾地区使用的中文，也就是繁体中文。但是，这种表示法很不完善
  - 目前，语言的标签表示法的国际标准是RFC 4646，名称是《Tags for Identifying Languages》，简单说，这个文件规定，一种语言的标签应该按照如下方式排列：
  - **language-script-region-variant-extension-privateuse**
    - language：这部分就是 ISO 639 规定的代码，比如中文是 zh
    - script：表示变体，比如简体汉字是 zh-Hans，繁体汉字是 zh-Hant
    - region：表示语言使用的地理区域，比如 zh-Hans-CN 就是中国大陆使用的简体中文
    - variant：表示方言
    - extension-privateus：表示扩展用途和私有标识。
    - 一般约定，language 标签全部小写，region 标签全部大写，script 标签只有首字母大写。不同标签之间用连字号 - 链接
  - **中文相关标签**
    - zh-Hans 简体中文
    - zh-Hans-CN 大陆地区使用的简体中文
    - zh-Hans-HK 香港地区使用的简体中文
    - zh-Hans-MO 澳门使用的简体中文
    - zh-Hans-SG 新加坡使用的简体中文
    - zh-Hans-TW 台湾使用的简体中文
    - zh-Hant 繁体中文
    - zh-Hant-CN 大陆地区使用的繁体中文
    - zh-Hant-HK 香港地区使用的繁体中文
    - zh-Hant-MO 澳门使用的繁体中文
    - zh-Hant-SG 新加坡使用的繁体中文
    - zh-Hant-TW 台湾使用的繁体中文



## [Graphviz](http://www.graphviz.org/)
Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. It has important applications in networking, bioinformatics,  software engineering, database and web design, machine learning, and in visual interfaces for other technical domains. 
- [miloyip/graphvizuml](https://github.com/miloyip/graphvizuml) 使用 Graphviz 绘画 UML 图
- [使用 Graphviz 生成自动化系统图](http://www.ibm.com/developerworks/cn/aix/library/au-aix-graphviz/)
- [语雀Graphviz教程 包学包会](https://www.yuque.com/wangdd/blog/llkmi5)



## [PlantUML](http://plantuml.com/)
PlantUML is an open-source tool allowing users to create UML diagrams from a plain text language. The language of PlantUML is an example of a Domain-specific language. It uses Graphviz software to lay out its diagrams. It has been used to allow blind students to work with UML. PlantUML also helps blind software engineers to design and read UML diagrams

### markdown+plantUML写技术文档（vscode插件）
- 拥有最新版的vscode
- 安装插件Markdown Preview Enhanced，用于编写时预览。该插件支持[plantUML](http://plantuml.com/zh)
  在vscode的命令行中输入` >Markdown: Open preview to the Side `
- 在markdown文件内容上右键选择` Markdown Preview Enhanced: Open Preview to the Side `，可以在右侧打开预览界面
- 在预览界面右键选择` Chrome->PDF `可以导出pdf文件
- 如果使用插件不支持的plantuml语法，需要安装[Graphviz](http://www.graphviz.org/download)

### github使用plantuml
```
src后面替换为自己的plantuml文件的url
![alternative text](http://www.plantuml.com/plantuml/proxy?src=https://raw.github.com/plantuml/plantuml-server/master/src/main/webapp/resource/test2diagrams.txt)
```



## Tools
- [draw.io](https://www.draw.io/)
  - 云端绘图，可导出各个网盘，需要翻墙2016-01-20
  - [drawio-desktop](https://github.com/jgraph/drawio-desktop) is a diagrams.net desktop app based on [Electron](https://electronjs.org/). draw.io is the old name for diagrams.net, we just don't want the hassle of changing all the binary's names.
  - [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio): This extension integrates Draw.io into VS Code. 
- [docusaurus](https://github.com/facebook/docusaurus) Easy to maintain open source documentation websites. https://docusaurus.io
- [pandoc](https://pandoc.org/) a universal document converter
  - If you need to convert files from one markup format into another, pandoc is your swiss-army knife.



## Resources
- [Awesome README](https://github.com/matiassingers/awesome-readme) Elements in beautiful READMEs include, but are not limited to: images, screenshots, GIFs, text formatting, etc.
