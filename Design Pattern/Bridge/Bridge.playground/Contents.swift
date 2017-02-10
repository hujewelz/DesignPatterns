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