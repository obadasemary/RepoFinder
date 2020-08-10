//
//  RightLeftIconButton.swift
//  FactoMobile
//
//  Created by Abdelrahman Mohamed on 4/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

@IBDesignable
class RightLeftIconButton: BorderButton {
    
    var rightIcon: UIImageView!
    var leftIcon: UIImageView!
    var isFirstLoad: Bool = true
    var indexPath = Int()
    var section = Int()
    
    @IBInspectable var rightImageIcon: UIImage? {
        didSet {
            if rightImageIcon != nil {
                self.rightIcon = UIImageView(image: rightImageIcon!)
                self.addSubview(self.rightIcon)
            }
        }
    }
    
    @IBInspectable var leftImageIcon: UIImage? {
        didSet {
            if leftImageIcon != nil {
                self.leftIcon = UIImageView(image: leftImageIcon!)
                self.addSubview(self.leftIcon)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.isFirstLoad && rightImageIcon != nil && leftImageIcon != nil {
            
            self.rightIcon.frame = CGRect(x: self.frame.width - 16 - rightImageIcon!.size.width, y: (self.frame.height - rightImageIcon!.size.height) / 2, width: rightImageIcon!.size.width, height: rightImageIcon!.size.height)
            self.leftIcon.frame = CGRect(x: 16, y: (self.frame.height - leftImageIcon!.size.height) / 2, width: leftImageIcon!.size.width, height: leftImageIcon!.size.height)
            self.isFirstLoad = false
        } else if self.isFirstLoad && rightImageIcon != nil {
            
            self.rightIcon.frame = CGRect(x: self.frame.width - 16 - rightImageIcon!.size.width, y: (self.frame.height - rightImageIcon!.size.height) / 2, width: rightImageIcon!.size.width, height: rightImageIcon!.size.height)
            self.isFirstLoad = false
        } else if self.isFirstLoad && leftImageIcon != nil {
            
            self.leftIcon.frame = CGRect(x: 16, y: (self.frame.height - leftImageIcon!.size.height) / 2, width: leftImageIcon!.size.width, height: leftImageIcon!.size.height)
            self.isFirstLoad = false
        } else {
            
            return
        }
        
//        if isBoth {
//            if self.isFirstLoad && rightImageIcon != nil && leftImageIcon != nil {
//                self.rightIcon.frame = CGRect(x: self.frame.width - 16 - rightImageIcon!.size.width, y: (self.frame.height - rightImageIcon!.size.height) / 2, width: rightImageIcon!.size.width, height: rightImageIcon!.size.height)
//                self.leftIcon.frame = CGRect(x: 16, y: (self.frame.height - leftImageIcon!.size.height) / 2, width: leftImageIcon!.size.width, height: leftImageIcon!.size.height)
//                self.isFirstLoad = false
//            }
//        } else {
//            if isRight {
//                if self.isFirstLoad && rightImageIcon != nil {
//                    self.rightIcon.frame = CGRect(x: self.frame.width - 16 - rightImageIcon!.size.width, y: (self.frame.height - rightImageIcon!.size.height) / 2, width: rightImageIcon!.size.width, height: rightImageIcon!.size.height)
//                    self.isFirstLoad = false
//                }
//            } else {
//                if self.isFirstLoad && leftImageIcon != nil {
//                    self.leftIcon.frame = CGRect(x: 16, y: (self.frame.height - leftImageIcon!.size.height) / 2, width: leftImageIcon!.size.width, height: leftImageIcon!.size.height)
//                    self.isFirstLoad = false
//                }
//            }
//        }
    }
}
