import UIKit

protocol Phone {
  func call()
}

protocol Watch {
  func showTime()
}

struct IPhone: Phone {
  func call() {
    print("iphone call")
  }
}

struct AndroidPhone: Phone {
  func call() {
    print("android phone call")
  }
}

struct IWatch: Watch {
  func showTime() {
    print("iwatch show time")
  }
}

struct AndroidWear: Watch {
  func showTime() {
    print("android wear show time")
  }
}

/// 抽象工厂接口, 生产不同等级的产品
protocol Factory {
  func createPhone() -> Phone
  func createWatch() -> Watch
}

struct AppleFactory: Factory {
  func createPhone() -> Phone {
    return IPhone()
  }
  
  func createWatch() -> Watch {
    return IWatch()
  }
}

struct AndroidFactory: Factory {
  func createPhone() -> Phone {
    return AndroidPhone()
  }
  
  func createWatch() -> Watch {
    return AndroidWear()
  }
}

struct FactoryManager {
  enum ProductType {
    case iOS, android
  }
  
  static func factory(with type: ProductType) -> Factory {
    switch type {
    case .android:
      return AndroidFactory()
    case .iOS:
      return AppleFactory()
    }
  }
}

FactoryManager.factory(with: .android).createPhone().call()
FactoryManager.factory(with: .iOS).createPhone().call()
FactoryManager.factory(with: .android).createWatch().showTime()
FactoryManager.factory(with: .iOS).createWatch().showTime()
