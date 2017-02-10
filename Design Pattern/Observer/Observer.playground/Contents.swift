//: Playground - noun: a place where people can play

import UIKit

protocol Observable: class {
  func update()
}

protocol Subjectable {
  func addObserver(_ observer: Observable)
  func removeObserver(_ observer: Observable)
  
  func notify()
}

class SubscriptionCenter: Subjectable {
  internal func notify() {
    for observer in observers {
      (observer as? Observable)?.update()
    }
  }

  internal func removeObserver(_ observer: Observable) {
    observers.remove(observer)
  }

  internal func addObserver(_ observer: Observable) {
    if observers.contains(observer) {
      return
    }
    observers.add(observer)
  }
  var observers = NSMutableArray()

}

class Observer1: Observable {
  internal func update() {
    print("观察者1收到信息，并进行处理。")
  }
}

class Observer2: Observable {
  internal func update() {
    print("观察者2收到信息，并进行处理。")
  }
}

let sub = SubscriptionCenter()
sub.addObserver(Observer1())
sub.addObserver(Observer2())
sub.notify()
