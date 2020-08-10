//
//  AppDelegate.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 10/31/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Firebase
import Fabric
import Crashlytics
import Siren

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
//
//        FirebaseApp.configure()
//        Appearance.configure()
//        Fabric.with([Crashlytics.self])
//        SirenHelper.configure(with: self.window)
//
        self.window?.rootViewController = UINavigationController(rootViewController: SearchRouter.createModule())
        
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        Siren.shared.checkVersion(checkType: .immediately)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        Siren.shared.checkVersion(checkType: .immediately)
    }
}
