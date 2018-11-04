//
//  SearchVC-Extension+TableViewDataSource.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

// MARK: - UITableView DataSource

extension RepositoryDetailsViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newItem = item else { return UITableViewCell() }
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryDetailsTableViewCell.identifier, for: indexPath) as? RepositoryDetailsTableViewCell {
                cell.setupCell(item: newItem)
                cell.makeSeeUserInfoAction = { [weak self] in
                    guard let owner = newItem.owner else { return }
                    self?.pressSeeUserInfo(owner: owner)
                }
                return cell
            }
        } else if indexPath.section == 1 {
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.textLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
            cell.textLabel?.textColor = Color.black.value
            cell.textLabel?.numberOfLines = 0
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Name: \(newItem.owner?.login ?? "")"
            case 1:
                cell.textLabel?.text = "Description: \(newItem.description ?? "")"
            case 2:
                cell.textLabel?.text = "Forks: \(newItem.forksCount ?? 0)"
            case 3:
                cell.textLabel?.text = "Language: \(newItem.language ?? "")"
            case 4:
                cell.textLabel?.text = "Default branch name: \(newItem.defaultBranch ?? "")"
            default:
                cell.textLabel?.text = ""
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
