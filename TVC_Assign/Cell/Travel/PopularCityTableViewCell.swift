//
//  PopularCityTableViewCell.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/29/24.
//

import UIKit

class PopularCityTableViewCell: UITableViewCell {
    
    static let identifier = "PopularCityTableViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell()
    }
    
    override func prepareForReuse() { //예외처리 구문
        super.prepareForReuse()
        
        backgroundColor = .white
        posterImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0))
    }
    
    func configureCellData(_ data: City) {
        
        titleLabel.text = "\(data.city_name) | \(data.city_english_name)"
        descriptionLabel.text = data.city_explain
        let url = URL(string: data.city_image)
        posterImageView.kf.setImage(with: url)
    }
    
    func configureCell() {
        
        titleLabel.font = .boldSystemFont(ofSize: 23)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        descriptionLabel.font = .boldSystemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        
        posterImageView.backgroundColor = .gray
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
    }
}
