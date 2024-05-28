//
//  UILabel+Extension.swift
//  TVC_Assign
//
//  Created by 강석호 on 5/28/24.
//

import Foundation
import UIKit

extension UILabel {
    
    func setPrimaryLabel() {
        self.font = .boldSystemFont(ofSize: 17)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.layer.cornerRadius = 10
        
    }
    
}
