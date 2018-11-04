//
//  Repositories.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
