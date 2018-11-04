//
//  SearchVC-Ex+Helpers.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

//  MARK: - Extension RepositoryDetailsViewController Helpers

extension RepositoryDetailsViewController {
    
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
        print(owner.login ?? "")
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        //        let newViewController = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        //        newViewController.userId = userId
        //        newViewController.isOrganization = isOrganization
        //        newViewController.hidesBottomBarWhenPushed = true
        //        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
