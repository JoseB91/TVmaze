//
//  Episode.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import Foundation

class Episode: Object, ObjectKeyIdentifiable, Codable {
    @Persisted var id: Int
    @Persisted var showId: Int?
    let url: String
    @Persisted var name: String
    @Persisted var season: Int?
    @Persisted var number: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp: String?
    let runtime: Int?
    let rating: Rating?
    @Persisted var image: APIImage?
    @Persisted var summary: String?
    let links: EpisodeLinks

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, type, airdate, airtime, airstamp, runtime, rating, image, summary
        case links = "_links"
    }
}

// MARK: - Links
struct EpisodeLinks: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

