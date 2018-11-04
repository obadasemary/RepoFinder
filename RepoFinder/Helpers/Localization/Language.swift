//
//  Language.swift
//  Ossul
//
//  Created by Abdelrahman Mohamed on 7/6/17.
//  Copyright © 2017 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class Language {
    
    class func currentLanguage() -> String {
        
        let def = UserDefaults.standard
        
        let lang = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = lang.firstObject as! String
        
        return firstLang
    }
    
    class func setAppLanguage(lang: String) {
        
        let def = UserDefaults.standard
        
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
    
    class func localNotificationBody(language: String) -> String {
        
        if language == "en-US" {
            return "Language changed. Tap to open Fin Mobile again."
        } else if language == "tr" {
            return "Dil değişti, Fin Mobile tekrar açmak için dokunun."
        }
        return "Language changed. Tap to open Fin Mobile again."
    }
    
    class func createLocalNotification(language: String) {
        
//        let notification = UILocalNotification()
//        notification.fireDate = Date(timeIntervalSinceNow: 1)
//        notification.alertBody = Language.localNotificationBody(language: language)
//        notification.soundName = UILocalNotificationDefaultSoundName
//        UIApplication.shared.scheduleLocalNotification(notification)
//
//        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return }
//        
//        if settings.types == .none {
//            
//            return
//        }
    }
}
