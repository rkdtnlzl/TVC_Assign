//
//  RestaurantTableViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/26/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var list = RestaurantList()
    
    @IBOutlet var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 140

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.restaurantArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell else { return UITableViewCell() }
        
        let data = list.restaurantArray[indexPath.row]
        cell.nameLabel.text = data.name
        cell.nameLabel.font = .boldSystemFont(ofSize: 18)
        cell.kindLabel.text = data.category
        cell.addressLabel.text = data.address
        cell.addressLabel.font = .systemFont(ofSize: 13)
        
        if let url = URL(string: data.image) {
            cell.restaurantImageView.kf.setImage(with: url)
        }
        
        cell.restaurantImageView.layer.cornerRadius = 10
        
        return cell
    }

    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        if searchTextField.text == "한식" {
            
        }
    }
    
}
