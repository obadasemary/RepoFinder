//
//  BaseViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/3/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Color.white.value
        self.navigationController?.navigationBar.barTintColor = Color.white.value
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    // MARK: - viewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = Color.black.value
    }
    
    // MARK: - preferredStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
