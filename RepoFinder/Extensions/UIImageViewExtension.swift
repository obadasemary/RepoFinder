//
//  UIImageViewExtension.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func load(url: String, placeholderImage: String) {
        sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholderImage))
    }
    
}
