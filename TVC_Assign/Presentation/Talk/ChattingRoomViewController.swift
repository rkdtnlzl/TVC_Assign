//
//  ChattingRoomViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 6/3/24.
//

import UIKit

class ChattingRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var filteredList : [Chat] = []
    var chatRoomNumber = 0
    
    lazy var chatRoom = mockChatList.first { $0.chatroomId ==  chatRoomNumber}

    override func viewDidLoad() {
        super.viewDidLoad()

        filteredList = chatRoom?.chatList ?? []
        
        let nib = UINib(nibName: "ChattingRoomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChattingRoomTableViewCell")
        
        setTableView()
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
        cell
        return cell
    }
}
