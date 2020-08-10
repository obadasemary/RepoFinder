//
//  HelperMethods.swift
//  FactoMobile
//
//  Created by Abdelrahman Mohamed on 3/19/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import KeychainAccess

func makeTranslucentFalse(view: UIViewController) {
    
    view.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 242, green: 242, blue: 242, alpha: 0.4)
    view.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    view.navigationController?.navigationBar.shadowImage = UIImage()
    view.navigationController?.navigationBar.backgroundColor = .clear
    view.navigationController?.navigationBar.isTranslucent = false
}

func makeTranslucentTrue(view: UIViewController) {
    
    view.navigationController?.navigationBar.isTranslucent = true
}

func makeTranslucentFalse(view: UITableViewController) {
    
    view.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 242, green: 242, blue: 242, alpha: 0.4)
    view.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    view.navigationController?.navigationBar.shadowImage = UIImage()
    view.navigationController?.navigationBar.backgroundColor = .clear
    view.navigationController?.navigationBar.isTranslucent = false
}

func makeTranslucentTrue(view: UITableViewController) {
    
    view.navigationController?.navigationBar.isTranslucent = true
}

// MARK: - textToImage

/**
 Convert text To Image 
 */

func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint, viewTextColor: UIColor) -> UIImage {
    let textColor = viewTextColor
    let textFont = UIFont(name: "Helvetica Bold", size: 256)!
    
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
    
    let textFontAttributes = [
        NSAttributedStringKey.font: textFont,
        NSAttributedStringKey.foregroundColor: textColor,
        ] as [NSAttributedStringKey : Any]
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
    
    let rect = CGRect(origin: point, size: image.size)
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

// MARK: - Key ApiToken

/**
 Use SaveApiToken
 Use GetApiToken
 Use RemoveApiToken
 */

let keychain = Keychain(service: "FactoMobile.app")

public func saveApiToken(token: String) {
    
    keychain["apiToken"] = token
}

func getApiToken() -> String? {
    
    return keychain["apiToken"]
}

public func removeApiToken() {
    
    keychain["apiToken"] = nil
}

// MARK: - Key userId

/**
 Use SaveUserId
 Use GetUserId
 Use RemoveUserId
 */

public func saveUserId(userId: String) {
    
    keychain["userId"] = userId
}

func getUserId() -> String? {
    
    return keychain["userId"]
}

public func removeUserId() {
    
    keychain["userId"] = nil
}

// MARK: - Key userName

/**
 Use SaveUserName
 Use GetUserName
 Use RemoveUserName
 */

public func saveUserName(userName: String) {
    
    keychain["userName"] = userName
}

func getUserName() -> String? {
    
    return keychain["userName"]
}

public func removeUserName() {
    
    keychain["userName"] = nil
}

// MARK: - Key FirstUserName

/**
 Use saveFirstUserName
 Use getFirstUserName
 Use removeFirstUserName
 */

public func saveFirstUserName(firstUserName: String) {
    
    keychain["firstUserName"] = firstUserName
}

func getFirstUserName() -> String? {
    
    return keychain["firstUserName"]
}

public func removeFirstUserName() {
    
    keychain["firstUserName"] = nil
}

// MARK: - Key LastUserName

/**
 Use saveFirstUserName
 Use getFirstUserName
 Use removeFirstUserName
 */

public func saveLastUserName(lastUserName: String) {
    
    keychain["lastUserName"] = lastUserName
}

func getLastUserName() -> String? {
    
    return keychain["lastUserName"]
}

public func removeLastUserName() {
    
    keychain["lastUserName"] = nil
}

// MARK: - getCurrentDate

func getCurrentDate() -> String? {
    
    let currentDate = NSDate()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    
    let currentDateString = dateFormatter.string(from: currentDate as Date)
    
    return currentDateString
}

// MARK: - Use goToAnyWay

/**
 Use goToAnyWay With UIViewController
 */

public func goToAnyWay(identifier: String, storyboard: String, pushOrPresent: String, uIView: UIViewController) {
    
    let storyBoard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
    
    if pushOrPresent == "push" {
        
        uIView.navigationController?.pushViewController(newViewController, animated: true)
    } else {
        
        uIView.present(newViewController, animated: true, completion: nil)
    }
}

// MARK: - Use goToAnyWay

/**
 Use goToAnyWay With UITableViewController
 */

public func goToAnyWay(identifier: String, storyboard: String, pushOrPresent: String, uIView: UITableViewController) {
    
    let storyBoard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
    
    if pushOrPresent == "push" {
        
        uIView.navigationController?.pushViewController(newViewController, animated: true)
    } else {
        
        uIView.present(newViewController, animated: true, completion: nil)
    }
}

// MARK: - Use SWRevealMenu

/**
 Use goToAnyWay With Use SWRevealMenu
 */

//public func SWRevealMenu (RootPage: String, SideMenu: String, RootStoryboard: String, MenuStoryboard: String) -> SWRevealViewController {
//    
//    let frontNavigationController: UINavigationController
//    let rearNavigationController: UINavigationController
//    let revealController = SWRevealViewController()
//    let Rstoryboard = UIStoryboard.init(name: RootStoryboard, bundle: Bundle.main)
//    let Mstoryboard = UIStoryboard.init(name: MenuStoryboard, bundle: Bundle.main)
//    let sidebar = Mstoryboard.instantiateViewController(withIdentifier: SideMenu )
//    let homepage = Rstoryboard.instantiateViewController(withIdentifier: RootPage )
//    frontNavigationController = UINavigationController(rootViewController: homepage)
//    rearNavigationController = UINavigationController(rootViewController: sidebar)
//    // change Navigation Controller color
//    frontNavigationController.navigationBar.barTintColor = UIColor(red: 213/255.0, green: 87/255.0, blue: 58/255.0, alpha: 1.0)
//    rearNavigationController.navigationBar.isHidden = false
//    revealController.frontViewController = frontNavigationController
//    // if menu in right
//    //    revealController.rightViewController = rearNavigationController
//    // from left
//    revealController.rearViewController = rearNavigationController
//    //    revealController.toggleAnimationDuration = 0.5
//    //    revealController.replaceViewAnimationDuration = 0.5
//    revealController.toggleAnimationType = .easeOut
//    return revealController
//}

// MARK: - Use this in drag view

/**
 progressAlongAxis
 */

public func progressAlongAxis(_ pointOnAxis: CGFloat, _ axisLength: CGFloat) -> CGFloat {
    let movementOnAxis = pointOnAxis / axisLength
    let positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
    let positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
    return CGFloat(positiveMovementOnAxisPercent)
}

/**
 ensureRange
 */

public func ensureRange<T>(value: T, minimum: T, maximum: T) -> T where T : Comparable {
    return min(max(value, minimum), maximum)
}

// MARK: - call Custom Info Alert to UIViewController

/**
 call Custom Info Alert to UIViewController
 */

public func callCustomInfoAlert(title: String, message: String, uIView: UIViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertWithInfoViewController = storyBoard.instantiateViewController(withIdentifier: "AlertWithInfoVC") as! AlertWithInfoViewController
//
//    alertWithInfoViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertWithInfoViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    alertWithInfoViewController.customAlertTitle = title
//    alertWithInfoViewController.customAlertMessage = message
//
//    alertWithInfoViewController.delegate = uIView as? CustomAlertDelegate
//    uIView.present(alertWithInfoViewController, animated:true, completion:nil)
}

// MARK: - callCustom Info Alert to UITableViewController

/**
 call Custom Info Alert to UITableViewController
 */

public func callCustomInfoAlert(title: String, message: String, uIView: UITableViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertWithInfoViewController = storyBoard.instantiateViewController(withIdentifier: "AlertWithInfoVC") as! AlertWithInfoViewController
//
//    alertWithInfoViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertWithInfoViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    alertWithInfoViewController.customAlertTitle = title
//    alertWithInfoViewController.customAlertMessage = message
//
//    alertWithInfoViewController.delegate = uIView as? CustomAlertDelegate
//    uIView.present(alertWithInfoViewController, animated:true, completion:nil)
}

// MARK: - call Custom Try Again Alert to UIViewController

/**
 call Custom Try Again Alert to UIViewController
 */

public func callCustomTryAgainAlert(title: String, message: String, uIView: UIViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertTryAgainController = storyBoard.instantiateViewController(withIdentifier: "AlertTryAgainVC") as! AlertTryAgainViewController
//
//    alertTryAgainController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertTryAgainController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    alertTryAgainController.customAlertTitle = title
//    alertTryAgainController.customAlertMessage = message
//
//    alertTryAgainController.delegate = uIView as? CustomAlertDelegate
//    uIView.present(alertTryAgainController, animated:true, completion:nil)
}

// MARK: - callCustom Try Again Alert to UITableViewController

/**
 callCustom Try Again Alert to UITableViewController
 */

public func callCustomTryAgainAlert(title: String, message: String, uIView: UITableViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertTryAgainController = storyBoard.instantiateViewController(withIdentifier: "AlertTryAgainVC") as! AlertTryAgainViewController
//
//    alertTryAgainController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertTryAgainController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    alertTryAgainController.customAlertTitle = title
//    alertTryAgainController.customAlertMessage = message
//
//    alertTryAgainController.delegate = uIView as? CustomAlertDelegate
//    uIView.present(alertTryAgainController, animated:true, completion:nil)
}

// MARK: - call Custom Try Again Alert to UIViewController

/**
 call Custom Try Again Alert to UIViewController
 */

public func callCustomAlertWithDatePicker(title: String, message: String, uIView: UIViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertWithDatePicker = storyBoard.instantiateViewController(withIdentifier: "AlertWithDatePickerVC") as! AlertWithDatePickerViewController
//
//    alertWithDatePicker.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertWithDatePicker.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    //    alertWithDatePicker.customAlertTitle = title
//    //    alertWithDatePicker.customAlertMessage = message
//
//    alertWithDatePicker.delegate = uIView as? CustomAlertDatePickerDelegate
//    uIView.present(alertWithDatePicker, animated:true, completion:nil)
}

// MARK: - callCustom Try Again Alert to UITableViewController

/**
 callCustom Try Again Alert to UITableViewController
 */

public func callCustomAlertWithDatePicker(title: String, message: String, uIView: UITableViewController) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle:nil)
//
//    let alertWithDatePicker = storyBoard.instantiateViewController(withIdentifier: "AlertWithDatePickerVC") as! AlertWithDatePickerViewController
//
//    alertWithDatePicker.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//    alertWithDatePicker.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//
//    //    alertWithDatePicker.customAlertTitle = title
//    //    alertWithDatePicker.customAlertMessage = message
//
//    alertWithDatePicker.delegate = uIView as? CustomAlertDatePickerDelegate
//    uIView.present(alertWithDatePicker, animated:true, completion:nil)
}

