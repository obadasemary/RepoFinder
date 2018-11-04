//
//  RepositoryDetailsViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/2/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

private let repositoryDetailsTableViewCell = "RepositoryDetailsTableViewCell"

class RepositoryDetailsViewController: BaseViewController {
    
    // MARK: - shared
    
    static let shared = RepositoryDetailsViewController()
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - init
    
    var item: Item?
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.barTintColor = Color.white.value
    }
    
    // MARK: - initUI
    
    func initUI() {
        self.tableView.register(UINib(nibName: repositoryDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: repositoryDetailsTableViewCell)
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
        self.tableView.allowsSelection = false
        self.tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView.reloadData()
    }
}
