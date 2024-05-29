//
//  TravelViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/28/24.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    let list =  MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 365
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: TravelTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        let data = list[indexPath.row]
        cell.configureCell(data)
        
        return cell
    }
    


}
