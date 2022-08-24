//
//  ShowDetailViewModel.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import Foundation

final class ShowDetailViewModel: ObservableObject {
    
    let realm = try! Realm(configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true))

    @Published private(set) var loading = false
    @Published private(set) var episodes = [Episode]()

    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
      self.apiService = apiService
    }

    // MARK: - API Service Methods
    func getEpisodes(of showId: Int) {
                    
        loading = true
        apiService.fetchEpisodes(of: showId) { [weak self] episodes in
            DispatchQueue.main.async {
                episodes.forEach { episode in
                    episode.showId = showId
                    self?.save(episode)
                }
                self?.loading = false
            }
        } failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.loading = false
            }
        }
    }
    
    //MARK: - Realm methods
    private func save(_ episode: Episode) {
        
        do {
            try realm.write {
                realm.add(episode)
            }
        } catch {
            print("\(Constants.couldNotSave)")
        }
    }
    
}


