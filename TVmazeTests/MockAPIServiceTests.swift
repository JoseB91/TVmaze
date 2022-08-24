//
//  MockAPIServiceTests.swift
//  TVmazeTests
//
//  Created by José Briones Romero on 23/8/22.
//

import XCTest
@testable import TVmaze

class MockAPIServiceTests: XCTestCase {

    var mockAPIService: MockAPIService?
    let mockShowId = 1
    let mockPage = 1

    override func setUpWithError() throws {
        mockAPIService = MockAPIService()
    }

    override func tearDownWithError() throws {
        mockAPIService = nil
    }

    func test_fetchShows() throws {
        // Arrange
        guard let mockAPIService = mockAPIService else {
            XCTFail()
            return
        }
        
        let expectation = XCTestExpectation()
        var expectedShows = [Show()]
        
        // Act
        mockAPIService.fetchShows(with: mockPage) { shows in
            expectation.fulfill()
            expectedShows = shows
        } failure: { error in
            XCTFail()
        }

        // Assert
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedShows.count, mockAPIService.mockShows.count)
        XCTAssertEqual(expectedShows.first, mockAPIService.mockShows.first)
        XCTAssert(mockAPIService.fetchShowsCalled)
    }

    func test_fetchComments() throws {
        // Arrange
        guard let mockAPIService = mockAPIService else {
            XCTFail()
            return
        }
        
        let expectation = XCTestExpectation()
        var expectedEpisodes = [Episode()]
        
        // Act
        mockAPIService.fetchEpisodes(of: mockShowId) { episodes in
            expectation.fulfill()
            expectedEpisodes = episodes
        } failure: { error in
            XCTFail()
        }

        // Assert
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedEpisodes.count, mockAPIService.mockEpisodes.count)
        XCTAssertEqual(expectedEpisodes.first, mockAPIService.mockEpisodes.first)
        XCTAssert(mockAPIService.fetchEpisodesCalled)
    }
    
//    func test_fetchPeople() throws {
//        // Arrange
//        guard let mockAPIService = mockAPIService else {
//            XCTFail()
//            return
//        }
//        
//        let expectation = XCTestExpectation()
//        var expectedPeople = [Person()]
//        
//        // Act
//        mockAPIService.fetchPeople(with: mockPage) { people in
//            expectation.fulfill()
//            expectedPeople = people
//        } failure: { error in
//            XCTFail()
//        }
//
//        // Assert
//        wait(for: [expectation], timeout: 5)
//        XCTAssertEqual(expectedPeople.count, mockAPIService.mockPeople.count)
//        XCTAssertEqual(expectedPeople.first, mockAPIService.mockPeople.first)
//        XCTAssert(mockAPIService.fetchPeopleCalled)
//    }

}
