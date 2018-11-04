//
//  SearchVC-Ex+Helpers.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

//  MARK: - Extension SearchViewController Helpers

extension SearchViewController {
    
    // MARK: - observers
    
    func observers() {
        
        RepositoriesViewModel.shared.errorObserver.bind { (error) in
            
            DispatchQueue.main.async {
                self.searchController.endEditing(true)
                self.tableView.reloadData()
                print(error ?? "")
            }
        }
        
        RepositoriesViewModel.shared.repositoriesObserver.bind { (repos) in
            
            DispatchQueue.main.async {
                self.searchController.endEditing(true)
                self.repositories = repos!
                self.tableView.reloadData()
            }
        }
        
        RepositoriesViewModel.shared.ownersObserver.bind { (owners) in
            
            DispatchQueue.main.async {
                self.searchController.endEditing(true)
                self.owners = owners!
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - CallGetSearchRepositories
    
    func callGetSearchResult(viewController: UIViewController, q: String, per_page: Int, page: Int, completion: @escaping (_ result: Bool, _ postListResponse: Repositories?) -> Void) {
        
        let url = "\(Network.searchUrl)?q=\(q)&per_page=\(per_page)&page=\(page)"
        
        Network.getSearchResult(url: url, viewController: viewController, parameters: nil) { (success, response) in
            
            if success {
                completion(true, response)
            } else {
                completion(false, nil)
            }
        }
    }
    
    // MARK: - callGetOwners
    
    func callGetOwners(viewController: UIViewController, q: String, per_page: Int, page: Int, completion: @escaping (_ result: Bool, _ postListResponse: Owners?) -> Void) {
        
        let url = "\(Network.searchUsersUrl)?q=\(q)&per_page=\(per_page)&page=\(page)"
        
        Network.getOwners(url: url, viewController: viewController, parameters: nil) { (success, response) in
            
            if success {
                completion(true, response)
            } else {
                completion(false, nil)
            }
        }
    }
    
    // MARK: - pressActions
    
    func pressSeeUserInfo(owner: Owner) {
        let ownerVC = OwnerViewController()
        ownerVC.owner = owner
        ownerVC.title = owner.login
        self.navigationController?.pushViewController(ownerVC, animated: true)
    }
}
