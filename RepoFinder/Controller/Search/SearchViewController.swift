//
//  SearchViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

private let repositoriesTableViewCell = "RepositoriesTableViewCell"

//protocol SeeOwnerVCDelegate {
//    func completionSeeOwnerVCHandler(_ viewController: PostDetailsViewController ,UserOfPost: DataClassPostListResponse?)
//}

class SearchViewController: BaseViewController {

    // MARK: - shared
    
    static let shared = SearchViewController()
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - init
    
    var repositories: Repositories?
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = Color.black.value
    }
    
    // MARK: - initUI
    
    func initUI() {
        searchController.delegate = self
//        searchController.backgroundColor = 
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
        self.tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView.reloadData()
    }
}
