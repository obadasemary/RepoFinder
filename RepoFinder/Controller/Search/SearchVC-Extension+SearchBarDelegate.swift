//
//  SearchVC-Extension+SearchBarDelegate.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

//  MARK: - Extension SearchViewController Search

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        if self.segment.selectedSegmentIndex == 0 {
            callGetSearchResult(viewController: self, q: searchText, per_page: 100, page: 1) { (success, response) in

                if success {

                    self.searchController.endEditing(true)
                    self.repositories = response!

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        } else {
            callGetOwners(viewController: self, q: searchText, per_page: 100, page: 1) { (success, response) in
                
                if success {
                    
                    self.searchController.endEditing(true)
                    self.owners = response!
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.endEditing(true)
    }
}
