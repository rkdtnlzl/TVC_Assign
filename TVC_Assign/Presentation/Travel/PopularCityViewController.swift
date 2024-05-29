//
//  PopularCityViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    let list =  CityInfo().city
    let domestic = CityInfo().domesticCities
    let international = CityInfo().internationalCities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 140
        configureTableView()
    }
    
    @IBAction func segmentedControlSelected(_ sender: UISegmentedControl) {
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            tableView.reloadData()
            break
        case 1:
            tableView.reloadData()
            break
        case 2:
            tableView.reloadData()
            break
        default:
            break
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "PopularCityTableViewCell")
    }
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return list.count
        case 1:
            return domestic.count
        case 2:
            return international.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityTableViewCell", for: indexPath) as! PopularCityTableViewCell
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let data = list[indexPath.row]
            cell.configureCell(data)
            return cell
        case 1:
            let domesticData = domestic[indexPath.row]
            cell.configureCell(domesticData)
            return cell
        case 2:
            let internationalData = international[indexPath.row]
            cell.configureCell(internationalData)
            return cell
        default:
            break
        }
        
        return cell
    }
}
