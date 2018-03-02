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

面向对象编程（Object Oriented Programming，缩写为 OOP）是目前主流的编程范式。它将真实世界各种复杂的关系，抽象为一个个对象，然后由对象之间的分工与合作，完成对真实世界的模拟。

“对象”（object）到底是什么？从两个层次来理解。

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

### 原型对象

JavaScript对每个创建的对象都会设置一个原型，指向它的原型对象（通过Function.prototype.bind方法构造出来的函数是个例外，它没有prototype属性）。方法（Function）是对象，方法的原型(Function.prototype)是对象。因此，它们都会具有对象共有的特点。即：对象具有属性__proto__，可称为**隐式原型**，一个对象的隐式原型指向构造该对象的构造函数的原型，这也保证了实例能够访问在构造函数原型中定义的属性和方法。

方法这个特殊的对象，除了和其他对象一样有上述__proto__属性之外，还有自己特有的属性——原型属性（prototype）（**显示原型**），这个属性是一个指针，指向一个对象，这个对象的用途就是包含所有实例共享的属性和方法（我们把这个对象叫做原型对象）。原型对象也有一个属性，叫做constructor，这个属性包含了一个指针，指回原构造函数。

面向对象编程很重要的一个特点是`继承`。**A**对象通过继承**B**对象，就能直接拥有B对象的所有属性和方法。大部分面向对象的编程语言，都是通过“类”（class）来实现对象的继承。JavaScript 语言的继承则是通过“原型对象”（prototype），JavaScript中所谓的继承关系不过是把一个对象的原型指向了另一个对象。

#### 隐式原型

作用：构成原型链，同样用于实现基于原型的继承。举个例子，当我们访问obj这个对象中的x属性时，如果在obj中找不到，那么就会沿着__proto__依次查找。

``` JavaScript
var Person = {
  name: 'person',
  hello: function () {
    console.log('Hello, My name is ' + this.name + '!')
  }
}
var zhangsan = {
  name: 'zhangsan'
}
zhangsan.__proto__ = Person
zhangsan.hello() // Hello, My name is zhangsan!
```

注意最后一行代码把zhangsan的原型指向了对象Person，看上去zhangsan仿佛是从Person继承下来的。

``` JavaScript
var Bird = {
    fly: function () {
        console.log(this.name + ' is flying...')
    }
}
zhangsan.__proto__ = Bird
zhangsan.fly() // zhangsan is flying...
```

现在`zhangsan`已经无法`hello()`了，他已经变成了一只鸟，可以`fly()`。

`请注意`，上述代码仅用于演示目的。在编写JavaScript代码时，不要直接用`obj.__proto__`去改变一个对象的原型，并且，低版本的IE也无法使用`__proto__`。ES5中有了对于这个内置属性标准的Get方法`Object.getPrototypeOf()`，Set方法`Object.setPrototypeOf()`，如`zhangsan.__proto__ = Bird`正确写法应该是`Object.setPrototypeOf(zhangsan, Bird)`。

#### 显式原型&原型链

作用：用来实现基于原型的继承与属性的共享。

``` JavaScript
var Person = function (name, age) {
  this.name = name || 'Unnamed'
  this.age = age || 0
}

Person.prototype.hello = function () {
  console.log('Hello, My name is ' + this.name + '!')
}
```

上面代码的原型链是
> new Person() -> Person.prototype -> Object.prototype -> null

现在，我们准备从`Person`继承得到一个新的对象`Chengxuyuan`，必须想办法把原型链修改为：
> new Person() -> Chengxuyuan.prototype -> Person.prototype -> Object.prototype -> null

这样，原型链对了，继承关系就对了。换句话说，基于构造函数`Chengxuyuan`创建的对象不但能调用`Chengxuyuan.prototype`定义的方法，还可以调用`Person.prototype`定义的方法，就达到目的了。比较经典的做法是参考道格拉斯的代码，用一个空函数`F`来实现。

``` JavaScript
var Person = function (name) {
  this.name = name || 'Unnamed'
}
Person.prototype.hello = function () {
  console.log('Hello, My name is ' + this.name + '!')
}
function Chengxuyuan(props) {
    Person.call(this, props.name)
    this.language = props.language
    this.work = function () {
      console.log(this.name + ' can do ' + this.language + ' jobs')
    }
}
function inherits(Child, Parent) {
  var F = function () {}
  F.prototype = Parent.prototype
  Child.prototype = new F()
  Child.prototype.constructor = Child
}
inherits(Chengxuyuan, Person)
var zhangsan = new Chengxuyuan({
  name:'zhangsan',
  language: 'JavaScript'
})
Chengxuyuan.prototype.getName = function () {
    return this.name
}
zhangsan.getName() // "zhangsan"
zhangsan.hello() // "Hello, My name is zhangsan!"
zhangsan.__proto__ === Chengxuyuan.prototype // true
zhangsan.__proto__.__proto__ === Person.prototype // true
zhangsan instanceof Person // true
```

上面代码，`Chengxuyuan`继承自`Person`，`Chengxuyuan`有了`Person`的属性和方法，`Chengxuyuan`还通过原型定义了新的方法。`instanceof`操作符可用于验证继承关系。

小结，JavaScript的原型继承实现方式就是：

- 定义新的构造函数，并在内部用call()调用希望“继承”的构造函数，并绑定this。
- 借助中间函数F实现原型链继承，最好通过封装的inherits函数完成。
- 继续在新的构造函数的原型上定义新方法。

#### __proto__&prototype对比

经过从上面内容的学习，可以总结出二者区别：

1. JavaScript里所有的对象都有__proto__属性（隐式原型），指向构造该对象的构造函数的原型。
2. 只有函数function才具有prototype属性（显示原型）。这个属性是一个指针，指向一个对象，这个对象的用途就是包含所有实例共享的属性和方法（我们把这个对象叫做原型对象）。原型对象也有一个属性，叫做constructor，这个属性包含了一个指针，指回原构造函数。

二者联系：

- 隐式原型指向创建这个对象的函数(constructor)的prototype。

### this关键字

#### 含义

大多数面向对象编程的语言中，`this`关键字一般指向`this`所在的类。而JavaScript中，`this`关键字用在不同的场合，很可能表达的意思不一样。为了达到一些目的，有时候我们常常需要动态改变`this`的指向。

#### 使用场合

在面向对象编程中，我们经常会像上面提到的例子中定义构造函数，会用`this`表示实例对象。`this`总会返回一个对象，一般是属性或者方法当前所在对象。

（1）全局环境

``` JavaScript
this === window // true

function f() {
  console.log(this === window);
}
f() // true
```

上面代码中，全局环境使用`this`，它指的就是顶层对象`window`。

（2）构造函数

``` JavaScript
var Obj = function (p) {
  this.p = p
}

var o = new Obj('Hello World!')
o.p // "Hello World!"
```

上面代码中，构造函数中的`this`，指的是实例对象`o`。

（3）对象的方法

``` JavaScript
var person = {
  name: '张三',
  describe: function () {
    return '姓名：'+ this.name
  }
}

person.describe() // "姓名：张三"
```

如果对象的方法里面包含`this`，`this`的指向就是方法运行时所在的对象。该方法赋值给另一个对象，就会改变this的指向。

``` JavaScript
function f() {
  return '姓名：'+ this.name;
}
var A = {
  name: '张三',
  describe: f
}
var B = {
  name: '李四',
  describe: f
}
A.describe() // "姓名：张三"
B.describe() // "姓名：李四"
```

上面代码中，函数f内部使用了`this`关键字，随着`f`所在的对象不同，`this`的指向也不同。
