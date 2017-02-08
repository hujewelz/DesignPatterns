
import UIKit

protocol Phone {
  func printInfo()
}

protocol Watch {
  func printInfo()
}

struct IPhone: Phone {
  func printInfo() {
    print("iphone")
  }
}

struct AndroidPhone: Phone {
  func printInfo() {
    print("android phone")
  }
}

struct IWatch: Watch {
  func printInfo() {
    print("iwatch")
  }
}

struct AndroidWear: Watch {
  func printInfo() {
    print("android wear")
  }
}

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

let factory = AppleFactory()
factory.createPhone()
factory.createWatch()

FactoryManager.factory(with: .android).createPhone().printInfo()
FactoryManager.factory(with: .iOS).createPhone().printInfo()
FactoryManager.factory(with: .android).createWatch().printInfo()
FactoryManager.factory(with: .iOS).createWatch().printInfo()
