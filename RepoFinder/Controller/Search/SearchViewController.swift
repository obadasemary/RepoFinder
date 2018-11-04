//
//  SearchViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

private let ownerTableViewCell = "OwnerTableViewCell"
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
    var owners: Owners?
    let segment: UISegmentedControl = UISegmentedControl(items: ["Repositories", "Users"])
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    // MARK: - initUI
    
    func initUI() {
        
        segment.sizeToFit()
        segment.tintColor = UIColor.rgb(red: 69, green: 79, blue: 99)
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([NSAttributedStringKey.font: Font(.installed(.regular), size: .standard(.h2)).instance], for: .normal)
        self.navigationItem.titleView = segment
        
        searchController.delegate = self
        searchController.tintColor = UIColor.rgb(red: 69, green: 79, blue: 99)
        searchController.barTintColor = Color.white.value // color of text field background
        searchController.backgroundColor = .clear
        searchController.setTextFieldColor(color: UIColor.rgb(red: 69, green: 79, blue: 99))
        searchController.searchBarStyle = .minimal
        
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
        self.tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView.reloadData()
    }
}
