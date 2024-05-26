//
//  TravelTableViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var list = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.magazine.count // 데이터 배열의 개수만큼 행을 반환합니다.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as? TravelTableViewCell else { return UITableViewCell() }
        
        let magazine = list.magazine[indexPath.row]
        print(magazine.title)
        cell.titleLabel.text = magazine.title
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        cell.subtitleLabel.text = magazine.subtitle
        cell.subtitleLabel.font = .systemFont(ofSize: 17)
        cell.subtitleLabel.textColor = .gray
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        let originalDate = dateFormatter.date(from: magazine.date)
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        dateFormatter.string(from:originalDate!)
        
        cell.dateLabel.text = dateFormatter.string(from:originalDate!)
        cell.dateLabel.textColor = .gray

        
        if let url = URL(string: magazine.photo_image) {
            cell.posterImageView.kf.setImage(with: url)
        }
        
        cell.posterImageView.layer.cornerRadius = 10
        
        
        return cell
    }
    
}
