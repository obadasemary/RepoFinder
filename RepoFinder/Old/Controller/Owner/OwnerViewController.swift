//
//  OwnerViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/4/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

private let ownerTableViewCell = "OwnerTableViewCell"
private let repositoriesTableViewCell = "RepositoriesTableViewCell"

class OwnerViewController: BaseViewController, NVActivityIndicatorViewable {

    // MARK: - shared
    
    static let shared = RepositoryDetailsViewController()
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - init
    
    let sizeNVActivityIndicator = CGSize(width: 30, height:30)
    var owner: Owner?
    var item: [Item]?
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        guard let ownerLogin = owner?.login else { return }
        
        startAnimating(sizeNVActivityIndicator, message: "", type: .ballClipRotateMultiple)
        
        callGetOwner(viewController: self, ownerLogin: ownerLogin) { (success, owner) in
            
            if success {
                self.owner = owner
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.stopAnimating()
                }
            }
        }
        
        callGetOwnerRepos(viewController: self, ownerLogin: ownerLogin) { (success, repos) in
            if success {
                self.item = repos
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.stopAnimating()
                }
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.stopAnimating()
                }
            }
        }
    }
    
    // MARK: - initUI
    
    func initUI() {
        self.tableView.register(UINib(nibName: ownerTableViewCell, bundle: nil), forCellReuseIdentifier: ownerTableViewCell)
        self.tableView.register(UINib(nibName: repositoriesTableViewCell, bundle: nil), forCellReuseIdentifier: repositoriesTableViewCell)
        self.tableView.layer.cornerRadius = 20
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 300
        self.tableView.estimatedSectionHeaderHeight = 0
        self.tableView.estimatedSectionFooterHeight = 0
        self.tableView.separatorStyle = .none
        self.tableView.bounces = false
        self.tableView.backgroundColor = Color.white.value
//        self.tableView.allowsSelection = false
        self.tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView.reloadData()
    }
}
