//
//  RepoFinderTests.swift
//  RepoFinderTests
//
//  Created by Abdelrahman Mohamed on 11/4/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import XCTest
@testable import Firebase
@testable import RepoFinder

class RepoFinderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRepositories() {
        let repositoriesViewModel = RepositoriesViewModel()
        let url = "\(Network.searchUsersUrl)?q=\("Obadasemary")&per_page=\(100)&page=\(1)"
        repositoriesViewModel.getOwners(url: url, viewController: SearchViewController(), parameters: nil)
        repositoriesViewModel.ownersObserver.bind { (result) in
            DispatchQueue.main.async {
                XCTAssertEqual("Obadasemary", result?.items?[0].login)
            }
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
