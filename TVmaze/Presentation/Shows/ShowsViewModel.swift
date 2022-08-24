//
//  ShowsViewModel.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import Foundation

final class ShowsViewModel: ObservableObject {
    
    let realm = try! Realm(configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true))
    
    @Published private(set) var loading = false
    
    private var currentPage = 0
    private let perPage = 250
    
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
      self.apiService = apiService
    }
    
    // MARK: - API Service methods
    func getShows() {
        
        loading = true
        currentPage = getCurrentPage()
        apiService.fetchShows(with: currentPage) { [weak self]  shows in
            guard let self = self else { return }
            DispatchQueue.main.async {
                shows.forEach { show in
                    self.save(show)
                }
                self.loading = false
            }
        } failure: { [weak self]  error in
            DispatchQueue.main.async {
                self?.loading = false
            }
        }
    }
    
    //MARK: - Realm methods
    private func save(_ show: Show) {
        do {
            try realm.write {
                show.isFavorite = false
                realm.add(show)
            }
        } catch {
            print("\(Constants.couldNotSave)")
        }
    }
    
    private func getCurrentPage() -> Int {
        let shows = realm.objects(Show.self)
        
        return shows.count != 0 ? (perPage / shows.count) + 1 : 0
    }
}

