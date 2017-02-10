# 外观模式
**定义：**为子系统中的一组接口提供一个统一的接口。外观模式定义了一个更高层次的接口，这个接口使得这一子系统更加容易使用。<br>
**类型：**结构型模式。<br>
**类图** 

![类图](https://imgsa.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=2f609900f203738dca470470d272db34/902397dda144ad34cfe36127d4a20cf431ad8536.jpg)

## 外观模式的结构
从类图中看，外观模式主要有3个部分：
* **子系统类：**每个子系统定义了相关功能和模块的接口。
* **外观类：**整合子系统中的接口，客户端可以调用这个类的方法。
* **客户端：**通过外观类提供的接口和各个子系统的接口进行交互。
## 举例
```swift
import UIKit

class SubSystemA {
  func methodA() {
    print("子系统方法A")
  }
}

class SubSystemB {
  func methodB() {
    print("子系统方法B")
  }
}

class SubSystemC {
  func methodC() {
    print("子系统方法C")
  }
}

class SubSystemD {
  func methodD() {
    print("子系统方法D")
  }
}

class Facade {
  private let a = SubSystemA()
  private let b = SubSystemB()
  private let c = SubSystemC()
  private let d = SubSystemD()
  
  func doWorkA() {
    print("do wrok A")
    a.methodA()
    b.methodB()
    d.methodD()
  }
  
  func doWordB() {
    print("do wrok B")
    c.methodC()
    b.methodB()
    a.methodA()
  }
}

let facade = Facade()
facade.doWorkA()
facade.doWordB()
```
## 外观模式适用场景
1. 设计初期阶段，应该有意识的将不同层分离，层与层之间建立外观模式。
2. 开发阶段，子系统越来越复杂，增加外观模式提供一个简单的调用接口。
3. 维护一个大型遗留系统的时候，可能这个系统已经非常难以维护和扩展，但又包含非常重要的功能，为其开发一个外观类，以便新系统与其交互。

