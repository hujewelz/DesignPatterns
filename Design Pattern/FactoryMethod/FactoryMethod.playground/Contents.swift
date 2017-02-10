//: Playground - noun: a place where people can play

import Cocoa

protocol CarType {
  func carDrive()
}

struct Car3: CarType {
  func carDrive() {
    print("开着3个轮子的汽车")
  }
}

struct Car4: CarType {
  func carDrive() {
    print("开着4个轮子的汽车")
  }
}

//: 简单工厂

class CarFactory {
  static func createCar(withWheel count: Int) -> CarType {
    switch count {
    case 3:
      return Car3()
    default:
      return Car4()
    }
  }
}

CarFactory.createCar(withWheel: 3).carDrive()

//: 工厂方法

protocol FactoryType {
  func createCar() -> CarType
}

class Car3Factory: FactoryType {
  func createCar() -> CarType {
    return Car3()
  }
}

class Car4Factory: FactoryType {
  func createCar() -> CarType {
    return Car4()
  }
}

Car3Factory().createCar().carDrive()
Car4Factory().createCar().carDrive()

