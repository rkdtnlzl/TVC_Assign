//
//  ChattingRoomTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 6/3/24.
//

import UIKit

class ChattingRoomTableViewCell: UITableViewCell {

    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageBox: UIView!
    @IBOutlet var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setAutoLayout()
        
    }
    func setAutoLayout() {
        
        message.sizeToFit()
        message.lineBreakMode = .byWordWrapping
        message.numberOfLines = 0
    }
    
    func configure(_ data: Chat) {
        
        profileImageView.image = UIImage(named: data.user.profileImage)
        profileImageView.contentMode = .scaleAspectFit
        nameLabel.text = data.user.rawValue
        nameLabel.font = .boldSystemFont(ofSize: 17)
        message.text = data.message
        message.font = .systemFont(ofSize: 15)
        message.textColor = .darkGray
    }

    
}
