//
//  SearchVC-Extension+TableViewDataSource.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

// MARK: - UITableView DataSource

extension SearchViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = repositories?.items?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.identifier, for: indexPath) as! RepositoriesTableViewCell
        cell.setupCell(item: item)
        cell.makeSeeUserInfoAction = { [weak self] in
            guard let owner = item.owner else { return }
            self?.pressSeeUserInfo(owner: owner)
        }
        return cell
    }
}
