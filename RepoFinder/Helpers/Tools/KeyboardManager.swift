//
//  KeyboardManager.swift
//  Basefy
//
//  Created by Basefy on 22/08/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import IQKeyboardManagerSwift

class KeyboardManager {
    
    static func configure() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "done".localized()
//        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(NewCommentVC.self)
//        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(OrderRejectReasonVC.self)
    }
}
