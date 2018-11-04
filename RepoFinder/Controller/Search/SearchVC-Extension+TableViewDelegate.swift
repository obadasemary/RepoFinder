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
        guard let item = repositories?.items?[indexPath.row] else { return }
        let RepositoryDetailsVC = RepositoryDetailsViewController()
        RepositoryDetailsVC.item = item
        RepositoryDetailsVC.title = item.name
        self.navigationController?.pushViewController(RepositoryDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
