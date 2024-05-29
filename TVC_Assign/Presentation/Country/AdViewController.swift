//
//  AdViewController.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        navigationItem.title = "광고"
        let back = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissModal))
        navigationItem.leftBarButtonItem = back
    }
    
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