// MARK: - Set conrner radius with bordercolor

/**
 Set conrner radius with bordercolor
 */

public func setBorderWithColor(for view: UIView, borderColor: CGColor, borderWidth: CGFloat, radius: CGFloat) {
    
    view.clipsToBounds = true
    view.layer.masksToBounds = true
    view.layer.cornerRadius = radius
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = borderColor
}

// MARK: - Set conrner radius with bordercolor

/**
 Set conrner radius with bordercolor for iOS 11
 */

@available(iOS 11.0, *)
public func setTopBottomRoundedCorners(for view: UIView, radius: CGFloat, whichCorner: String?, oneCorner: Bool) {
    
    view.clipsToBounds = true
    view.layer.masksToBounds = true
    view.layer.cornerRadius = radius
    
    if oneCorner == true {
        
        switch whichCorner {
        case "lowerRightCorner":
            view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        case "topRightCorner":
            view.layer.maskedCorners = [.layerMaxXMinYCorner]
        case "lowerLeftCorner":
            view.layer.maskedCorners = [.layerMinXMaxYCorner]
        case "topLeftCorner":
            view.layer.maskedCorners = [.layerMinXMinYCorner]
        default:
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
        
    } else {
        
        switch whichCorner {
        case "Top":
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case "Bottom":
            view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case "Right":
            view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        case "Left":
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        default:
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
}

/**
 Set conrner radius with bordercolor for iOS 10
 */

@available(iOS 10.0, *)
public func setTopBottomRoundedCorners(for view: UIView, cornerRadius: CGFloat, whichCorner: String?, oneCorner: Bool) {
    
    var path = UIBezierPath()
    
    if oneCorner == true {
        
        switch whichCorner {
        case " lowerRightCorner":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "topRightCorner":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "lowerLeftCorner":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "topLeftCorner":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        default:
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        }
        
    } else {
        
        switch whichCorner {
        case "Top":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "Bottom":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "Right":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomRight, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case "Left":
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        default:
            path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        }
    }
    
    let maskLayer = CAShapeLayer()
    maskLayer.frame = view.bounds
    maskLayer.path = path.cgPath
    view.layer.mask = maskLayer
}

// MARK: - Make Circular Shape with View

/**
 Make Circular Shape with View
 */

public func makeCircularShape(withView: UIView) {
    
    withView.layer.cornerRadius = withView.frame.size.width / 2
    withView.clipsToBounds = true
}

// MARK: - Make Shape Not Hide

/**
 Make Shape Not Hide
 */

public func isNotHideViews (shaps: [UIView]) {
    
    for item in shaps {
        item.isHidden = false
    }
}

// MARK: - Make Shape Hide

/**
 Make Shape Hide
 */

public func isHideViews (shaps: [UIView]) {
    
    for item in shaps {
        item.isHidden = true
    }
}

// MARK: - Make Labels Empty

/**
 Make Labels Empty
 */

func makeLabelsEmpty(labels: [UILabel]) {
    
    for item in labels {
        item.text = ""
    }
}

// MARK: - Make TextFields Empty

/**
 Make TextFields Empty
 */

func makeTextFieldsEmpty(textFields: [UITextField]) {
    
    for item in textFields {
        item.text = ""
    }
}


// MARK: - validate email

/**
 validate email
 */

public func isValidEmail( _ testStr:String) -> Bool {
    
    print("validate emilId: \(testStr)")
    let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: testStr)
    return result
}

// MARK: - Validate optional String

/**
 Validate optional String
 */

public func validateString( _ text:String?) -> String {
    
    return text ?? ""
}

// MARK: - Validate optional int

/**
 Validate optional int
 */

public func validateInt( _ val:Int?) -> Int {
    
    return val ?? 0
}
