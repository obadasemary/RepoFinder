//
//  RepoistriesRouter.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import Alamofire

enum RepoistoriesRouter: URLRequestConvertible {
    case get(query: String, perPage: Int, page: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .get(let query, let perPage, let page):
            return [
                "q": query,
                "per_page": perPage,
                "page": page
            ]
        }
    }
    
    var url: URL {
        let endpoint = Constants.searchRepoistoryEndpoint
        var url = URL(string: Constants.baseURL)!
        url = url.appendingPathComponent(endpoint)
        return url
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
