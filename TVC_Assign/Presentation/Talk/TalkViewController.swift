//
//  TalkViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 6/2/24.
//

import UIKit

class TalkViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    let chatRoom = mockChatList.first { $0.chatroomId == 1 }
    
    var filteredList : [Chat] = []
    
    var isFiltering: Bool {
        return !(searchBar.text?.isEmpty ?? true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredList = chatRoom?.chatList ?? []
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        
        let nib = UINib(nibName: "ChattingListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChattingListTableViewCell")
    }
    
}

extension TalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredList.count : (chatRoom?.chatList.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingListTableViewCell", for: indexPath) as! ChattingListTableViewCell
        let chat = isFiltering ? filteredList[indexPath.row] : (chatRoom?.chatList[indexPath.row])!
        cell.configure(chat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let data = chatRoom?.chatList[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "ChattingRoomViewController") as! ChattingRoomViewController
        vc.filteredList = mockChatList[indexPath.row].chatList
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TalkViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let chatList = chatRoom?.chatList else { return }
        if searchText.isEmpty {
            filteredList = chatList
        } else {
            filteredList = chatList.filter { $0.user.rawValue.lowercased().contains(searchText.lowercased()) }
        }
        
        tableView.reloadData()
    }
}
