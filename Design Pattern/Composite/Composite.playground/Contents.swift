//: Playground - noun: a place where people can play

import UIKit

class Node {
  private var leftNode: Node?
  private var rightNode: Node?
  private var nodeName: String?
  
  init(withName name: String) {
    nodeName = name
  }
  
  func insertNode(_ node: Node) {
    if leftNode == nil {
      leftNode = node
      return
    }
    
    if rightNode == nil {
      rightNode = node
      return
    }
    
    insertNode(leftNode!)
    
  }
  
  func printTree() {
    printTree(withTree: self)
  }
  
  func printTree(withTree tree: Node) {
    if let left = tree.leftNode {
      printTree(withTree: left)
    }
    if let right = tree.rightNode {
      printTree(withTree: right)
    }
    print("\(tree.nodeName!)")
  }
  
}

let tree = Node(withName: "A")
let bTree = Node(withName: "B")
bTree.insertNode(Node(withName: "D"))
tree.insertNode(bTree)
tree.insertNode(Node(withName: "C"))
tree.printTree()
