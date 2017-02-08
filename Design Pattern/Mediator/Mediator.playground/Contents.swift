//: Playground - noun: a place where people can play

import UIKit

enum Light {
  case red, green
}

protocol MediatorType {
  var colleagueA: ColleagueType { get set }
  var colleagueB: ColleagueType { get set }
  
  init(_ a: ColleagueType, _ b: ColleagueType)
  
  func aAffectB()
  func bAffectA()
}

protocol ColleagueType {
  var light: Light { get set }
  var color: UIColor { get }
  func changeLight(_ color: Light, withMediator am: MediatorType)
}

extension ColleagueType {
  var color: UIColor {
    switch light {
    case .red:
      return UIColor.red
    case .green:
      return UIColor.green
    }
  }
}

class TrafficLightA: ColleagueType {
  var light: Light = .red
  
  func changeLight(_ light: Light, withMediator am: MediatorType) {
    self.light = light
    self.light
    am.aAffectB()
  }
}

class TrafficLightB: ColleagueType {
  var light: Light = .green
  
  func changeLight(_ light: Light, withMediator am: MediatorType) {
    self.light = light
    am.bAffectA()
  }
}

class TrafficLightMediator: MediatorType {
  var colleagueA: ColleagueType
  var colleagueB: ColleagueType
  
  required init(_ a: ColleagueType, _ b: ColleagueType) {
    colleagueA = a
    colleagueB = b
  }
  
  //处理A对B的影响
  func aAffectB() {
    print("a affect b \(colleagueA.light)")
    switch colleagueA.light {
    case .red:
      colleagueB.light = .green
    case .green:
      colleagueB.light = .red
    }
  }
  
  //处理B对A的影响
  func bAffectA() {
    switch colleagueB.light {
    case .red:
      colleagueA.light = .green
    case .green:
      colleagueA.light = .red
    }
  }
}

var redLight = TrafficLightA()
var greenLight = TrafficLightB()
let am = TrafficLightMediator(redLight, greenLight)

redLight.changeLight(.green, withMediator: am)
//greenLight.changeLight(.red, withMediator: am)
redLight.color
greenLight.color




