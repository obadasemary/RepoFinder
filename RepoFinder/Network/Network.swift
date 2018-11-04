//
//  Network.swift
//  Premature
//
//  Created by Abdelrahman Mohamed on 7/25/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class Network {
    
    // MARK: - init
    
    static let shared = Network()
    static let decoder = JSONDecoder()
    
    // MARK: - URL
    
    static var baseUrl: String {
        
        var myDict: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = myDict {
            return dict.object(forKey: "baseUrl") as! String
        }
        
        return ""
    }
    
    static var apiEndPointUrl = baseUrl
    
    static let searchUrl = "search/repositories"
    static let userProfileUrl = "users"
    
    // MARK: - RequestWith T

    static func requestWith(url: URL!, method: HTTPMethod, parameters: Parameters?, viewController: UIViewController, showHud: Bool, showErrorAlerts: Bool, encoding: ParameterEncoding, completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {
        
        if showHud {
            HUD.show(.progress)
        }
        
        let token = DataManager.accessTokenHeader
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: token)
            .debugLog()
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                
//                print(String(data: response.data!, encoding: .utf8) ?? "")
                
                if showHud {
                    HUD.hide()
                }
                
                switch response.result {
                case .success:
                    completionHandler(response)
                case .failure(let error):
                    if response.response?.statusCode == 401 {
//                        AlertView.showError(in: viewController, message: "You are not login")
                        print("Network.requestWith.error.Unauthorized:", error)
                        completionHandler(nil)
                    } else {
//                        AlertView.showError(in: viewController, message: nil)
                        print("Network.requestWith.error:", error)
                        completionHandler(nil)
                    }
                }
        }
    }
    
    // MARK: - GetSearchResult
    
    static func getSearchResult(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, Repositories?) -> Void) {

        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")

        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in

            guard let data = response?.data else { return }
            do {
                let repositories = try self.decoder.decode(Repositories.self, from: data)
                completion(true, repositories)
            } catch let jsonError {
                print("Error serializing json.Network.getSearchResult:", jsonError)
                completion(false, nil)
            }
        }
    }
    
    // MARK: - GetOwner
    
    static func getOwner(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, Owner?) -> Void) {
        
        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
        
        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let owner = try self.decoder.decode(Owner.self, from: data)
                completion(true, owner)
            } catch let jsonError {
                print("Error serializing json.Network.getOwner:", jsonError)
                completion(false, nil)
            }
        }
    }
    
    // MARK: - getOwnerRepos
    
    static func getOwnerRepos(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, [Item]?) -> Void) {
        
        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
        
        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let item = try self.decoder.decode([Item].self, from: data)
                completion(true, item)
            } catch let jsonError {
                print("Error serializing json.Network.getOwnerRepos:", jsonError)
                completion(false, nil)
            }
        }
    }
}

// MARK: - extension Request

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================================")
        debugPrint(self)
        debugPrint("================================================================================================")
        #endif
        return self
    }
}

