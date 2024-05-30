//
//  RestaurantTableViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/26/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchBarDelegate {
    
    var list = RestaurantList().restaurantArray
    
    @IBOutlet var searchBar: UISearchBar!
    
    var filteredList : [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 140
        filteredList = list
        searchBar.delegate = self
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            filteredList = list
            tableView.reloadData()
            return
        }
        filteredList = list.filter { $0.name.contains(searchText) }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = list[indexPath.row]
        print(#function)
        
        let vc = storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
        vc.data = data
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
