//
//  CountryViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/27/24.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var countryTableView: UITableView!
    
    var list = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.rowHeight = 140
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        let nibName = UINib(nibName: "CountryTableViewCell", bundle: nil)
        countryTableView.register(nibName, forCellReuseIdentifier: "CountryTableViewCell")
        
        let nibName1 = UINib(nibName: "AdTableViewCell", bundle: nil)
        countryTableView.register(nibName1, forCellReuseIdentifier: "AdTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let data = list.travel[indexPath.row]
        cell.cellConfigure(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = list.travel[indexPath.row]
        
        if data.ad {
            let vc = storyboard?.instantiateViewController(identifier: "AdViewController") as! AdViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "CountryDetailViewController") as! CountryDetailViewController
            vc.data = data
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
