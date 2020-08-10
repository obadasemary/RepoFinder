//
//  SearchVC-Extension+TableViewDelegate.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segment.selectedSegmentIndex == 0 {
            return 200
        } else {
            return UITableViewAutomaticDimension
        }
    }
}
