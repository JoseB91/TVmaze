//
//  ShowDetailViewModelTests.swift
//  TVmazeTests
//
//  Created by José Briones Romero on 23/8/22.
//

import XCTest
@testable import TVmaze

class ShowDetailViewModelTests: XCTestCase {

    var showDetailViewModel: ShowDetailViewModel?
    var mockAPIService: MockAPIService?
    let mockShowId = 1

    override func setUpWithError() throws {
        mockAPIService = MockAPIService()
        guard let mockAPIService = mockAPIService else { return }
        showDetailViewModel = ShowDetailViewModel(apiService: mockAPIService)
    }

    override func tearDownWithError() throws {
        showDetailViewModel = nil
        mockAPIService = nil
    }

    func test_getEpisodes() throws {
        // Arrange
        guard let mockAPIService = mockAPIService else {
            XCTFail()
            return
        }

        // Act
        showDetailViewModel?.getEpisodes(of: mockShowId)
        
        // Assert
        XCTAssert(mockAPIService.fetchEpisodesCalled)
        XCTAssertNotNil(showDetailViewModel?.realm)
    }
}

