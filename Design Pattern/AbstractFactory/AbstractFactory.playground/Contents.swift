

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

struct XiaoMi: Phone {
  func printInfo() {
    print("xiao mi")
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

struct FSK: Factory {
  func createPhone() -> Phone {
    return IPhone()
  }
  
  func createWatch() -> Watch {
    return IWatch()
  }
}

struct OtherF: Factory {
  func createPhone() -> Phone {
    return XiaoMi()
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
      return OtherF()
    case .iOS:
      return FSK()
    }
  }
}

let factory = FSK()
factory.createPhone()
factory.createWatch()

FactoryManager.factory(with: .android).createPhone()
FactoryManager.factory(with: .iOS).createPhone()
FactoryManager.factory(with: .android).createWatch()
FactoryManager.factory(with: .iOS).createWatch()
