//: # 建造者模式
//: ###### 定义  
//: 将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。
//: ###### 类型
//: 创建型模式。
//: ###### 类图
//: [类图](http://wiki.jikexueyuan.com/project/java-design-pattern/images/builder-pattern-1.jpg)
//: ###### 四个要素
//: * **产品类**：一般是一个较为复杂的对象，也就是说创建对象的过程比较复杂，一般会有比较多的代码量。在本类图中，产品类是一个具体的类，而非抽象类。实际编程中，产品类可以是由一个抽象类与它的不同实现组成，也可以是由多个抽象类与他们的实现组成。
//: * 抽象建造者：引入抽象建造者的目的，是为了将建造的具体过程交与它的子类来实现。这样更容易扩展。一般至少会有两个抽象方法，一个用来建造产品，一个是用来返回产品。
//: * 建造者：实现抽象类的所有未实现的方法，具体来说一般是两项任务：组建产品；返回组建好的产品。
//: * 导演类：负责调用适当的建造者来组建产品，导演类一般不与产品类发生依赖关系，与导演类直接交互的是建造者类。一般来说，导演类被用来封装程序中易变的部分。
//: ###### 建造者模式的优点
//: 首先，建造者模式的封装性很好。使用建造者模式可以有效的封装变化，在使用建造者模式的场景中，一般产品类和建造者类是比较稳定的，因此，将主要的业务逻辑封装在导演类中对整体而言可以取得比较好的稳定性。其次，建造者模式很容易进行扩展。如果有新的需求，通过实现一个新的建造者类就可以完成，基本上不用修改之前已经测试通过的代码，因此也就不会对原有功能引入风险。


import Foundation

class Product: NSObject {
  private var name: String
  private var type: String
  
  init(name: String, type: String) {
    self.name = name
    self.type = type
  }
  
  func showProduct() {
    print("名称：\(name), 类型：\(type)")
  }
}

protocol Builder {
  func createProduct(name: String, type: String) -> Product
}

class ConcreteBuilder: Builder {
  func createProduct(name: String, type: String) -> Product {
    return Product(name: name, type: type)
  }
}

class Director {
  let builder = ConcreteBuilder()
  
  func getAProcuct() -> Product{
    return builder.createProduct(name: "宝马汽车", type: "X7")
  }
  
  func getBProcuct() -> Product{
    return builder.createProduct(name: "奥迪汽车", type: "Q5")
  }
}

let director = Director()
let pA = director.getAProcuct()
pA.showProduct()

let pB = director.getBProcuct()
pB.showProduct()

