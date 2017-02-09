# 中介者模式
**定义：**用一个中介者对象封装一系列的对象交互，中介者使各对象不需要显示地相互作用，从而使耦合松散，而且可以独立地改变它们之间的交互。<br>
**类型：**行为类模式<br>
**类图** <br>

![类图](http://wiki.jikexueyuan.com/project/java-design-pattern/images/mediator-pattern-1.jpg)

## 中介者模式的结构
中介者模式又称为调停者模式，从类图中看，共分为3部分：
* **抽象中介者：**定义好同事类对象到中介者对象的接口，用于各个同事类之间的通信。一般包括一个或几个抽象的事件方法，并由子类去实现。
* **中介者实现类：**从抽象中介者继承而来，实现抽象中介者中定义的事件方法。从一个同事类接收消息，然后通过消息影响其他同时类。
* **同事类：**如果一个对象会影响其他的对象，同时也会被其他对象影响，那么这两个对象称为同事类。在类图中，同事类只有一个，这其实是现实的省略，在实际应用中，同事类一般由多个组成，他们之间相互影响，相互依赖。同事类越多，关系越复杂。并且，同事类也可以表现为继承了同一个抽象类的一组实现组成。在中介者模式中，同事类之间必须通过中介者才能进行消息传递。
## 为什么要使用中介者模式
一般来说，同事类之间的关系是比较复杂的，多个同事类之间互相关联时，他们之间的关系会呈现为复杂的网状结构，这是一种过度耦合的架构，即不利于类的复用，也不稳定。例如在下图中，有六个同事类对象，假如对象1发生变化，那么将会有4个对象受到影响。如果对象2发生变化，那么将会有5个对象受到影响。也就是说，同事类之间直接关联的设计是不好的。

![](http://wiki.jikexueyuan.com/project/java-design-pattern/images/mediator-pattern-2.jpg)

如果引入中介者模式，那么同事类之间的关系将变为星型结构，从图中可以看到，任何一个类的变动，只会影响的类本身，以及中介者，这样就减小了系统的耦合。一个好的设计，必定不会把所有的对象关系处理逻辑封装在本类中，而是使用一个专门的类来管理那些不属于自己的行为。

![](http://wiki.jikexueyuan.com/project/java-design-pattern/images/mediator-pattern-3.jpg)

我们使用一个例子来说明一下什么是同事类：十字路口有两个交通灯A和B，当A变为红色时，B变为绿色，B变为绿色时，A变为红色，就称为同事类。代码如下：
```swift
enum Light {
  case red, green
}

protocol MediatorType {
  var colleagueA: ColleagueType { get set }
  var colleagueB: ColleagueType { get set }
  
  init(_ a: ColleagueType, _ b: ColleagueType)
  
  func aAffectB()
  func bAffectA()
}

protocol ColleagueType {
  var light: Light { get set }
  var color: UIColor { get }
  func changeLight(to light: Light, withMediator am: MediatorType)
}

extension ColleagueType {
  var color: UIColor {
    switch light {
    case .red:
      return UIColor.red
    case .green:
      return UIColor.green
    }
  }
}

class TrafficLightA: ColleagueType {
  var light: Light = .red
  
  func changeLight(to light: Light, withMediator am: MediatorType) {
    self.light = light
    am.aAffectB()
  }
}

class TrafficLightB: ColleagueType {
  var light: Light = .green
  
  func changeLight(to light: Light, withMediator am: MediatorType) {
    self.light = light
    am.bAffectA()
  }
}

class TrafficLightMediator: MediatorType {
  var colleagueA: ColleagueType
  var colleagueB: ColleagueType
  
  required init(_ a: ColleagueType, _ b: ColleagueType) {
    colleagueA = a
    colleagueB = b
  }
  
  //处理A对B的影响
  func aAffectB() {
    switch colleagueA.light {
    case .red:
      colleagueB.light = .green
    case .green:
      colleagueB.light = .red
    }
  }
  
  //处理B对A的影响
  func bAffectA() {
    switch colleagueB.light {
    case .red:
      colleagueA.light = .green
    case .green:
      colleagueA.light = .red
    }
  }
}

var redLight = TrafficLightA()
var greenLight = TrafficLightB()
let am = TrafficLightMediator(redLight, greenLight)

redLight.changeLight(to: .green, withMediator: am)
redLight.color
greenLight.color
```
运行结果如下<br>
![](https://github.com/hujewelz/DesignPatterns/blob/master/resource/mediator.png)
## 中介者模式的优点
* 适当地使用中介者模式可以避免同事类之间的过度耦合，使得各同事类之间可以相对独立地使用。
* 使用中介者模式可以将对象间一对多的关联转变为一对一的关联，使对象间的关系易于理解和维护。
* 使用中介者模式可以将对象的行为和协作进行抽象，能够比较灵活的处理对象间的相互作用。

## 适用场景
在面向对象编程中，一个类必然会与其他的类发生依赖关系，完全独立的类是没有意义的。一个类同时依赖多个类的情况也相当普遍，既然存在这样的情况，说明，一对多的依赖关系有它的合理性，适当的使用中介者模式可以使原本凌乱的对象关系清晰，但是如果滥用，则可能会带来反的效果。一般来说，*只有对于那种同事类之间是网状结构的关系，才会考虑使用中介者模式。可以将网状结构变为星状结构，使同事类之间的关系变的清晰一些。*
中介者模式是一种比较常用的模式，也是一种比较容易被滥用的模式。对于大多数的情况，同事类之间的关系不会复杂到混乱不堪的网状结构，因此，大多数情况下，将对象间的依赖关系封装的同事类内部就可以的，没有必要非引入中介者模式。滥用中介者模式，只会让事情变的更复杂。


