//
//  CountryTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/27/24.
//

import UIKit
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    @IBOutlet var countryImageView: UIImageView!
    @IBOutlet var loveButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigure()
    }
    
    func setConfigure() {
        titleLabel.font = .boldSystemFont(ofSize: 17)
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = .lightGray
        countryImageView.backgroundColor = .gray
        countryImageView.layer.cornerRadius = 10
        countryImageView.contentMode = .scaleToFill
        loveButton.tintColor = .white
    }
    
    func cellConfigure(data: Travel) {
        titleLabel.text = data.title
        subtitleLabel.text = data.description
        let url = URL(string: data.travel_image ?? "")
        countryImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "camera"))
    }
}
