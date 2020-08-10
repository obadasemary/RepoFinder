//
//  File.swift
//  Basefy
//
//  Created by Basefy on 04/04/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import Foundation
import UIKit
import SwiftyUserDefaults
import Alamofire


extension DefaultsKeys {
    static let accessToken = DefaultsKey<String?>("access_token")
    static let refreshToken = DefaultsKey<String?>("refresh_token")
    static let userId = DefaultsKey<String?>("user_id")
    static let userName = DefaultsKey<String?>("user_name")
    
    static let credentialsLoggedIn = DefaultsKey<Bool>("credentials_login")
    static let facebookLoggedIn = DefaultsKey<Bool>("facebook_login")
    static let twitterLoggedIn = DefaultsKey<Bool>("twitter_login")
    static let instagramLoggedIn = DefaultsKey<Bool>("instagram_login")
    
    static let iyzicoSellerAgreementAccepted = DefaultsKey<Bool>("seller_agreement")
    
    static let userAgreement = DefaultsKey<Bool>("user_agreement")
    static let userCommercial = DefaultsKey<Bool>("user_commercial")
}


class DataManager {
    
    static let facebookSecret = "5f278ee767e520837cd05cc3b10f26eb"
    
    static var hasLoggedInUser: Bool {
        get {
            if getApiToken() != nil {
                return true
            } else {
                return false
            }
        }
    }
    
//    static var hasLoggedInUser: Bool {
//        get {
//            if let _ = Defaults[.accessToken] {
//                return true
//            } else {
//                return false
//            }
//        }
//    }
    
    static var userId:  String? {
        get {
            if let id = getUserId() {
                return id
            }
            
            return nil
        }
    }
    
//    static var userId:  String? {
//        get {
//            if let id = Defaults[.userId] {
//                return id
//            }
//
//            return nil
//        }
//    }
    
    static var userName:  String? {
        get {
            if let name = Defaults[.userName] {
                return name
            }
            
            return nil
        }
    }
    
    static var accessTokenHeader:  HTTPHeaders? {
        get {
            if let token = getApiToken() {
                return ["Authorization" : "Bearer \(token)"]
            }
            
            return nil
        }
    }
    
//    static var accessTokenHeader:  HTTPHeaders? {
//        get {
//            if let token = Defaults[.accessToken] {
//                return ["Authorization" : "Bearer \(token)"]
//            }
//
//            return nil
//        }
//    }
    
    static var isLoggedInWithCredentials: Bool {
        get {
            return Defaults[.credentialsLoggedIn]
        }
        
        set {
            Defaults[.credentialsLoggedIn] = newValue
        }
    }
    
    static var isLoggedInWithFacebook: Bool {
        get {
            return Defaults[.facebookLoggedIn]
        }
        
        set {
            Defaults[.facebookLoggedIn] = newValue
        }
    }
    
    static var isLoggedInWithTwitter: Bool {
        get {
            return Defaults[.twitterLoggedIn]
        }
        
        set {
            Defaults[.twitterLoggedIn] = newValue
        }
    }
    
    static var isLoggedInWithInstagram: Bool {
        get {
            return Defaults[.instagramLoggedIn]
        }
        
        set {
            Defaults[.instagramLoggedIn] = newValue
        }
    }
    
    static var iyzicoSellerAgreementAccepted: Bool {
        get {
            return Defaults[.iyzicoSellerAgreementAccepted]
        }
        
        set {
            Defaults[.iyzicoSellerAgreementAccepted] = newValue
        }
    }
}
