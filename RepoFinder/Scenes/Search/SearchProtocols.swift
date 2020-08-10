//
//  SearchProtocols.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

/**
View -> Presenter (Any action)
 Action:
 1-Navigation action -> Call Router
 2-Responding to user interaction actions -> Call Router / Interactor
 3-Call to get data -> Call to interactor only
**/

protocol SearchRouterProtocol {
    func navigate()
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    func searchRepos(query: String)
    var numberOfRows: Int { get }
    func configure(cell: RepositoriesCellView, at index: Int)
}

protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    func searchRepos(query: String, perPage: Int, page: Int)
}

protocol SearchInteractorOutputProtocol: class {
    func reposFetchedSuccessfully(repos: Repositories)
    func reposFetchingFailed(with error: Error)
}

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    func reloadData()
    func showProgressBar()
    func hideProgressBar()
}

protocol RepositoriesCellView {
    func configure(viewModel: RepoViewModel)
}
