//: Playground - noun: a place where people can play

import UIKit

protocol Command {
  var receiver: Receiver? { get set }
  init(with receiver: Receiver)
  func execute()
}

class Invoker {
  // 保存所有的命令
  private var commands: [Command] = []
  
  // 添加并执行命令
  func executeCommand(_ command: Command) {
    self.commands.append(command)
    command.execute()
  }
  
  // 回滚
  func rollback() {
    let last: Command? = self.commands.popLast()
    last?.execute()
  }
 
}

// 知道如何实施与执行一个请求相关的操作
class Receiver {
  
  func doSomething1() {
    print("接受者-业务逻辑处理 1")
  }
  
  func doSomething2() {
    print("接受者-业务逻辑处理 2")
  }
}

class ConcreteCommand1: Command {
  var receiver: Receiver?
  func execute() {
    receiver?.doSomething1()
  }
  
  required init(with receiver: Receiver) {
    self.receiver = receiver
  }
}

class ConcreteCommand2: Command {
  var receiver: Receiver?
  func execute() {
    receiver?.doSomething2()
  }
  
  required init(with receiver: Receiver) {
    self.receiver = receiver
  }
}

let receiver = Receiver()
let invoker = Invoker()
invoker.executeCommand(ConcreteCommand1(with: receiver))

invoker.executeCommand(ConcreteCommand2(with: receiver))

invoker.rollback()
invoker.rollback()

