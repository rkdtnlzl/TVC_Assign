//
//  ShoppingTableViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/24/24.
//

import UIKit

struct Shopping {
    var checked : Bool
    let name : String
    var liked : Bool
}

class ShoppingTableViewController: UITableViewController {

    var list = [Shopping(checked: true, name: "그립톡 구매하기", liked: false),
                Shopping(checked: false, name: "사이다 구매", liked: false),
                Shopping(checked: false, name: "과자 사기", liked: true),
                Shopping(checked: false, name: "양말", liked: false),
                ]
    
    
    @IBOutlet var shoppingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setConfigure()
    }
    
    func setConfigure() {
        shoppingTextField.backgroundColor = .systemGray6
        
        addButton.backgroundColor = .systemGray3
        addButton.layer.cornerRadius = 10
        addButton.tintColor = .black
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemGray6
        
        let data = list[indexPath.row]
        
        cell.nameLabel.text = data.name
        cell.nameLabel.font = .systemFont(ofSize: 13)
        
        let check = data.checked ? "checkmark.square.fill" : "checkmark.square"
        let imageName = UIImage(systemName: check)
        cell.checkButton.setImage(imageName, for: .normal)
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)

        let name = data.liked ? "star.fill" : "star"
        let image = UIImage(systemName: name)
        cell.likeButton.setImage(image, for: .normal)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
        
        list[sender.tag].checked.toggle()
        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        print(#function)
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        
        list[sender.tag].liked.toggle() //true면 false로, false면 true로 바꿈
        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        print("클릭됨")
        // 추가 버튼을 눌렀을 때도 키보드 사라지게하기
        self.view.endEditing(true)
        
        guard let text = shoppingTextField.text, text.count > 1 else {
            print("두 글자 이상 입력하세요")
            return
        }
        let addList = Shopping(checked: false, name: text, liked: false)
        list.append(addList)
        
        tableView.reloadData()
        
        shoppingTextField.text = ""
    }
    

}
