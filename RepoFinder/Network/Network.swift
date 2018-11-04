//
//  Network.swift
//  Premature
//
//  Created by Abdelrahman Mohamed on 7/25/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class Network {
    
    // MARK: - init
    
    static let shared = Network()
    static let decoder = JSONDecoder()
    
    // MARK: - URL
    
    static var baseUrl: String {
        
        var myDict: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = myDict {
            return dict.object(forKey: "baseUrl") as! String
        }
        
        return ""
    }
    
    static var apiEndPointUrl = baseUrl
    
    static let searchUrl = "search/repositories"
    static let userProfileUrl = "users/"
    static let userRepositoriesUrl = "users/Obadasemary/repos"
    
    
    // MARK: - RequestWith T

    static func requestWith(url: URL!, method: HTTPMethod, parameters: Parameters?, viewController: UIViewController, showHud: Bool, showErrorAlerts: Bool, encoding: ParameterEncoding, completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {
        
        if showHud {
            HUD.show(.progress)
        }
        
        let token = DataManager.accessTokenHeader
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: token)
            .debugLog()
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                
//                print(String(data: response.data!, encoding: .utf8) ?? "")
                
                if showHud {
                    HUD.hide()
                }
                
                switch response.result {
                case .success:
                    completionHandler(response)
                case .failure(let error):
                    if response.response?.statusCode == 401 {
//                        AlertView.showError(in: viewController, message: "You are not login")
                        print("Network.requestWith.error.Unauthorized:", error)
                        completionHandler(nil)
                    } else {
//                        AlertView.showError(in: viewController, message: nil)
                        print("Network.requestWith.error:", error)
                        completionHandler(nil)
                    }
                }
        }
    }
    
    // MARK: - GetSearchResult
    
    static func getSearchResult(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, Repositories?) -> Void) {

        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")

        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: false, showErrorAlerts: false, encoding: JSONEncoding.default) { (response) in

            guard let data = response?.data else { return }
            do {
                let repositories = try self.decoder.decode(Repositories.self, from: data)
                completion(true, repositories)
            } catch let jsonError {
                print("Error serializing json.Network.getSearchResult:", jsonError)
                completion(false, nil)
            }
        }
    }


    
    // MARK: - GetHashtagList
    
//    static func getHashtagList(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetHashtagListResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(getHashtagListUrl)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getHashtagListResponse = try self.decoder.decode(GetHashtagListResponse.self, from: data)
//                completion(true, getHashtagListResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getPostList:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetCategories
    
//    static func getCategories(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetCategoriesResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(getCategoriesUrl)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getCategoriesResponse = try self.decoder.decode(GetCategoriesResponse.self, from: data)
//                completion(true, getCategoriesResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getPostList:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetPostList
    
//    static func getPostList(url: String, encoding: ParameterEncoding, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, PostListResponse?) -> Void) {
//
//        let url = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: url, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: encoding) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let postListResponse = try self.decoder.decode(PostListResponse.self, from: data)
//                completion(true, postListResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getPostList:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetPostList
    
//    static func getPostListBabyTv(url: String, encoding: ParameterEncoding, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, PostListResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: encoding) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let postListResponseBabyTv = try self.decoder.decode(PostListResponse.self, from: data)
//                completion(true, postListResponseBabyTv)
//            } catch let jsonError {
//                print("Error serializing json.Network.getPostListBabyTv:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetPostListbyHashtag
    
//    static func getPostListByHashtag(url: String, encoding: ParameterEncoding, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, PostListResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: encoding) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let postListResponse = try self.decoder.decode(PostListResponse.self, from: data)
//                completion(true, postListResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getPostList:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    
    
    // MARK: - uploadImageOnly
    
