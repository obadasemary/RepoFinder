//
//  License.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

struct License: Codable {
    let key, name, spdxID: String?
    let url: String?
    let nodeID: String?
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}
