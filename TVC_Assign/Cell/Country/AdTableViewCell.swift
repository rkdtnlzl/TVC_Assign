//
//  AdTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigure()
        backgroundColor = .systemPink
    }
    
    func setConfigure() {
        adLabel.font = .boldSystemFont(ofSize: 17)
    }
    
}
