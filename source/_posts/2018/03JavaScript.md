# prototype、apply&call学习总结

title: prototype、apply&call学习总结
tags:

- 学习
- 总结

categories:

- 前端

date: 2018-02-27 19:30:00

---

## 前言

前端学习过程中，时常会看到 `apply` `、call` 以及 `prototype` 的例子，有时候要半天才明白怎么回事，也不知道怎么应用到实际工作中。开贴总结学习一下，即便是以后忘记了再来阅读重拾一下。同时希望能帮助到有同样困惑的前端入门者。

<!-- more -->

## JavaScript面向对象编程

### 对象

面向对象编程（Object Oriented Programming，缩写为 OOP）是目前主流的编程范式。它将真实世界各种复杂的关系，抽象为一个个对象，然后由对象之间的分工与合作，完成对真实世界的模拟。

每一个对象都是功能中心，具有明确分工，可以完成接受信息、处理数据、发出信息等任务。对象可以复用，通过继承机制还可以定制。因此，面向对象编程具有灵活、代码可复用、高度模块化等特点，容易维护和开发，比起由一系列函数或指令组成的传统的过程式编程（procedural programming），更适合多人合作的大型软件项目。

那么，“对象”（object）到底是什么？我们从两个层次来理解。

（1）对象是单个实物的抽象。

一本书、一辆汽车、一个人都可以是对象，一个数据库、一张网页、一个与远程服务器的连接也可以是对象。当实物被抽象成对象，实物之间的关系就变成了对象之间的关系，从而就可以模拟现实情况，针对对象进行编程。

（2）对象是一个容器，封装了属性（property）和方法（method）。

属性是对象的状态，方法是对象的行为（完成某种任务）。比如，我们可以把动物抽象为animal对象，使用“属性”记录具体是那一种动物，使用“方法”表示动物的某种行为（奔跑、捕猎、休息等等）。

在JavaScript中，万物皆对象，面向对象编程的第一步，就是要生成对象。典型的面向对象编程语言（比如 C++ 和 Java），都有“类”（class）这个概念。所谓“类”就是对象的模板，对象就是“类”的实例。但是，JavaScript 语言的对象体系，不是基于“类”的，而是基于构造函数（constructor）和原型链（prototype）。

例如：

``` JavaScript
var Person = function (name, age) {
  this.name = name
  this.age = age
  this.hello = function () {
    console.log('Hello, My name is ' + this.name + '!')
  }
}

var zhangsan = new Person('zhangsan', 18)
zhangsan.name // "zhangsan"
zhangsan.hello() // "Hello, My name is zhangsan!"
Person.prototype === zhangsan.__proto__ // true
```

上面代码中，`Person`是构造函数（constructor），通过`new`命令让构造函数`Person`生成一个实例对象，保存在变量`zhangsan`中。这可理解为我们简单抽象了一个人，他现在具有“名字”、“年龄”特征（属性），他会“问好”这个技能（方法）。构造函数的特点有2个：

- 函数体内部使用了this关键字，代表了所要生成的对象实例。
- 生成对象的时候，必须使用new命令。

新创建的`zhangsan`的原型链是
> zhangsan -> Person.prototype -> Object.prototype -> null