//    static func uploadImageWith(viewController: UIViewController, loadingText: String, image: UIImage, completion: @escaping (_ success: Bool, _ imageUploadResponseModel: ImageUploadResponseModel?) -> Void ) {
//
//        DispatchQueue.main.async {
//            HUD.show(.labeledProgress(title: nil, subtitle: "\("uploadingPhotos".localized())\(loadingText)"))
//        }
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//
//            if let imageData = UIImageJPEGRepresentation(image, 0.1) {
//
//                multipartFormData.append(imageData, withName: "filename", fileName: "filename", mimeType: "image/\(imageData.format)")
//            }
//
//        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: fullImageUploadUrl, method: .post, headers: DataManager.accessTokenHeader) { (result) in
//
//            switch result {
//
//            case .failure(let error):
//                print("UploadImageWith.requestWith.Alamofire.usingThreshold:", error)
//                completion(false, nil)
//                DispatchQueue.main.async {
//                    HUD.hide()
//                }
//                AlertView.showError(in: viewController, message: error.localizedDescription)
//                completion(false, nil)
//                return
//
//            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
//
//                upload.uploadProgress(closure: { (progress) in
//
////                    hud.progress = Float(progress.fractionCompleted)
////                    print("Upload Progress: \(Float(progress.fractionCompleted))")
//                })
//
//                upload.responseJSON(completionHandler: { (response) in
//
//
//                    if let responseStatusCode = response.response?.statusCode {
//                        if responseStatusCode == 401 {
//                            HUD.hide()
//                            AlertView.show(in: viewController, title: "warning".localized(), message: "sessionDroppedLoginAgain".localized()) {
////                                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
////                                    appDelegate.logoutFromBasefy(viewController: viewController)
////                                }
//
//                            }
//                            completion(false, nil)
//                            return
//                        }
//                    }
//
//                    guard response.result.value != nil else {
//                        HUD.hide()
//                        AlertView.showError(in: viewController, message: nil)
//                        completion(false, nil)
//                        return
//                    }
//
//                    guard let data = response.data else { return }
//
//                    do {
//
//                        let uploadImageResponse = try self.decoder.decode(ImageUploadResponseModel.self, from: data)
//
//                        DispatchQueue.main.async {
//                            HUD.hide()
//                        }
//
//                        completion(true, uploadImageResponse)
//
//                    } catch let jsonError {
//
//                        HUD.hide()
//                        print("Error serializing json.Network.uploadImageWith:", jsonError)
//                        completion(false, nil)
//                    }
//                })
//            }
//        }
//    }
    
    // MARK: - AddPost
    
//    static func addPost(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, AddPostResponse?) -> Void) {
//
//        let url = URL(string: "\(apiEndPointUrl)\(addPostUrl)")
//
//        self.requestWith(url: url, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let addPostResponse = try self.decoder.decode(AddPostResponse.self, from: data)
//                completion(true, addPostResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.addPost:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetProfilePage
    
//    static func getProfilePage(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, YourPostResponse?) -> Void) {
//
//        let url = URL(string: "\(apiEndPointUrl)\(getProfilePageUrl)")
//
//        self.requestWith(url: url, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//
//            do {
//                let yourPostResponse = try self.decoder.decode(YourPostResponse.self, from: data)
//                completion(true, yourPostResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getProfilePage:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetUserPageByUserId
    
//    static func getUserPageByUserId(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, YourPostResponse?) -> Void) {
//
////        let url = URL(string: "\(apiEndPointUrl)\(getUserPageByUserIdUrl)")
//        let url = URL(string: "\(apiEndPointUrl)\(url)")
//
//
//        self.requestWith(url: url, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//
//            do {
//                let yourPostResponse = try self.decoder.decode(YourPostResponse.self, from: data)
//                completion(true, yourPostResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getUserPageByUserId:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetSysUserProfilePage
    
//    static func getSysUserProfilePage(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, OrganizationPostResponse?) -> Void) {
//
//        let newUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: newUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            print("getSysUserProfilePageData:", data)
//
//            do {
//                let organizationPostResponse = try self.decoder.decode(OrganizationPostResponse.self, from: data)
//                completion(true, organizationPostResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.getSysUserProfilePage:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - Follow
    
