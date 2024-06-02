//
//  ChattingListTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 6/2/24.
//

import UIKit

class ChattingListTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configure(_ data: Chat) {
        profileImageView.image = UIImage(named: data.user.profileImage)
        profileImageView.contentMode = .scaleAspectFit
        userNameLabel.text = data.user.rawValue
        userNameLabel.font = .boldSystemFont(ofSize: 17)
        messageLabel.text = data.message
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.textColor = .darkGray
        dateLabel.text = formatDate(data.date)
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .gray
    }
    
    private func formatDate(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yy.MM.dd"
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            return dateString
        }
    }
    
}
