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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.className, for: indexPath) as! RepositoriesTableViewCell
        presenter?.configure(cell: cell, at: indexPath.row)
        return cell
    }
}
