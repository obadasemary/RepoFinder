//
//  PhoneFormatter.swift
//  FactoMobile
//
//  Created by Abdelrahman Mohamed on 6/21/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

var phoneFormatter : PhoneFormatter {
    return PhoneFormatter.sharedInstance
}

class PhoneFormatter : NSObject {
    
    static let sharedInstance : PhoneFormatter = PhoneFormatter()
    
    func formatToPhoneNumber(withPhoneTextField: UITextField, tableTextField: UITextField, range: NSRange, string: String) -> Bool {
        
        if (tableTextField == withPhoneTextField) {
            
            let newString = (tableTextField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 11 && !hasLeadingOne) || length > 12 {
                let newLength = (tableTextField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 11) ? false : true
            }
            
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne {
                formattedString.append("1 ")
                index += 1
            }
            
            if (length - index) > 1{
                let zeroNumber = decimalString.substring(with: NSMakeRange(index, 1))
                formattedString.appendFormat("%@ ", zeroNumber)
                index += 1
            }
            
            if (length - index) > 3 {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@) ", areaCode)
                index += 3
            }
            
            if length - index > 3 {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@ ", prefix)
                index += 3
            }
            
            if (length - index) > 3{
                let prefix = decimalString.substring(with: NSMakeRange(index, 2))
                formattedString.appendFormat("%@ ", prefix)
                index += 2
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            tableTextField.text = formattedString as String
            
            return false
        } else {
            return true
        }
    }
}
