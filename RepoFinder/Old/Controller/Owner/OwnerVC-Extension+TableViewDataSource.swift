//
//  OwnerVC-Extension+TableViewDataSource.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

// MARK: - UITableView DataSource

extension OwnerViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return item?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newOwner = owner else { return UITableViewCell() }
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: OwnerTableViewCell.identifier, for: indexPath) as? OwnerTableViewCell {
                cell.setupCell(owner: newOwner)
                return cell
            }
        } else if indexPath.section == 1 {
            guard let currentItem = item?[indexPath.row] else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.className, for: indexPath) as! RepositoriesTableViewCell
//            cell.setupCell(item: currentItem)
            return cell
        }
        
        return UITableViewCell()
    }
}
