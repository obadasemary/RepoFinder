//
//  BaseViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/3/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Color.white.value
        self.navigationController?.navigationBar.barTintColor = Color.black.value
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
