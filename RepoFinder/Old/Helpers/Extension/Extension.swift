//
//  Extension.swift
//  Basefy
//
//  Created by Basefy on 02/05/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import Foundation
import UIKit

private var handle: UInt8 = 0;

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension UIImage {
    static func from(color: UIColor, width: Int, height: Int) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageLayer = CALayer()
        imageLayer.frame = CGRect(x: 0, y: 0, width: img!.size.width, height: img!.size.height)
        imageLayer.contents = img!.cgImage
        
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = 20
        
        UIGraphicsBeginImageContext(img!.size)
        imageLayer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage!
    }
}

extension UIBarButtonItem {
    private var badgeLayer: CAShapeLayer? {
        if let b = objc_getAssociatedObject(self, &handle) {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    func setBadgeNumber(number: Int) {
        if number <= 0 {
            self.removeBadge()
        } else {
            if badgeLayer?.superlayer == nil {
                self.addBadge(number: number)
            } else {
                self.updateBadge(number: number)
            }
        }
    }
    
    func addBadge(number: Int) {
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        badgeLayer?.removeFromSuperlayer()
        
        // Initialize Badge
        let badge = CAShapeLayer()
        let radius = CGFloat(7)
        let location = CGPoint(x: view.frame.width - radius/2, y: -radius/2)
        badge.drawCircle(at: location, radius: radius)
        view.layer.addSublayer(badge)
        
        // Initialiaze Badge's label
        let label = CATextLayer()
        label.string = "\(number)"
        label.alignmentMode = kCAAlignmentCenter
        label.fontSize = 11
        label.frame = CGRect(origin: CGPoint(x: location.x - 4, y: location.y), size: CGSize(width: 15, height: 14))
        label.foregroundColor = Color.white.value.cgColor
        label.backgroundColor = Color.clear.value.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)
        
        // Save Badge as UIBarButtonItem property
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func updateBadge(number: Int) {
        if let text = badgeLayer?.sublayers?.filter({ $0 is CATextLayer }).first as? CATextLayer {
            text.string = "\(number)"
        }
    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
}

extension CAShapeLayer {
    func drawCircle(at location: CGPoint, radius: CGFloat) {
        fillColor = Color.spinner.value.cgColor
        strokeColor = Color.spinner.value.cgColor
        let origin = CGPoint(x: location.x - radius/2, y: location.y)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}

extension UINavigationBar {
    func hideBottomHairline() {
        self.hairlineImageView?.isHidden = true
    }
    
    func showBottomHairline() {
        self.hairlineImageView?.isHidden = false
    }
}

extension UIToolbar {
    func hideBottomHairline() {
        self.hairlineImageView?.isHidden = true
    }
    
    func showBottomHairline() {
        self.hairlineImageView?.isHidden = false
    }
}

extension UIView {
    fileprivate var hairlineImageView: UIImageView? {
        return hairlineImageView(in: self)
    }
    
    fileprivate func hairlineImageView(in view: UIView) -> UIImageView? {
        if let imageView = view as? UIImageView, imageView.bounds.height <= 1.0 {
            return imageView
        }
        
        for subview in view.subviews {
            if let imageView = self.hairlineImageView(in: subview) { return imageView }
        }
        
        return nil
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIImageView {
    
//    func setImageUrl(_ imageUrlString: String?, type: ImagePlaceholderType) {
//        let placeholderImage = type == .product ? UIImage(named: "loadingImageByWinter")! : UIImage(named: "seller")!
//        
//        if placeholderImage.size.width > self.bounds.size.width ||
//            placeholderImage.size.height > self.bounds.size.height {
//            self.contentMode = .scaleAspectFit
//        } else {
//            self.contentMode = .center
//        }
//        
//        self.tintColor = Color.primary.value
//        
//        if let urlString = imageUrlString, urlString != "" {
//            
//            let characterSet = CharacterSet.whitespaces.inverted
//            
//            let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: characterSet)!)
//            
//            self.kf.setImage(with: url, placeholder: placeholderImage, options: nil, progressBlock: nil) { image, error, type, url in
//    
//                if image != nil {
//                    self.contentMode = .scaleAspectFill
//                    self.tintColor = nil
//                    self.layoutMargins = UIEdgeInsets.zero
//                }
//            }
//        } else {
//            self.image = placeholderImage
//        }
//    }
}

extension Dictionary {
    func showJsonParameters() -> String {
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: self,
            options: []) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            
            return theJSONText ?? "Cannot convert json data to string"
        }
        
        return "Cannot parse the dictionary"
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func removeZeroAndWhiteSpacesAndBrackets() -> String {
        
        let formattedStringWithoutZero = String(self.dropFirst())
        let formattedStringWithoutWhiteSpaces = formattedStringWithoutZero.replacingOccurrences(of: " ", with: "")
        let formattedStringWithoutLeftBracket = formattedStringWithoutWhiteSpaces.replacingOccurrences(of: "(", with: "")
        let formattedStringWithoutRightBracket = formattedStringWithoutLeftBracket.replacingOccurrences(of: ")", with: "")
        
        return formattedStringWithoutRightBracket
    }
    
    func toAppropriateCurrentSymbol() -> String {
        switch self {
        case "TL":
            return "₺"
        default:
            return "₺"
        }
    }
    
    func toAppropriateDateForCoupons() -> String {
        let dateFormatter = DateFormatter()
        if self.count > 25 {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        }
        
        dateFormatter.locale = Locale.current
        if let date = dateFormatter.date(from: self) {
            
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            //myDateFormatter.locale = Locale.current
            
            return myDateFormatter.string(from: date)
        }
        
        return ""
    }
    
    func toAppropriateDate()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale.current
        if let date = dateFormatter.date(from: self) {
            let elapsedTime = Date().timeIntervalSince(date)
            
            let y = div(Int32(elapsedTime), 86400  * 365)
            let year = y.quot
            
            let mt = div(y.rem, 86400 * 30)
            let months = mt.quot
            
            let w = div(mt.rem, 86400 * 7)
            let weeks = w.quot
            
            let d = div(w.rem, 86400)
            let days = d.quot
            
            let h = div(d.rem, 3600)
            let hours = h.quot
            
            let m = div(h.rem, 60)
            let minutes = m.quot
            
            
            var passedTimeString = ""
            if year > 0 {
                passedTimeString = "\(year)\("years".localized())"
            } else if months > 0 {
                passedTimeString = "\(months)\("months".localized())"
            } else if weeks > 0 {
                passedTimeString = "\(weeks)\("weeks".localized())"
            } else if days > 0 {
                passedTimeString = "\(days)\("days".localized())"
            } else if hours > 0 {
                passedTimeString = "\(hours)\("hours".localized())"
            } else if minutes > 0 {
                passedTimeString = "\(minutes)\("minutes".localized())"
            }
            
            return passedTimeString;
        }
        
        return ""
    }
    
    func index(of target: String) -> Int? {
        if let range = self.range(of: target) {
            return characters.distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func lastIndex(of target: String) -> Int? {
        if let range = self.range(of: target, options: .backwards) {
            return characters.distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
}

extension Double {
    
    func roundedString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .up
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension Data {
    var format: String {
        let array = [UInt8](self)
        let ext: String
        switch (array[0]) {
        case 0xFF:
            ext = "jpg"
        case 0x89:
            ext = "png"
        case 0x47:
            ext = "gif"
        case 0x49, 0x4D :
            ext = "tiff"
        default:
            ext = "unknown"
        }
        return ext
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func onDrage(_ sender:UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.3
        let translation = sender.translation(in: view)
        
        let newY = ensureRange(value: view.frame.minY + translation.y, minimum: 0, maximum: view.frame.maxY)
        let progress = progressAlongAxis(newY, view.bounds.height)
        
        view.frame.origin.y = newY //Move view to new position
        
        if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            if velocity.y >= 300 || progress > percentThreshold {
                self.dismiss(animated: true) //Perform dismiss
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.frame.origin.y = 0 // Revert animation
                })
            }
        }
        
        sender.setTranslation(.zero, in: view)
    }
}

extension UIButton {
    
    
}

extension Formatter {
    static let rfc3339: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: (Language.currentLanguage() == "tr") ? "tr" : "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }()
}

extension Date {
    var rfc3339: String {
        return Formatter.rfc3339.string(from: self)
    }
}

extension String {
    var dateFromRFC3339: Date? {
        return Formatter.rfc3339.date(from: self)
    }
    
    var printDateFormat: String? {
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        
        return dateFormatterPrint.string(from:  self.dateFromRFC3339!)
        
    }
}

extension Decimal {
    
    var formattedDecimalValue: String? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.locale = Locale(identifier: "tr")
        
        return formatter.string(from: NSNumber(value: (self as NSDecimalNumber).doubleValue))
    }
}

extension UITableView {
    
    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.numberOfRows(inSection: self.numberOfSections - 1) - 1, section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
