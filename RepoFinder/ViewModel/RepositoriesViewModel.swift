//
//  RepositoriesViewModel.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/4/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire

struct RepositoriesViewModel {
    
    static let  shared = RepositoriesViewModel()
    
    // MARK: - init
    
    let decoder = JSONDecoder()
    
    var repositoriesObserver = Box<Repositories>()
    var ownersObserver = Box<Owners>()
    
    var errorObserver = Box<Error>()
    
    // MARK: - GetSearchResult
    
    func getSearchResult(url: String, viewController: UIViewController, parameters: Parameters?) {
        
        let fullUrl = URL(string: "\(Network.apiEndPointUrl)\(url)")
        
        Network.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let repositories = try self.decoder.decode(Repositories.self, from: data)
                self.repositoriesObserver.value = repositories
            } catch let jsonError {
                print("Error serializing json.Network.getSearchResult:", jsonError)
                self.errorObserver.value = jsonError
            }
        }
    }
    
    // MARK: - GetOwners
    
    func getOwners(url: String, viewController: UIViewController, parameters: Parameters?) {
        
        let fullUrl = URL(string: "\(Network.apiEndPointUrl)\(url)")
        
        Network.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let owners = try self.decoder.decode(Owners.self, from: data)
                self.ownersObserver.value = owners
            } catch let jsonError {
                print("Error serializing json.Network.getOwners:", jsonError)
                self.errorObserver.value = jsonError
            }
        }
    }
}
