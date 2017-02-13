# 组合模式
**定义：**将对象组合成树形结构以表示“部分整体”的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。<br>
**类型：**结构型模式。<br>
**类图** 

![类图](https://imgsa.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=14709b4c5db5c9ea76fe0bb1b450dd65/c8177f3e6709c93d5024a3b0993df8dcd00054a6.jpg)

## 组合模式的结构
从类图中看，外观模式主要有3个部分：
* **Component：** 是组合中的对象声明接口，在适当的情况下，实现所有类共有接口的默认行为。声明一个接口用于访问和管理Component子部件。
* **Leaf：** 在组合中表示叶子结点对象，叶子结点没有子结点。
* **Composite：** 定义有枝节点行为，用来存储子部件，在Component接口中实现与子部件有关操作，如增加(add)和删除(remove)等。

## 代码示例
```swift
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
```
## 组合模式的特点
组合模式，将对象组合成树形结构以表示“部分-整体”的层次结构，组合模式使得用户对单个对象和组合对象的使用具有一致性。
有时候又叫做部分-整体模式，它使我们树型结构的问题中，模糊了简单元素和复杂元素的概念，客户程序可以像处理简单元素一样来处理复杂元素,从而使得客户程序与复杂元素的内部结构解耦。
组合模式让你可以优化处理递归或分级数据结构。有许多关于分级数据结构的例子，使得组合模式非常有用武之地。关于分级数据结构的一个普遍性的例子是你每次使用电脑时所遇到的:文件系统。文件系统由目录和文件组成。每个目录都可以装内容。目录的内容可以是文件，也可以是目录。按照这种方式，计算机的文件系统就是以递归结构来组织的。如果你想要描述这样的数据结构，那么你可以使用组合模式Composite。
## 适用场景
以下情况下适用Composite模式：
1．你想表示对象的部分-整体层次结构
2．你希望用户忽略组合对象与单个对象的不同，用户将统一地使用组合结构中的所有对象。


