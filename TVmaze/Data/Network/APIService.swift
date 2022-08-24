//
//  APIService.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchShows(with page: Int,
                    success: @escaping (_ shows: [Show]) -> Void,
                    failure: @escaping (_ error: Error?) -> Void)
    
    func fetchEpisodes(of showId: Int,
                       success: @escaping (_ episodes: [Episode]) -> Void,
                       failure: @escaping (_ error: Error?) -> Void)
    
//    func fetchPeople(with page: Int,
//                       success: @escaping (_ episodes: [Person]) -> Void,
//                       failure: @escaping (_ error: Error?) -> Void)
    
}

final class APIService: APIServiceProtocol {
        
    // MARK: API
    private enum APIService {
        
        case shows(Int)
        case episodes(Int)
        case people(Int)
        
        func url() -> URL? {
            
            let baseUri = Constants.baseUri
            let showsUri = Constants.showsUri
            let episodesUri = Constants.episodesUri
            let peopleUri = Constants.peopleUri
            let pageUri = Constants.pageUri
            
            switch self {
            case .shows(let page):
                return URL(string: "\(baseUri)/\(showsUri)?\(pageUri)=\(page)")
            case .episodes(let showId):
                return URL(string: "\(baseUri)/\(showsUri)/\(showId)/\(episodesUri)")
            case .people(let page):
                return URL(string: "\(baseUri)/\(peopleUri)?\(pageUri)=\(page)")
            }
        }
    }
    
    // MARK: Services
        
    func fetchShows(with page: Int,
                     success: @escaping (_ shows: [Show]) -> Void,
                     failure: @escaping (_ error: Error?) -> Void) {
        
        let url = APIService.shows(page).url()
        
        URLSession.shared.dataResponse(for: url) { elements in
            success(elements)
        } failure: { error in
            failure(error)
        }

    }
    
    func fetchEpisodes(of showId: Int,
                     success: @escaping (_ shows: [Episode]) -> Void,
                     failure: @escaping (_ error: Error?) -> Void) {
        
        let url = APIService.episodes(showId).url()
        
        URLSession.shared.dataResponse(for: url) { elements in
            success(elements)
        } failure: { error in
            failure(error)
        }
        
    }
        
//    func fetchPeople(with page: Int,
//                       success: @escaping (_ episodes: [Person]) -> Void,
//                       failure: @escaping (_ error: Error?) -> Void) {
//
//        let url = APIService.people(page).url()
//
//        URLSession.shared.dataResponse(for: url) { elements in
//            success(elements)
//        } failure: { error in
//            failure(error)
//        }
//    }
    
}
    
