//
//  NetworkLayer.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkLayer {
    
    func request<T: Codable>(url: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping(Result<T>) -> ()) {
        Alamofire.request(url).debugLog().validate().responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: value)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
