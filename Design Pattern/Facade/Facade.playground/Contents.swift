import UIKit

class SubSystemA {

  func methodA() {
    print("子系统方法A")
  }
}

class SubSystemB {
  
  func methodB() {
    print("子系统方法B")
  }
}

class SubSystemC {
  
  func methodC() {
    print("子系统方法C")
  }
}

class SubSystemD {
  
  func methodD() {
    print("子系统方法D")
  }
}

class Facade {
  private let a = SubSystemA()
  private let b = SubSystemB()
  private let c = SubSystemC()
  private let d = SubSystemD()
  
  func doWorkA() {
    print("do wrok A")
    a.methodA()
    b.methodB()
    d.methodD()
  }
  
  func doWordB() {
    print("do wrok B")
    c.methodC()
    b.methodB()
    a.methodA()
  }
}

let facade = Facade()
facade.doWorkA()
facade.doWordB()
