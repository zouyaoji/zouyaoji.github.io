

title: Visual Studio Code 插件扩展推荐
tags:

- vscode
- IDE

categories:

- 总结

date: 2018-02-01 19:30:00

---

# Visual Studio Code 插件扩展推荐

## 前言

开始自学前端的时候，在选择集成开发环境[IDE](https://baike.baidu.com/item/集成开发环境)（Integrated Development Environment）上也是花了一些功夫。先后体验了[Atom](https://atom.io/)、[WebStorm](http://www.jetbrains.com/webstorm/)、[HBuilder](http://www.dcloud.io/)和[Visual Studio Code](https://code.visualstudio.com/)。这几款工具各有所长，都使用过一段时间，最后我发现还是**Visual Studio Code**适合我。

Visual Studio Code刚出来的时候我就开始使用了，理由很简单：

- 开源、开源、跨平台
- 微软出品、实力保证

微软对于VSCode的定位如下图，位于编辑器与IDE之间，像是披着编辑器外衣的IDE，更像是披着IDE外衣的编辑器。
![VsCode定位](https://ws1.sinaimg.cn/large/7a5fa15ely1fo1weqwiqxj20jg0avgnr)

在这儿我要赞一波Visual Studio Code，我认为它是最好用的开源文本编辑器，在保持其性能的基础上集成了很多IDE功能，可以说是微软良心出品，浓浓的微软情怀。[点我看更多VSCode评价](https://www.zhihu.com/question/29984607)。

Visual Studio Code之所以体验很好，其中很重要的一点原因是其不仅内置JavaScript、TypeScript和Node.js支持，还拥有丰富的插件（扩展）生态系统，可安装插件来支持C++、C#、Python、GO、PHP等其他语言。好了，其他就不多说了，觉得好与不好，各位可以体验之后自己评价一下。回到正题，分享一下我用到的VSCode扩展插件，主要是前端。

<!-- more -->

## 文件图标&颜色主题插件扩展

“人靠衣装马靠鞍，狗配铃铛跑的欢”，VsCode也是，本身颜值一般，需要扩展主题改造，我这儿推荐几个我个人比较喜欢的文件图标和颜色主题插件，这个没啥好说的，直接上图。

### [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)

- Material风格

![Material Icon Theme](https://ws1.sinaimg.cn/large/7a5fa15ely1fo20pmmjbfj20v91in7ah)

### [vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)

- 图标很全、风格不错

![vscode-icons](https://ws1.sinaimg.cn/large/7a5fa15ely1fo20rjx9rxg20m80gonpe)

### [VSCode Greate Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)

- 风格不错

![VSCode Greate Icons](https://ws1.sinaimg.cn/large/7a5fa15ely1fo20tay43ij20tc0j7767)

### [Atom One Dark Theme](https://marketplace.visualstudio.com/items?itemName=akamud.vscode-theme-onedark)

- One Dark Theme based on Atom

![Atom One Dark Theme](https://ws1.sinaimg.cn/large/7a5fa15ely1fo211kzao5j20ty0i2t8x)

### [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)

- Atom's iconic One Dark theme for Visual Studio Code

![One Dark Pro](https://ws1.sinaimg.cn/large/7a5fa15ely1fo20nyywytj21r41cwq55)

### [One Dark Vivid](https://marketplace.visualstudio.com/items?itemName=kkozee.theme-one-dark-vivid)

- Atom's One Dark Vivid Theme for VS Code

![One Dark Vivid](https://ws1.sinaimg.cn/large/7a5fa15ely1fo21djx9qgj21q60zcq6g)

### [Monokai Dark Soda](https://marketplace.visualstudio.com/items?itemName=AdamCaviness.theme-monokai-dark-soda)

- A dark theme with bright colors

![Monokai Dark Soda](https://ws1.sinaimg.cn/large/7a5fa15ely1fo21a6le37j20p00kugo3)

## 前端插件扩展

VSCode插件扩展很多，但常用的也就那么些个，可以按照自己的代码风格习惯+自己的技术栈安一些插件。比如我前端对NPM、GitHub、Vue接触比较多，我自然就关于方面的比较多，然后是代码规范的插件、代码美化的插件、调试的插件等。

### [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)

- Synchronize Settings, Snippets, Themes, File Icons, Launch, Keybindings, Workspaces and Extensions Across Multiple Machines Using GitHub Gist. 首推Settings Sync，这个插件的功能是帮你同步VsCode插件的，只要你上传了你的插件配置，家里和办公区电脑，重装系统后，都能同步，而且轻松就能分享你安装的插件给他人。可以理解为你VSCode的插件和设置，都帮你云备份了，你随时可以更新、下载，是通过GitHub的Personal Access Token备份的，如果没有的话，要申请一个[GitHub](https://github.com/)号了。

![Settings Sync](https://ws1.sinaimg.cn/large/7a5fa15ely1fo221x1em6g20hs0991l0)

### [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)

- Automatically add HTML/XML close tag, same as Visual Studio IDE or Sublime Text does. 为你的HTML标签自动添加结束标签。

![Auto Close Tag](https://ws1.sinaimg.cn/large/7a5fa15ely1fo21yne23fg21400q2ajs)

### [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)

- Auto rename paired HTML/XML tag. 自动帮你修改成对的HTML/XML标签。

![Auto Rename Tag](https://ws1.sinaimg.cn/large/7a5fa15ely1fo220e5wqsg21400q2q6y)

### [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)

- Visual Studio Code plugin that autocompletes filenames. 自动帮你补全引用路径.

![Path Intellisense](https://ws1.sinaimg.cn/large/7a5fa15ely1fo2249685sg20dc07i411)

### [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

- VS Code plugin for prettier/prettier. 让VSCode支持用[prettier](https://github.com/prettier/prettier)优化JavaScript / TypeScript / CSS文件.

### [Beautify](https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)

- Beautify javascript, JSON, CSS, Sass, and HTML in Visual Studio Code. 美化js、json、css、sass和html格式。按F1，命令输入Beautify即可执行美化。

### [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)

- A customizable extension for colorizing matching brackets. 帮你把配对的小括号、中括号、大括号用不同的颜色区分，方便查看。

![Bracket Pair Colorizer](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22b24j4vj208901owec)

### [Debugger for Chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)

- Debug your JavaScript code in the Chrome browser, or any other target that supports the Chrome Debugger protocol. 在谷歌浏览器中调试js代码，并且可以在VSCode中打断点。

![Debugger for Chrome](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22fy3o0jg21400p0npl)

### [npm](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)

- npm support for VS Code. 装了它可以让VSCode有NPM的一些功能，还能提示你package.json中哪些依赖模块没有安装。

![npm1](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22ir81txj20h60bo75d)
![npm2](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22ixb8n6j20go03yaa2)

### [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense)

- Visual Studio Code plugin that autocompletes npm modules in import statements. 装了它，在js中引入npm包的时候可以帮你自动补全。

![npm Intellisense](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22ll6pcfg20pv07t7hn)

### [Full HTML tags including HTML5 Snippets](https://marketplace.visualstudio.com/items?itemName=abusaidm.html-snippets)

- Full HTML tags including HTML5 Snippets. 让VSCode支持HTML5的代码片段.

![Full HTML tags including HTML5 Snippets](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22u7cx1sg20ny0gydqz)

### [JavaScript (ES6) code snippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)

- Code snippets for JavaScript in ES6 syntax. 让VSCode支持ES6语法的代码片段。

### [jQuery Code Snippets](https://marketplace.visualstudio.com/items?itemName=donjayamanne.jquerysnippets)

- Over 130 jQuery Code Snippets for JavaScript code. jQuery代码块插件.

![jQuery Code Snippets](https://ws1.sinaimg.cn/large/7a5fa15ely1fo23pfs6h0j20kg0fmweh)

### [Document This](https://marketplace.visualstudio.com/items?itemName=joelday.docthis)

- Automatically generates detailed JSDoc comments in TypeScript and JavaScript files. ts或者js中自动生成详细的注释。

![Document This](https://ws1.sinaimg.cn/large/7a5fa15ely1fo23b5kf4lg213i0ty0xq)

### [language-stylus](https://marketplace.visualstudio.com/items?itemName=sysoev.language-stylus)

- Stylus language support. 让VSCode支持Stylus语法。

![language-stylus](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22wos68yg20ns0egakp)

### [Sass](https://marketplace.visualstudio.com/items?itemName=robinbentley.sass-indented)

- Indented Sass syntax highlighting, autocomplete & snippets. 让VSCode支持Sass语法、高亮、自动补全、代码片段。

![Sass](https://ws1.sinaimg.cn/large/7a5fa15ely1fo22zi84kgj20rd0hz74i)

### [SVG Viewer](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)

- SVG Viewer for Visual Studio Code. 让VSCode可以预览SVG格式的图片。

![SVG Viewer](https://ws1.sinaimg.cn/large/7a5fa15ely1fo23tsyucjg20nd0ib0we)

### [open in browser](https://marketplace.visualstudio.com/items?itemName=techer.open-in-browser)

- This allows you to open the current file in your default browser or application. 帮你用默认浏览器打开当前的文件。VSCode本身没有这个功能，想看单个页面，安了这个就很方便。

### [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

- Integrates ESLint into VS Code. 让VSCode支持ESLint编码规范，此规范略显严格，刚开始可能很不习惯，久了会对代码编写规范养成有很大帮助。我目前的项目都是开启了ESLint规范检查的。

### [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)

- Vue tooling for VS Code. VSCode的Vue工具插件，官方推荐，值得信赖。**[文档传送门](https://vuejs.github.io/vetur)**。

### [Vue 2 Snippets](https://marketplace.visualstudio.com/items?itemName=hollowtree.vue-snippets)

- A Vue.js 2 Extension. 这个插件基于最新的 Vue 官方语法高亮文件添加了Syntax Highlight，并且依据 Vue 2 的 API 添加了Code Snippets。

![Vue 2 Snippets1](https://ws1.sinaimg.cn/large/7a5fa15ely1fo249be7dpj209c0brt8o)
![Vue 2 Snippet2](https://ws1.sinaimg.cn/large/7a5fa15ely1fo249fz9f5j20do08dt8k)

## 通用工具插件扩展

### [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)

- Run C, C++, Java, JS, PHP, Python, Perl, Ruby, Go, Lua, Groovy, PowerShell, CMD, BASH, F#, C#, VBScript, TypeScript, CoffeeScript, Scala, Swift, Julia, Crystal, OCaml, R, AppleScript, Elixir, VB.NET, Clojure, Haxe, Objective-C, Rust, Racket, AutoHotkey, AutoIt, Kotlin, Dart, Pascal, Haskell, Nim, D. 可以在VSCode运行以上语法的代码片段，可以说很强大。

![Code Runner](https://ws1.sinaimg.cn/large/7a5fa15ely1fo24dej24gg21fo0xwwjh)

### [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)

- View git log, file history, compare branches or commits. 可以让你看到git源代码的日志，包括文件编辑历史，和以前分支对比等。推荐。

![Git History](https://ws1.sinaimg.cn/large/7a5fa15ely1fo24gfubm0g20zk0m87wk)

### [Git Lens — git blame annotations, code lens, and more](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

- Supercharge Visual Studio Code's Git capabilities — Visualize code authorship at a glance via Git blame annotations and code lens, seamlessly navigate and explore the history of a file or branch, gain valuable insights via powerful comparison commands, and so much more. 加强VSCode的Git功能，通过git clone命令下来的项目，都在每一个文件每一行中看见原创作者提交时的日志，包括你修改时提交的日志，并且有对比功能。

![Git Lens — git blame annotations, code lens, and more](https://ws1.sinaimg.cn/large/7a5fa15ely1fo24jbjm9jg20k70gonpe)

### [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml)

- XML Formatting, XQuery, and XPath Tools for Visual Studio Code. 让VSCode支持XML格式化、预览、检查等功能。

### [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

All you need to write Markdown (keyboard shortcuts, table of contents, auto preview and more). 加强VSCode markdown文件的编辑能力，增加markdown语法快捷键，优化list编辑，格式化等。

![Markdown All in One1](https://ws1.sinaimg.cn/large/7a5fa15ely1fo24sf5b2tg20k50a5mxv)
![Markdown All in One2](https://ws1.sinaimg.cn/large/7a5fa15ely1fo24skl69sg20k50a5gmh)

### [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)

- Markdown Preview Enhanced ported to vscode. 增强VSCode的Markdown文件预览功能.

![Markdown Preview Enhanced](https://ws1.sinaimg.cn/large/7a5fa15ely1fo251uikkaj210i0m6q81)

## 其他语言支持插件扩展

### [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

- C/C++ IntelliSense, debugging, and code browsing. 可以让VSCode智能感知、调试、运行C++代码。

### [C/C++ Snippets](https://marketplace.visualstudio.com/items?itemName=hars.CppSnippets)

- Code snippets for C/C++. 让VSCode可以输入C/C++代码片段。

### [C#](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)

- C# for Visual Studio Code (powered by OmniSharp). 官方出品的VSCode C#插件。

### [C# FixFormat](https://marketplace.visualstudio.com/items?itemName=Leopotam.csharpfixformat)

- Fix format of usings / indents / braces / empty lines. 增强VSCode对C#文件格式化能力。

### [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

- Linting, Debugging (multi-threaded, remote), Intellisense, code formatting, refactoring, unit tests, snippets, and more. VSCode Python插件，支持python语法检查、调试（多线程调试、远程调试）、只能感知、格式化py文件、重构、单元测试、python代码片段等。

### [Go](https://marketplace.visualstudio.com/items?itemName=lukehoban.Go)

- Rich Go language support for Visual Studio Code. 加强VSCode对GO语言的支持。

![Go](https://ws1.sinaimg.cn/large/7a5fa15ely1fo254iqr4pg20qw0gz4qq)

### [Language Support for Java(TM) by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.java)

- anguage Support for Java(TM) for Visual Studio Code provided by Red Hat. 让VSCode只Java语法。

以上就是我的全部分享，插图来源于[VSCode官网](https://marketplace.visualstudio.com/vscode)。如果大家有发现什么好用的插件，欢迎分享出来。

最后附上我Settings Sync共享的公共ID：

- Gist ID：d4256477db4b00ee69749e1bb69cb5f0

同步的时候，GitHub Token填自己的，然后输这个Gist ID即可。