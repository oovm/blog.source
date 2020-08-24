
# 多态

标签（空格分隔）： 未分类

---

## Polymorphism

在编程语言和类型论中，多态（英语：polymorphism）指为不同数据类型的实体提供统一的接口。 [1]多态类型（英语：polymorphic type）可以将自身所支持的操作套用到其它类型的值上。[2]

计算机程序运行时，相同的消息可能会送给多个不同的类别之对象，而系统可依据对象所属类别，引发对应类别的方法，而有不同的行为。简单来说，所谓多态意指相同的消息给予不同的对象会引发不同的动作。多态也可定义为“一种将不同的特殊行为和单个泛化记号相关联的能力”。

实际上都是，无论重载、泛型，还是继承关系都是多态的一个具体体现，也被归属为不同的多态分类

- Ad hoc polymorphism（特定多态，也译作特设多态）
- Parametric polymorphism（参数化多态）
- Subtyping（子类型多态）
- Row polymorphism（行多态）

别被这些名词概念唬住，下面我们就通过代码实例来一一过一遍。

## Ad-hoc Polymorphism

**特设多态**是由 [Christopher Strachey](https://en.wikipedia.org/wiki/Christopher_Strachey) 在 1967 年提出来的，从它的取名我们可以大概猜到，它是针对于特定问题的多态方案，比如：

- 函数重载(Function Overloading)
- 运算符重载(Operator Overloading)
- 宏多态(Macro Polymorphism)

**函数重载**指的是多个函数拥有相同的名称，但却拥有不同的实现。

特设多态的意思是，一个函数有，有限数量的多种不同的实现，依赖参数的类型来选择调用特定版本的函数实现。这种选择在编译期就可以判断，所以称为静态多态。

比如下面的函数重载示例，展示了两个名为 `print` 的 函数，一个打印字符串，一个打印图像。

```
publicvoidprint(String word){
  ...
}

publicvoidprint(Image image){
  ...
}
复制代码
```

**操作符**本质上是一个特殊的函数, 只接受一个或两个参数的特殊函数

因此操作符重载本质上就是函数重载

## Parametric Polymorphism

**参数化多态**和特定多态都是同一年由同一人提出的，最开始由 ML 语言实现（1975年），时至今日，几乎所有的现代化语言都有对应特性进行支持，比如 D 和 C++ 中的模板，C#、Delphi 和 Java 中的泛型。

对于它的好处，我从 wiki 摘录了一段

参数多态就是定义类型时候，或者某个类型的实现时候（比如类，函数，变量等）保留类型参数，等以后在使用时候，由程序员或者编译器补上适当的类型参数。有时候也会被叫做泛型编程。一般这也是编译期决定的，也是静态多态

>  参数化多态使得编程语言在保留了静态语言的类型安全特性的同时又增强了其表达能力

以 Java 的集合库 `List<T>` 为例，List 就是类型构造器， T 就是参数，通过指定不同的参数类型就实现了多态

- `List<String>`
- `List<Integer>`

如果不考虑类型擦除，`List<String>` 和 `List<Integer>` 就是两个不同的类型，从这儿我们也可以看出，参数化多态可以适用于无穷多的类型。

wiki 上有一段描述参数化多态与特定多态的区别我觉得非常形象

> 假如我们要把原材料切成两半——
> 
> - 参数多态：只要能 “切” ，就用工具来切割它。
> - 特定多态：根据原材料是铁还是木头还是什么来选择不同的工具来切。

## Subtyping Polymorphism

（子类型多态） ## (data-id=undefined)

**子类型多态**一般出现在具名类型系统中，它表达的是一种替代关系。

以下面的  Java 代码为例， Car 分别有 SmallCar、BigCar 两个子类 

```
abstractclassCar{}

classSmallCarextendsCar{}

classBigCarextendsCar{}
复制代码
```

那么在 priceOfCar函数内，BigCar 和 SmallCar 就是可以相互替换的了

```
public BigDecimal priceOfCar(Car car){
    //TODO
}
复制代码
```

要注意**子类型**和**继承**这两者之间是不一样的。

子类型更多的是描述一种关系：如果 S 是 T 的子类型，即 **S <: T** ），那么在任何使用 T 类型的上下文中也都可以使用 S，相当于 S 可以替换掉 T。（有没有想起**里氏替换原则** ？）

> **<:** 是来源于类型论的符号，表示子类型关系

而继承则是编程语言的一种特性，换句话说，就是通过继承描述了子类型关系。

在面向对象的程序设计中，里氏替换原则（Liskov Substitution principle）是对子类型的特别定义。它由芭芭拉·利斯科夫（Barbara Liskov）在1987年在一次会议上名为“数据的抽象与层次”的演说中首先提出。[1]

里氏替换原则的内容可以描述为： “派生类（子类）对象可以在程序中代替其基类（超类）对象。” 以上内容并非利斯科夫的原文，而是译自罗伯特·马丁（Robert Martin）对原文的解读。其原文为：

Let {\displaystyle q(x)}q(x) be a property provable about objects {\displaystyle x}x of type {\displaystyle T}T. Then {\displaystyle q(y)}q(y) should be true for objects {\displaystyle y}y of type {\displaystyle S}S where {\displaystyle S}S is a subtype of {\displaystyle T}T.
芭芭拉·利斯科夫与周以真（Jeannette Wing）在1994年发表论文并提出以上的Liskov代换原则。

## Row polymorphism

变体多态

**Row polymorphism**  与**子类型多态**很相似，但却是一个截然不同的概念，它主要用于处理结构化类型的多态。

那么问题来了，什么是结构化类型呢？

在 Java 中我们判断类型是否兼容或对等是根据名称来的，这种类型系统一般被称之为**基于名称的类型**（或**标明类型系统**）， 而结构化类型则是基于类型的**实际结构或定义**来判断类型的兼容性和对等性。

由于 Java 不支持 Row Polymorphism，所以下面会用 Scala 来进行展示。

假设我们现在有一个特质 (类似于 Java 的接口)  `Event` ，它是对业务事件的抽象， EventListener 则是事件的处理类， 它的 listen 函数接受 Event 对象作为参数。

```
traitEvent{
    defpayload(): String
}

classInitEventextendsEvent{
  overridedefpayload(): String = {
    // TODO
  }
}

classEventListener{
    deflisten(event: Event): Unit = {
        //TODO
    }
}
复制代码
```

正常情况下我们会这样来使用

```
val listener = newEventListener()
listener.listen(newInitEvent())
复制代码
```

如果此时有一个 `OldEvent`，它没有实现 `Event` 特质 ， 但却有相同的 payload 方法定义

```
classOldEvent{
  defpalyload() = {
    // TODO
  }
}
复制代码
```

熟悉 Java 的同学都知道，EventListener 是无法接受 OldEvent 对象的 ，因为 OldEvent 不是 Event 的子类

```
// 编译失败: OldCall 不是 Event 类型
listener.listen(newOldCall())
复制代码
```

再来看看结构化类型在该场景下的表现，将 EventListener 的 listen 函数参数由 Event 类改为结构化对象

```
classEventListener{
    /**
    * event 是结构类型的名称
    * {def payload(): String} 表示这个结构的具体定义：拥有一个无参，返回值为 String 的 payload 函数
    */deflisten(event: {defpayload(): String}) {
    // TODO
  }
}
复制代码
```

以前是只接受类型为 Event 的对象，现在是接受有  payload 函数定义的结构对象就可以了

```
// 编译通过
listener.listen(newInitEvent())
// 编译通过
listener.listen(newOldEvent())
复制代码
```

即使 OldEvent 里面的方法不止一个 payload 也是没问题的（结构的部分匹配）

```
classOldEvent{
  
  defpayload(): String = {}
  
  defsomeOtherMehod= {}

}

// 编译通过
listener.listen(newOldEvent())
复制代码
```

正是因为部分匹配的特性，结构化多态也经常被称之为类型安全的鸭子类型（[duck typing](https://en.wikipedia.org/wiki/Duck_typing) (target=undefined rel=undefined)）

## 最后

如果你还是为上面的概念而感到混乱，那么就忘了他们吧，只需要记住我们平常使用的函数重载、继承、泛型等都是多态的具体体现即可。

回到标题，现在你们都知道多态了，那么放心的去谈对象吧......

什么？没有对象，自己 new 一个呀（程序员老梗~）
