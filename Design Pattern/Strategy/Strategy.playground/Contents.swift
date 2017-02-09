//: Playground - noun: a place where people can play

import UIKit

protocol Facedable {
  var face: UIView { set get }
  func drawFace()
}

class Face: Facedable {
  var face: UIView = {
    let f = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    f.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    f.layer.cornerRadius = 100
    return f
  }()
  
  func drawFace() {
  }
}

class Happy: Face {
  
  override func drawFace() {
    let eyeY = face.frame.height/4+10
    let eye1 = CALayer()
    eye1.bounds = CGRect(x: 0, y: 0, width: 50, height: 4)
    eye1.position = CGPoint(x: face.frame.width/4, y: eyeY)
    eye1.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    
    let eye2 = CALayer()
    eye2.bounds = CGRect(x: 0, y: 0, width: 50, height: 4)
    eye2.position = CGPoint(x: face.frame.width/4*3, y: eyeY)
    eye2.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    
    let mouth = CAShapeLayer()
    mouth.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
    mouth.position = CGPoint(x: face.center.x, y: face.center.y)
    mouth.lineWidth = 4
    mouth.fillColor = UIColor.clear.cgColor
    mouth.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    let path = UIBezierPath(arcCenter: CGPoint(x: 60,y: 60.0), radius: 60, startAngle: CGFloat.pi/4, endAngle: CGFloat.pi*3/4, clockwise: true)
    mouth.path = path.cgPath
    
    face.layer.addSublayer(eye1)
    face.layer.addSublayer(eye2)
    face.layer.addSublayer(mouth)
  }
}

class Sad: Face {
  
  override func drawFace() {
    let eyeY = face.frame.height/4+10
    let eye1 = CALayer()
    eye1.bounds = CGRect(x: 0, y: 0, width: 50, height: 4)
    eye1.position = CGPoint(x: face.frame.width/4, y: eyeY)
    eye1.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    
    let eye2 = CALayer()
    eye2.bounds = CGRect(x: 0, y: 0, width: 50, height: 4)
    eye2.position = CGPoint(x: face.frame.width/4*3, y: eyeY)
    eye2.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    
    let mouth = CAShapeLayer()
    mouth.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
    mouth.position = CGPoint(x: face.center.x, y: face.frame.height)
    mouth.lineWidth = 4
    mouth.fillColor = UIColor.clear.cgColor
    mouth.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    let path = UIBezierPath(arcCenter: CGPoint(x: 60,y: 60.0), radius: 60, startAngle: -CGFloat.pi/4, endAngle: -CGFloat.pi*3/4, clockwise: false)
    mouth.path = path.cgPath
    
    face.layer.addSublayer(eye1)
    face.layer.addSublayer(eye2)
    face.layer.addSublayer(mouth)
  }
}

class Context: UIView {
  var face: Facedable?
  
  convenience init(face: Facedable) {
    self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    self.face = face
  }
  
  func render() {
    face?.drawFace()
    guard let face = face?.face else {
      return
    }
    addSubview(face)
  }
}

let c1 = Context(face: Happy())
c1.render()


let c2 = Context(face: Sad())
c2.render()