//    static func follow(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, FollowResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(followUrl)")
//
//        self.requestWith(url: fullUrl, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let followResponse = try self.decoder.decode(FollowResponse.self, from: data)
//                completion(true, followResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.follow:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - UnFollow
    
//    static func unFollow(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, FollowResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .delete, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let followResponse = try self.decoder.decode(FollowResponse.self, from: data)
//                completion(true, followResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.unFollow:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetUserFollow
    
//    static func getUserFollow(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetUserFollowResponse?) -> Void) {
//
//        let url = URL(string: "\(apiEndPointUrl)\(getUserFollowUrl)")
//
//        self.requestWith(url: url, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getUserFollowResponse = try self.decoder.decode(GetUserFollowResponse.self, from: data)
//                completion(true, getUserFollowResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.GetUserFollowResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetUserFollowersByUserId
    
//    static func getUserFollowersByUserId(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, FollowersResponse?) -> Void) {
//        
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//        
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//            
//            guard let data = response?.data else { return }
//            do {
//                let followersResponse = try self.decoder.decode(FollowersResponse.self, from: data)
//                completion(true, followersResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.GetUserFollowResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - GetUserFollowingByUserId
    
//    static func getUserFollowingByUserId(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, FollowersResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let followingResponse = try self.decoder.decode(FollowersResponse.self, from: data)
//                completion(true, followingResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.GetUserFollowResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - addlikePost
    
//    static func likePost(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, LikeResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let likeResponse = try self.decoder.decode(LikeResponse.self, from: data)
//                completion(true, likeResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.LikeResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }

    
    // MARK: - AddComment
    
//    static func addComment(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, AddCommentResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(addCommentPostUrl)")
//
//        self.requestWith(url: fullUrl, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let addCommentResponse = try self.decoder.decode(AddCommentResponse.self, from: data)
//                completion(true, addCommentResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.addPost:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - StartConversation
    
//    static func startConversation(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, StartConversationResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(startConversationUrl)")
//
//        self.requestWith(url: fullUrl, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let startConversationResponse = try self.decoder.decode(StartConversationResponse.self, from: data)
//                completion(true, startConversationResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.StartConversation:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - getConversations
    
//    static func getConversations(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetConversationsResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(getConversationsUrl)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getConversationsResponse = try self.decoder.decode(GetConversationsResponse.self, from: data)
//                completion(true, getConversationsResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.GetConversationsResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - getConversations
    
//    static func getConversationMessages(url: String, viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetConversationMessagesResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(url)")
//
//        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getConversationMessagesResponse = try self.decoder.decode(GetConversationMessagesResponse.self, from: data)
//                completion(true, getConversationMessagesResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.GetConversationMessagesResponse", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - SendMessage
    
//    static func sendMessage(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetConversationMessagesResponse?) -> Void) {
//
//        let fullUrl = URL(string: "\(apiEndPointUrl)\(sendMessageUrl)")
//
//        self.requestWith(url: fullUrl, method: .post, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getConversationMessagesResponse = try self.decoder.decode(GetConversationMessagesResponse.self, from: data)
//                completion(true, getConversationMessagesResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.SendMessage:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
    
    // MARK: - getNotificationList
    
//    static func getNotificationList(viewController: UIViewController, parameters: Parameters?, completion: @escaping (_ success: Bool, GetNotificationsResponse?) -> Void) {
//
//        let url = URL(string: "\(apiEndPointUrl)\(getNotificationsUrl)")
//
//        self.requestWith(url: url, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
//
//            guard let data = response?.data else { return }
//            do {
//                let getNotificationsResponse = try self.decoder.decode(GetNotificationsResponse.self, from: data)
//                completion(true, getNotificationsResponse)
//            } catch let jsonError {
//                print("Error serializing json.Network.LikeResponse:", jsonError)
//                completion(false, nil)
//            }
//        }
//    }
}

// MARK: - extension Request

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================================")
        debugPrint(self)
        debugPrint("================================================================================================")
        #endif
        return self
    }
}

