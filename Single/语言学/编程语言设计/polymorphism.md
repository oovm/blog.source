
# 多态

标签（空格分隔）： 未分类

---

## 前言

封装、继承、多态作为 OOP 世界的老三样，几乎是必背的关键词。

而在刚学习 Java 的很长一段时间，我对多态的理解一直处理很迷糊的状态，重载是多态吗？泛型是多态吗？继承关系是多态吗？

实际上都是，无论重载、泛型，还是继承关系都是多态的一个具体体现，也被归属为不同的多态分类

- Ad hoc polymorphism（特定多态，也译作特设多态）
- Parametric polymorphism（参数化多态）
- Subtyping（子类型多态）

当然不止上面三种分类，像 Scala 就还有另外一种多态分类

- Row polymorphism（行多态）

别被这些名词概念唬住，下面我们就通过代码实例来一一过一遍。

## Ad-hoc Polymorphism

**特设多态**是由 [Christopher Strachey](https://en.wikipedia.org/wiki/Christopher_Strachey) 在 1967 年提出来的，从它的取名我们可以大概猜到，它是针对于特定问题的多态方案，比如：

- 函数重载
- 操作符重载

**函数重载**指的是多个函数拥有相同的名称，但却拥有不同的实现。

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

## 参考

1. [Polymorphism (computer science)](https://en.wikipedia.org/wiki/Polymorphism_(computer_science)) (target=undefined rel=undefined)
2. [Ad_hoc_polymorphism](https://en.wikipedia.org/wiki/Ad_hoc_polymorphism) (target=undefined rel=undefined)
3. [Parametric polymorphism](https://en.wikipedia.org/wiki/Parametric_polymorphism) (target=undefined rel=undefined)
4. [Subtyping](https://en.wikipedia.org/wiki/Subtyping) (target=undefined rel=undefined)
5. [Row polymorphism](https://en.wikipedia.org/wiki/Row_polymorphism) (target=undefined rel=undefined)
6. [nominative type system](https://en.wikipedia.org/wiki/Nominal_type_system) (target=undefined rel=undefined)
7. [structural type system](https://en.wikipedia.org/wiki/Structural_type_system) (target=undefined rel=undefined)



