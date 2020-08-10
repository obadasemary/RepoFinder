//
//  SearchPresenter.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

struct RepoViewModel {
    
    let avatarUrl: String
    let username: String
    let name: String
    
    init(item: Item) {
        avatarUrl = item.owner?.avatarURL ?? ""
        username = item.owner?.login ?? ""
        name = item.name ?? ""
    }
    
}

class SearchPresenter: SearchPresenterProtocol, SearchInteractorOutputProtocol {
    
    var view: SearchViewProtocol?
    private let interactor: SearchInteractorInputProtocol
    private let router: SearchRouterProtocol
    private let perPage = 100
    private let currentPage = 1
    
    private var repos: [Item]?
    
    var numberOfRows: Int {
        return repos?.count ?? 0
    }
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func searchRepos(query: String) {
        view?.showProgressBar()
        interactor.searchRepos(query: query, perPage: perPage, page: currentPage)
    }
    
    func reposFetchedSuccessfully(repos: Repositories) {
        view?.hideProgressBar()
        self.repos = repos.items
        view?.reloadData()
    }
    
    func reposFetchingFailed(with error: Error) {
        view?.hideProgressBar()
        print(error.localizedDescription)
    }
    
    func configure(cell: RepositoriesCellView, at index: Int) {
        guard let repos = repos else { return }
        let repo = repos[index]
        let viewModel = RepoViewModel(item: repo)
        cell.configure(viewModel: viewModel)
    }
}


