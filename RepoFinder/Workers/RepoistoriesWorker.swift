//
//  RepoistoriesWorker.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class RepoistoriesWorker {
    
    private let networkLayer = NetworkLayer()
    
    func search(query: String, perPage: Int, page: Int, completionHandler: @escaping(Result<Repositories>) -> ()) {
        let request = RepoistoriesRouter.get(query: query, perPage: perPage, page: page)
        networkLayer.request(url: request, decodeTo: Repositories.self) { result in
            completionHandler(result)
        }
    }
    
}
