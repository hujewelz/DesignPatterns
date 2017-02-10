# 桥接模式
**定义：**将抽象部分与它的实现部分分离，使它们都可以独立地变化。<br>
**类型：**结构型模式。<br>
**类图** 

![类图](https://imgsa.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=63068dbf90529822113e3191b6a310ae/b2de9c82d158ccbf49a4044219d8bc3eb13541a9.jpg)

## 外观模式的结构
从类图中看，外观模式主要有4个部分：
* **抽象化(Abstraction)：**抽象化给出的定义，并保存一个对实现化对象的引用。
* **修正抽象化(Refined Abstraction)：**扩展抽象化角色，改变和修正父类对抽象化的定义。
* **实现化(Implementor)：**这个角色给出实现化角色的接口，但不给出具体的实现。必须指出的是，这个接口不一定和抽象化角色的接口定义相同，实际上，这两个接口可以非常不一样。实现化角色应当只给出底层操作，而抽象化角色应当只给出基于底层操作的更高一层的操作。
* **具体实现化(Concrete Implementor)：**这个角色给出实现化角色接口的具体实现。

##示例
```swift
import UIKit

protocol Implementor {
  func operation()
}

protocol Abstraction {
  var implementor: Implementor? { get set }
  
  func operation()
}

extension Abstraction {
  func operation() {
    implementor?.operation()
  }
}

class ConcreteImplementorA: Implementor {
  func operation() {
    print("ConcreteImplementorA的实现")
  }
}

class ConcreteImplementorB: Implementor {
  func operation() {
    print("ConcreteImplementorB的实现")
  }
}

class RefinedAbstraction: Abstraction {

  var implementor: Implementor?

}

let ab = RefinedAbstraction()
ab.implementor = ConcreteImplementorA()
ab.operation()

ab.implementor = ConcreteImplementorB()
ab.operation()
```

