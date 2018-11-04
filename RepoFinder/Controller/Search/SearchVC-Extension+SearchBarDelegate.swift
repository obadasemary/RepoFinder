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
        
        callGetSearchResult(viewController: self, q: searchText, per_page: 100, page: 1) { (success, response) in
            
            if success {
                
                self.repositories = response!
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.endEditing(true)
    }
}
