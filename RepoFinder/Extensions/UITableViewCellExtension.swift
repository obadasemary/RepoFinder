//
//  UITableViewCellExtension.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}
