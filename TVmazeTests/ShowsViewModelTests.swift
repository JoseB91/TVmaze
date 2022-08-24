//
//  ShowsViewModelTests.swift
//  TVmazeTests
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import XCTest
@testable import TVmaze

class JobsityTVMazeTests: XCTestCase {

    var showsViewModel: ShowsViewModel?
    var mockAPIService: MockAPIService?

    override func setUpWithError() throws {
        mockAPIService = MockAPIService()
        guard let mockAPIService = mockAPIService else { return }
        showsViewModel = ShowsViewModel(apiService: mockAPIService)
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    override func tearDownWithError() throws {
        showsViewModel = nil
        mockAPIService = nil
    }

    func test_getShows() throws {
        // Arrange
        guard let mockAPIService = mockAPIService else {
            XCTFail()
            return
        }

        // Act
        showsViewModel?.getShows()
        
        // Assert
        XCTAssert(mockAPIService.fetchShowsCalled)
        XCTAssertNotNil(showsViewModel?.realm)
    }

}
