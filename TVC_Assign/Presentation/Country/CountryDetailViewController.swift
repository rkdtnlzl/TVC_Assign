//
//  CountryDetailViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/29/24.
//

import UIKit
import Kingfisher

class CountryDetailViewController: UIViewController {

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = data?.title
        
        setConfigure()
    }
    
    func setConfigure() {
        
        view.backgroundColor = .lightGray
        
        guard let data = data else {return}
        
        let url = URL(string: data.travel_image ?? "")
        posterImage.kf.setImage(with: url, placeholder: UIImage(systemName: "camera"))
        posterImage.contentMode = .scaleAspectFill
        
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.text = data.description
        descriptionLabel.font = .systemFont(ofSize: 15)
        
        gradeLabel.text = "평점 : \(data.grade ?? 0)점"
        gradeLabel.font = .systemFont(ofSize: 13)
        
    }
        
}
