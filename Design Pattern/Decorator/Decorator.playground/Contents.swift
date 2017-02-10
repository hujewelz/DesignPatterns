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