//: Playground - noun: a place where people can play

import UIKit

protocol Cardable {
  // 输入
  var data: Any? { set get }
  
  // 输出
  func name() -> String?
  func phone() -> String?
}


class Card: UIView {
  var name: String? {
    didSet {
      nameLabel.text = name
    }
  }
  
  var phone: String? {
    didSet {
      phoneLabel.text = phone
    }
  }
  
  private var nameLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont.systemFont(ofSize: 20)
    l.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    return l
  }()
  
  private var phoneLabel: UILabel = {
    let l = UILabel()
    l.font = UIFont.systemFont(ofSize: 14)
    l.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    return l
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(nameLabel)
    addSubview(phoneLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    nameLabel.frame = CGRect(x: 8, y: 8, width: frame.width-16, height: 30)
    phoneLabel.frame = CGRect(x: 8, y: frame.height-38, width: frame.width-16, height: 30)
    
  }
  
  func configView(with data: Cardable) {
    name = data.name()
    phone = data.phone()
  }
  
}

let card = Card(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
card.backgroundColor = UIColor.red
// 传统直接赋值方式
card.name = "Huluobo"
card.phone = "010 - 2344 - 3445"

struct Model {
  var name: String?
  var phone: String?
}

// 类适配器
class NewCardAdapter: Cardable {
  var data: Any?

  func phone() -> String? {
    let model = data as! Model
    return model.phone
  }

  func name() -> String? {
    let model = data as! Model
    return model.name
  }

  init(with data: Any?) {
    self.data = data
  }
  
}

struct NewModel {
  var name: String?
  var phone: Int
}

// 对象适配器
class CardAdapter: Cardable {
  var data: Any?
  
  func phone() -> String? {
    if data is Model {
      let model = data as! Model
      return model.phone
    }
    else if data is NewModel {
      let model = data as! NewModel
      return "📞: \(model.phone)"
    }
    return nil
  }
  
  func name() -> String? {
    if data is Model {
      let model = data as! Model
      return model.name
    }
    else if data is NewModel {
      let model = data as! NewModel
      guard let name = model.name else {
        return "☹️"
      }
      return name
    }
    return nil
  }
  
  init(with data: Any?) {
    self.data = data
  }
}

let aCardAdapter = NewCardAdapter(with: Model(name: "Hu Jewelz", phone: "134 - 5675 - 6787"))
card.configView(with: aCardAdapter)

let cardAdapter = CardAdapter(with: NewModel(name: nil, phone: 1234567897))
card.configView(with: cardAdapter)


