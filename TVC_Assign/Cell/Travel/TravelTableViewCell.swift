//
//  TravelTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/28/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {

    
    static let identifier = "TravelTableViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        
        descriptionLabel.font = .boldSystemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .lightGray
        
        posterImageView.backgroundColor = .gray
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
        
        dateLabel.font = .boldSystemFont(ofSize: 15)
        dateLabel.numberOfLines = 0
        dateLabel.textColor = .lightGray
    }
    
    override func prepareForReuse() { //예외처리 구문
        super.prepareForReuse()
        backgroundColor = .white
        posterImageView.image = nil
    }
    
    func configureCell(_ data: Magazine) {
        titleLabel.text = data.title
        descriptionLabel.text = data.subtitle
        let url = URL(string: data.photo_image)
        posterImageView.kf.setImage(with: url)
        dateLabel.text = data.date
    }
    
}
