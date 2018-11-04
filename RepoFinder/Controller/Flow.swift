//
//  Flow.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class Flow {
    
    static func searchController() -> UINavigationController {
        
        let SearchVC = SearchViewController()
        let SearchVCNavigationController = UINavigationController(rootViewController: SearchVC)
        SearchVCNavigationController.navigationBar.isTranslucent = false
        
        return SearchVCNavigationController
    }
}

