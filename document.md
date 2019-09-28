## markdown+plantUML写技术文档（vscode插件）
- 拥有最新版的vscode
- 安装插件Markdown Preview Enhanced，用于编写时预览。该插件支持[plantUML](http://plantuml.com/zh)
  在vscode的命令行中输入` >Markdown: Open preview to the Side `
- 在markdown文件内容上右键选择` Markdown Preview Enhanced: Open Preview to the Side `，可以在右侧打开预览界面
- 在预览界面右键选择` Chrome->PDF `可以导出pdf文件
- 如果使用插件不支持的plantuml语法，需要安装[Graphviz](http://www.graphviz.org/download)

## github使用plantuml
```
src后面替换为自己的plantuml文件的url
![alternative text](http://www.plantuml.com/plantuml/proxy?src=https://raw.github.com/plantuml/plantuml-server/master/src/main/webapp/resource/test2diagrams.txt)
```