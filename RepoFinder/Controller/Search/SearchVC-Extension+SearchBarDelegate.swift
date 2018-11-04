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
            let url = "\(Network.searchUrl)?q=\(searchText)&per_page=\(100)&page=\(1)"
            RepositoriesViewModel.shared.getSearchResult(url: url, viewController: self, parameters: nil)
        } else {
            let url = "\(Network.searchUsersUrl)?q=\(searchText)&per_page=\(100)&page=\(1)"
            RepositoriesViewModel.shared.getOwners(url: url, viewController: self, parameters: nil)
        }
        
        self.observers()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.endEditing(true)
    }
}
