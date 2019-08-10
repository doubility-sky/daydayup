# markdown+plantUML写技术文档（vscode插件）
- 拥有最新版的vscode
- 安装插件Markdown Preview Enhanced，用于编写时预览。该插件支持[plantUML](http://plantuml.com/zh)
  在vscode的命令行中输入` >Markdown: Open preview to the Side `
- 如果需要导出pdf或图片，则需要插件Markdown PDF。但是原作者的语法和Markdown Preview Enhanced的支持的语法不一致。

Markdown Preview Enhanced支持的语法是：
```
    ```plantuml
        @startuml
        Bob -> Alice
        Alice -> Bob
        @enduml
    ```
```
而Markdown PDF导出时支持的语法无法解析` ```plantuml `：
```
    @startuml
    Bob -> Alice
    Alice -> Bob
    @enduml
```
需要源码安装另一个fork：
1. git clone -b feature/plantuml-custom-delimiter
 https://github.com/andre-stoesel/vscode-markdown-pdf.git
2. cd vscode-markdown-pdf
3. npm install (期间会安装chromium，可能需要vpn）
4. cd ..
5. 将vscode-markdown-pdf整个文件夹拷贝到vscode的extensions目录中，默认目录为：
```
    Windows %USERPROFILE%\.vscode\extensions
    Mac $HOME/.vscode/extensions
    Linux $HOME/.vscode/extensions
```
6. 重启vscode
7. 在setting.json添加两行
```
    "markdown-pdf.plantumlOpenMarker": "```plantuml",
    "markdown-pdf.plantumlCloseMarker": "```",
    "markdown-pdf.outputDirectoryRelativePathFile": true,
    "markdown-pdf.outputDirectory": "."
```
8. 使用vscode命令` >Markdown PDF: Export (pdf) `，还可以选择导出到图片