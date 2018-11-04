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
    
    // MARK: - pressActions
    
    func pressSeeUserInfo(owner: Owner) {
        let ownerVC = OwnerViewController()
        ownerVC.owner = owner
        ownerVC.title = owner.login
        self.navigationController?.pushViewController(ownerVC, animated: true)
    }
}
