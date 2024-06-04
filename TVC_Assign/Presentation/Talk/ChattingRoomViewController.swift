//
//  ChattingRoomViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 6/3/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxKeyboard
import SnapKit

class ChattingRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    
    var filteredList : [Chat] = []
    var chatRoomNumber = 0
    
    var textfieldConstraint: NSLayoutConstraint?
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChattingRoomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChattingRoomTableViewCell")
        
        setTableView()
        
        chatTextField.backgroundColor = .yellow
        
        RxKeyboard.instance.visibleHeight
            .skip(1)
            .drive(onNext: { keyboardVisibleHeight in
                self.chatTextField.snp.updateConstraints {
                    $0.bottom.equalTo(self.view).inset(keyboardVisibleHeight)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingRoomTableViewCell", for: indexPath) as! ChattingRoomTableViewCell
        let chat =  filteredList[indexPath.row]
        cell.configure(chat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
}
