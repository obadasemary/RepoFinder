//
//  SearchRouter.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 8.03.2019.
//  Copyright © 2019 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class SearchRouter: SearchRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
    func navigate() {
        
    }
}
