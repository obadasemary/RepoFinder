//
//  AlertView.swift
//  Basefy
//
//  Created by Basefy on 22/03/2017.
//  Copyright © 2017 Basefy. All rights reserved.
//

import Foundation
import UIKit

class AlertView {
    
    static func show(in viewController: UIViewController, title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "done".localized(), style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showError(in viewController: UIViewController, message: String?) {
        let alert = UIAlertController(title: "error".localized(), message: message ?? "errorHappenedTryAgain".localized(), preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "done".localized(), style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func show(in viewController: UIViewController, title: String?, message: String?, completion : @escaping () -> (Void)) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "done".localized(), style: .default) { action in
            completion()
        })
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showWithCancelButton(in viewController: UIViewController, title: String?, message: String?, completion : @escaping () -> (Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel))
        alert.addAction(UIAlertAction(title: "done".localized(), style: .default) { action in
            completion()
        })
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showYesNo(in viewController: UIViewController, title: String?, message: String?, completion : @escaping () -> (Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel))
        alert.addAction(UIAlertAction(title: "Evet", style: .default) { action in
            completion()
        })
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showWithTextField(in viewController: UIViewController, title: String?, message: String?, completion: @escaping (_ entredValue: String?) -> Void) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = message
        }
        
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel))
        
        
        alert.addAction(UIAlertAction(title: "done".localized(), style: .default, handler: { [weak alert] (_) in
        
            let textField = alert?.textFields![0]
            completion(textField?.text)
        }))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showNotification(in viewController: UIViewController, message: String?, completion : @escaping () -> (Void)) {
        
        let alert = UIAlertController(title: "newNotification".localized(), message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "close".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "show".localized(), style: .default) { action in
            completion()
        })
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
