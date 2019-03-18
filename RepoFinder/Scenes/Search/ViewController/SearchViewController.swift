//
//  SearchViewController.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import PKHUD

class SearchViewController: BaseViewController, SearchViewProtocol {

    var presenter: SearchPresenterProtocol?
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let segment: UISegmentedControl = UISegmentedControl(items: ["Repositories", "Users"])
    
    // MARK: - viewDidLoad

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleView()
        setupSearchController()
        setupTableView()
    }

    
    private func setupTableView() {
        tableView.register(OwnerTableViewCell.nib, forCellReuseIdentifier: OwnerTableViewCell.className)
        tableView.register(RepositoriesTableViewCell.nib, forCellReuseIdentifier: RepositoriesTableViewCell.className)
        tableView.layer.cornerRadius = 20
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.backgroundColor = Color.white.value
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func setupSearchController() {
        searchController.delegate = self
        searchController.tintColor = UIColor.rgb(red: 69, green: 79, blue: 99)
        searchController.barTintColor = Color.white.value // color of text field background
        searchController.backgroundColor = .clear
        searchController.setTextFieldColor(color: UIColor.rgb(red: 69, green: 79, blue: 99))
        searchController.searchBarStyle = .minimal
    }
    
    private func setupTitleView() {
        segment.sizeToFit()
        segment.tintColor = UIColor.rgb(red: 69, green: 79, blue: 99)
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([NSAttributedStringKey.font: Font(.installed(.regular), size: .standard(.h2)).instance], for: .normal)
        navigationItem.titleView = segment
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showProgressBar() {
        HUD.show(.progress)
    }
    
    func hideProgressBar() {
        HUD.hide()
    }
}
