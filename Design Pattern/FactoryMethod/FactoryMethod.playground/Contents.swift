//: Playground - noun: a place where people can play

import Cocoa

protocol ProductionType {
  func printInfo()
}

struct Car3: ProductionType {
  func printInfo() {
    print("3个轮子的汽车")
  }
}

struct Car4: ProductionType {
  func printInfo() {
    print("4个轮子的汽车")
  }
}

//: 简单工厂

class CarFactory {
  static func createCar(withWheel count: Int) -> ProductionType {
    switch count {
    case 3:
      return Car3()
    default:
      return Car4()
    }
  }
}

CarFactory.createCar(withWheel: 3).printInfo()

//: 工厂方法

protocol FactoryType {
  func createCar() -> ProductionType
}

class Car3Factory: FactoryType {
  func createCar() -> ProductionType {
    return Car3()
  }
}

class Car4Factory: FactoryType {
  func createCar() -> ProductionType {
    return Car4()
  }
}

Car3Factory().createCar().printInfo()
Car4Factory().createCar().printInfo()

