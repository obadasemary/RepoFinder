//
//  Color.swift
//  Basefy
//
//  Created by Basefy on 17/03/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import Foundation
import UIKit

enum Color {
    
    case facebook
    case twitter
    case instagram
    
    case white
    case gray
    case lightGray
    case darkGray
    case black
    case clear
    
    case mainViewBackground
    
    case youthGray
    
    case tableViewBackground
    
    case page_menu_selected
    case page_menu_unselected
    
    case navigation_bar
    case navigationTitleColor
    case spinner
    
    case tab_bar_selected
    case tab_bar_unselected
    
    case border
    case shadow
    
    case darkText
    case lightText
    case intermidiateText
    
    case affirmation
    case negation
    case warning
    case primary
    
    case BAKANLIK
    case AKADEMİ
    case VAKIF
    case MUCİZE_BEBEKLER_TV
    
    case Bakanlık
    case Akademi
    case Vakıf
    
    // 1
    case custom(hexString: String, alpha: Double)
    // 2
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .facebook:
            instanceColor = UIColor(hexString: "#3B5998")
        case .twitter:
            instanceColor = UIColor(hexString: "#55ACEE")
        case .instagram:
            instanceColor = UIColor(hexString: "#E95950")
        case .white:
            instanceColor = UIColor.white
        case .clear:
            instanceColor = UIColor.clear
        case .gray:
            instanceColor = UIColor.gray
        case .lightGray:
            instanceColor = UIColor.lightGray
        case .darkGray:
            instanceColor = UIColor.darkGray
        case .black:
            instanceColor = UIColor.black
        case .border:
            instanceColor = UIColor(hexString: "#F4FAFF")
        case .youthGray:
            instanceColor = UIColor(hexString: "#4F4B4C")
        case .navigation_bar:
            instanceColor = UIColor.white
        case .navigationTitleColor:
            instanceColor = UIColor.rgb(red: 128, green: 8, blue: 131)
        case .tab_bar_selected:
            instanceColor = UIColor.white
        case .tab_bar_unselected:
            instanceColor = UIColor(hexString: "#cccccc")
        case .page_menu_selected:
            instanceColor = UIColor.rgb(red: 128, green: 8, blue: 131)
        case .page_menu_unselected:
            instanceColor = UIColor.rgb(red: 198, green: 198, blue: 198)
        case .spinner:
            instanceColor = UIColor(hexString: "#800883")
        case .mainViewBackground:
            instanceColor = UIColor.rgb(red: 246, green: 246, blue: 248)
        case .tableViewBackground:
            instanceColor = UIColor(hexString: "#F3F3F3")
        case .shadow:
            instanceColor = UIColor(hexString: "#cccccc")
        case .darkText:
            instanceColor = UIColor(hexString: "#000000")
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#1C1C1C")
        case .lightText:
            instanceColor = UIColor(hexString: "#424242")
        case .affirmation:
            instanceColor = UIColor(hexString: "#84BF41")
        case .negation:
            instanceColor = UIColor(hexString: "#DB5461")
        case .warning:
            instanceColor = UIColor(hexString: "#F6A704")
        case .primary:
            instanceColor = UIColor(hexString: "#800883")
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        case .BAKANLIK:
            instanceColor = UIColor.rgb(red: 128, green: 8, blue: 131)
        case .Bakanlık:
            instanceColor = UIColor.rgb(red: 128, green: 8, blue: 131)
        case .AKADEMİ:
            instanceColor = UIColor.rgb(red: 146, green: 125, blue: 253)
        case .Akademi:
            instanceColor = UIColor.rgb(red: 146, green: 125, blue: 253)
        case .VAKIF:
            instanceColor = UIColor.rgb(red: 255, green: 0, blue: 115)
        case .Vakıf:
            instanceColor = UIColor.rgb(red: 255, green: 0, blue: 115)
        case .MUCİZE_BEBEKLER_TV:
            instanceColor = UIColor.rgb(red: 253, green: 198, blue: 49)
        }
        return instanceColor
    }
}

extension UIColor {
    
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    /**
     Creates an UIColor Object based on provided RGB value in integer
     - parameter red:   Red Value in integer (0-255)
     - parameter green: Green Value in integer (0-255)
     - parameter blue:  Blue Value in integer (0-255)
     - returns: UIColor with specified RGB values
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    
    func applyGradient(colours: [UIColor],cornerRadius: CGFloat = 0) -> Void {
        self.applyGradient(colours: colours, locations: nil, cornerRadius:cornerRadius)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?, cornerRadius: CGFloat = 0) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.cornerRadius = cornerRadius
        gradient.bounds = self.bounds
        gradient.masksToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.masksToBounds = true
        
    }
}
