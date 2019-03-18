//
//  HarpyHelper.swift
//  BabyKolay
//
//  Created by Basefy on 1.12.2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import Foundation
import Siren

class SirenHelper {
    
    static func configure(with window: UIWindow?) {
        Siren.shared.appName = "RepoFinder"
        Siren.shared.alertType = .force
        Siren.shared.forceLanguageLocalization = .turkish
    }
}
