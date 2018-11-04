//
//  SearchVC-Extension+TableViewDelegate.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

// MARK: - UITableView Delegate

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segment.selectedSegmentIndex == 0 {
            guard let item = repositories?.items?[indexPath.row] else { return }
            let RepositoryDetailsVC = RepositoryDetailsViewController()
            RepositoryDetailsVC.item = item
            RepositoryDetailsVC.title = item.name
            self.navigationController?.pushViewController(RepositoryDetailsVC, animated: true)
        } else {
            guard let owner = owners?.items?[indexPath.row] else { return }
            let ownerVC = OwnerViewController()
            ownerVC.owner = owner
            ownerVC.title = owner.login
            self.navigationController?.pushViewController(ownerVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segment.selectedSegmentIndex == 0 {
            return 200
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
