# JavaScript面向对象学编程总结

title: JavaScript面向对象学编程总结
tags:

- 学习
- 总结

categories:

- 前端

date: 2018-02-27 19:30:00

---

## 前言

前端学习过程中，时常会看到apply、call以及prototype的例子，总是似懂非懂，模棱两可，有时候要半天才明白怎么回事，也不知道怎么应用到实际工作中。开贴总结学习一下，即便是以后忘记了再来阅读重拾一下，同时希望能帮助到有同样困惑的前端入门者。

要想彻底弄清楚__proto__和prototype、call和apply的存在，首先要搞明白JavaScript面向对象编程。

<!-- more -->

## 对象

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

#### __proto__和prototype区别与联系

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
  console.log(this === window)
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
  return '姓名：'+ this.name
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

只要函数被赋给另一个变量，this的指向就变了。

#### call和apply的区别与联系

通过前面的学习总结，我们知道`this`可以动态切换，为JavaScript创造了巨大的灵活性，但也使得编程的可读性变弱，难以理解，尤其是新手遇到这些，往往云里雾里。为了固定`this`的指向，JavaScript提供的`call`、`apply`等方法来固定/切换`this`的指向，这b便是`call`和`apply`存在的意义。

``` JavaScript
function Cat () {
}
Cat.prototype={
  food: 'fish',
  say: function (){
    console.log("I love "+this.food)
  }
}

var blackCat = new Cat()
blackCat.say() // I love fish
```

上面代码中，我们抽象了一个构造函数`Cat`，并且实例化出一个对象`blackCat`，具有`say`方法。但是如果我们有另外一个对象，我们不想对它重新定义say方法，那么我们可以通过`call`或`apply`用`blackCat`的`say`方法。

``` JavaScript
whiteDog = {food: 'bone'}
blackCat.say.call(whiteDog) // I love bone
blackCat.say.apply(whiteDog) // I love bone
```

上面代码中，可以看出 `call` 和 `apply` 是为了动态改变 `this` 而出现的，当一个 `object` 没有某个方法，但是其他的有，我们可以借助 `call` 或 `apply` 用其它对象的方法来操作。

- 二者联系
1. 二者的作用完全一样，均可改变JavaScript函数体内部`this`的指向。
- 二者区别
1. 接受参数的方式不太一样。

``` JavaScript
var Person = function (name, age) {
  this.name = name || 'Unnamed'
  this.age = age || 0
}

Person.prototype.hello = function () {
  console.log('Hello, My name is ' + this.name + '!')
}
```

上面代码中，可以通过`Person.call(this, name, age)` 或者 `Person.apply(this, [name, age])` 来调用。其中 `this` 是你想指定的上下文，他可以任何一个 JavaScript 对象(JavaScript 中一切皆对象)，`call` 需要把参数按顺序传递进去，而 `apply` 则是把参数放在数组里。

JavaScript 中，某个函数的参数数量是不固定的，因此要说适用条件的话，当你的参数是明确知道数量时，用 `call`，而不确定的时候，用 `apply`，然后把参数 `push` 进数组传递进去。当参数数量不确定时，函数内部也可以通过 `arguments` 这个数组来遍历所有的参数。

#### 打油诗

猫吃鱼，狗吃肉，奥特曼打小怪兽。

有天狗想吃鱼了

猫.吃鱼.call(狗，鱼)

狗就吃到鱼了

猫成精了，想打怪兽

奥特曼.打小怪兽.call(猫，小怪兽)

就这样记住了。

The End!

欢迎批评指正！

参考资料：

 [如何理解和熟练运用js中的call及apply？](https://www.zhihu.com/question/20289071)

[js中__proto__和prototype的区别和关系？](https://www.zhihu.com/question/34183746)

[面向对象编程——廖雪峰](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499763408e24c210985d34edcabbca944b4239e20000)

[面向对象编程——阮一峰](http://javascript.ruanyifeng.com/#oop)