//
//  MockAPIService.swift
//  TVmazeTests
//
//  Created by José Briones Romero on 23/8/22.
//

import Foundation
@testable import TVmaze

final class MockAPIService: APIServiceProtocol {
    
    var fetchShowsCalled = false
    var fetchEpisodesCalled = false
    var fetchPeopleCalled = false
        
    let mockShows: [Show] = [Show()]
    let mockEpisodes: [Episode] = [Episode()]
//    let mockPeople: [Person] = [Person()]

    func fetchShows(with page: Int, success: @escaping ([Show]) -> Void, failure: @escaping (Error?) -> Void) {
        fetchShowsCalled = true
        success(mockShows)

    }
    
    func fetchEpisodes(of showId: Int, success: @escaping ([Episode]) -> Void, failure: @escaping (Error?) -> Void) {
        fetchEpisodesCalled = true
        success(mockEpisodes)
    }
    
    // For future implementation
//    func fetchPeople(with page: Int, success: @escaping ([Person]) -> Void, failure: @escaping (Error?) -> Void) {
//        fetchPeopleCalled = true
//        success(mockPeople)
//    }

    
}
