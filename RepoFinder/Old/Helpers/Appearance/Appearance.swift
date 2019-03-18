//
//  Appearance.swift
//  Basefy
//
//  Created by Basefy on 21/08/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import UIKit

class Appearance {
    
    static func configure() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        UINavigationBar.appearance().barTintColor = Color.black.value
        UINavigationBar.appearance().tintColor = Color.black.value
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : Color.black.value, NSAttributedStringKey.font: Font(.installed(.regular), size: .standard(.h2)).instance]
        UITabBarItem.appearance().badgeColor = Color.spinner.value
    }
}
