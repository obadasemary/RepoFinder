//
//  Owner-Ex+Helpers.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

//  MARK: - Extension OwnerViewController Helpers

extension OwnerViewController {
    
    // MARK: - callGetOwner
    
    func callGetOwner(viewController: UIViewController, ownerLogin: String, completion: @escaping (_ result: Bool, _ postListResponse: Owner?) -> Void) {
        
        let url = "\(Network.userProfileUrl)/\(ownerLogin)"
        
        Network.getOwner(url: url, viewController: viewController, parameters: nil) { (success, response) in
            
            if success {
                completion(true, response)
            } else {
                completion(false, nil)
            }
        }
    }
    
    // MARK: - callGetOwnerRepos
    
    func callGetOwnerRepos(viewController: UIViewController, ownerLogin: String, completion: @escaping (_ result: Bool, _ postListResponse: [Item]?) -> Void) {
        
        let url = "\(Network.userProfileUrl)/\(ownerLogin)/repos"
        
        Network.getOwnerRepos(url: url, viewController: viewController, parameters: nil) { (success, response) in
            
            if success {
                completion(true, response)
            } else {
                completion(false, nil)
            }
        }
    }
}
