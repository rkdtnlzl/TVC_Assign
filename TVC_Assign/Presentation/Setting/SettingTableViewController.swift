//
//  SettingTableViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var allSettingList = ["공지사항", "실험실", "버전 정보"]
    var privateSettingList = ["개인/보안", "알림", "채팅"]
    var ect = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allSetting")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = allSettingList[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = privateSettingList[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = ect[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                            section: Int) -> String? {
        
        let headerList = ["전체 설정", "개인 설정", "기타"]
        
        return headerList[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return allSettingList.count
        } else if section == 1 {
            return privateSettingList.count
        } else if section == 2 {
            return ect.count
        } else {
            return 0
        }
    }
}
