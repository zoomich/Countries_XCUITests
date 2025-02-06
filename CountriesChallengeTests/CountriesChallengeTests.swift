//
//  CountriesChallengeTests.swift
//  CountriesChallengeTests
//

import XCTest
@testable import CountriesChallenge

class CountriesChallengeTests: XCTestCase {
    
    enum CountriesServiceError: Error, Equatable {
    }
    
    var viewController: CountriesViewController!
    var mockViewModel: MockCountriesViewModel!

    override func setUpWithError() throws {
        super.setUp()
        mockViewModel = MockCountriesViewModel()
        viewController = CountriesViewController()
        viewController.viewModel = mockViewModel
    }

    override func tearDownWithError() throws {
        viewController = nil
        mockViewModel = nil
        super.tearDown()
    }

    
    func test_01_VerifyRefreshesCountriesViewLoaded() {
        viewController.viewModel = mockViewModel
        viewController.viewDidLoad()
        XCTAssertTrue(mockViewModel.refreshCountriesCalled)
        }
    
    func test_02_VerifyRefreshCountriesRefreshCallsCalled() {
            viewController.refresh(UIRefreshControl())
            XCTAssertTrue(mockViewModel.refreshCountriesCalled)
        }
    
    func test_03_VerifyStartsActivityIndicatorViewLoaded() {
            viewController.viewDidLoad()
            XCTAssertTrue(viewController.activityIndicator.isAnimating)
        }
    
    func test_04_VerifyNumberOfRowsInTableView() {
        let tableView = viewController.tableViewVar

        let mockDataSource = MockTableViewDataSource()
        tableView.dataSource = mockDataSource

        let rowCount = 3
        mockDataSource.rowCount = rowCount

        let numberOfRowsInSection = viewController.tableView(tableView, numberOfRowsInSection: 0)

        XCTAssertNotEqual(numberOfRowsInSection, rowCount)
    }
 
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
