//: Playground - noun: a place where people can play

import Cocoa

//: 简单工厂

protocol OperateAble {
  var numberA: Double { get set }
  var numberB: Double { get set }
  
  init(_ first: Double, _ second: Double)
  func getResult() -> Double
}

//: MARK - 加法
class OperatorHAdd: OperateAble {
  var numberB: Double = 0.0
  
  var numberA: Double = 0.0
  
  required init(_ first: Double, _ second: Double) {
    numberA = first
    numberB = second
  }
  
  func getResult() -> Double {
    return numberA + numberB
  }
  
}

//: MARK - 减法
class OperatorHSub: OperateAble {
  var numberB: Double = 0.0
  
  var numberA: Double = 0.0
  
  required init(_ first: Double, _ second: Double) {
    numberA = first
    numberB = second
  }
  
  func getResult() -> Double {
    return numberA - numberB
  }
  
}



class OperationFactor {
  enum Operator {
    case add, sub
  }
  
  class func createOperator(op: Operator, _ first: Double, _ second: Double) -> OperateAble {
    var o: OperateAble!
    switch op {
    case .add:
      o = OperatorHAdd(first, second)
    case .sub:
      o = OperatorHSub(first, second)
    }
    return o
  }
}

let addOp = OperationFactor.createOperator(op: .add, 2, 3)
addOp.getResult()
let subOp = OperationFactor.createOperator(op: .sub, 2, 3)
subOp.getResult()


//: 工厂方法

protocol FactoryType {
  func createOperation(_ first: Double, _ second: Double) -> OperateAble
}

class AddFactory: FactoryType {
  
  func createOperation(_ first: Double, _ second: Double) -> OperateAble {
    return OperatorHAdd(first,second)
  }
}

class SubFactory: FactoryType {
  func createOperation(_ first: Double, _ second: Double) -> OperateAble {
    return OperatorHSub(first, second)
  }
}

let factory = AddFactory()
factory.createOperation(2, 3).getResult()





























