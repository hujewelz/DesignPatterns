# 装饰模式
**定义：**在不必改变原类文件和使用继承的情况下，动态地扩展一个对象的功能。它是通过创建一个包装对象，也就是装饰来包裹真实的对象。<br>
**类型：**结构型模式。<br>
**类图** 

![类图](https://imgsa.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=a9a2d014708b4710da22f59ea2a7a898/a1ec08fa513d26974aed206857fbb2fb4316d8cc.jpg)

## 外观模式的结构
从类图中看，外观模式主要有4个部分：
* **Component：**定义一个对象接口，可以给这些对象动态地添加职责。
* **ConcreteComponent：**定义了一个具体的对象，也可以给这些对象动态地添加职责。
* **Decorator：**装饰抽象类，继承了Component，从外类来拓展Component类的功能，对于Component来说，是无需知道Decorator的存在。
* **ConcreteDecorator：**具体的装饰对象，起到给Component添加职责的功能。

##示例
```swift
import UIKit

protocol Component {
  func operation()
}

class ConcreteComponent: Component {
  func operation() {
    print("具体对象的操作")
  }
}

class Decorator: Component {
  internal func operation() {
    component?.operation()
  }

  var component: Component?
  
}

class DecoratorA: Decorator {
  override func operation() {
    super.operation()
    print("装饰a做自己的操作")
  }
}

class DecoratorB: Decorator {
  override func operation() {
    super.operation()
    print("装饰b做自己的操作🚙")
  }
}

let component = ConcreteComponent()
let d1 = DecoratorA()
let d2 = DecoratorB()

d1.component = component
d2.component = d1
d2.operation()
```
## 装饰模式的特点
1. 装饰对象和真实对象有相同的接口。这样客户端对象就能以和真实对象相同的方式和装饰对象交互。
2. 装饰对象包含一个真实对象的引用。
3. 装饰对象接受所有来自客户端的请求。它把这些请求转发给真实的对象。
4. 装饰对象可以在转发这些请求以前或以后增加一些附加功能。这样就确保了在运行时，不用修改给定对象的结构就可以在外部增加附加的功能。在面向对象的设计中，通常是通过继承来实现对给定类的功能扩展。

## 适用场景
以下情况使用Decorator模式
1. 需要扩展一个类的功能，或给一个类添加附加职责。
2. 需要动态的给一个对象添加功能，这些功能可以再动态的撤销。
3. 需要增加由一些基本功能的排列组合而产生的非常大量的功能，从而使继承关系变的不现实。
4. 当不能采用生成子类的方法进行扩充时。一种情况是，可能有大量独立的扩展，为支持每一种组合将产生大量的子类，使得子类数目呈爆炸性增长。另一种情况可能是因为类定义被隐藏，或类定义不能用于生成子类。

