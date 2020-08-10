//
//  SearchInteractor.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    
    var presenter: SearchInteractorOutputProtocol?
    
    private let reposWorker = RepoistoriesWorker()
    
    func searchRepos(query: String, perPage: Int, page: Int) {
        reposWorker.search(query: query, perPage: perPage, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repos):
                self.presenter?.reposFetchedSuccessfully(repos: repos)
            case .failure(let error):
                self.presenter?.reposFetchingFailed(with: error)
            }
        }
    }
    
}
