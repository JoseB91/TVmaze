//
//  Show.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import Foundation

class Show: Object, ObjectKeyIdentifiable, Codable {
    @Persisted var id: Int
    let url: String
    @Persisted var name: String
    let type: String
    let language: String
    let genres: [String] // @Persisted var genres = List<String>()
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    @Persisted var schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network, webChannel: Network?
    let dvdCountry: Country?
    let externals: Externals?
    @Persisted var image: APIImage?
    @Persisted var summary: String?
    let updated: Int?
    let links: Links?
    @Persisted var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Image
class APIImage: Object, Codable {
    @Persisted var medium: String?
    @Persisted var original: String?
}

// MARK: - Schedule
class Schedule: EmbeddedObject, Codable {
    @Persisted var time: String?
    @Persisted var days: List<Day>
}

enum Day: String, Codable, PersistableEnum, Identifiable {
    var id: RawValue { rawValue }
    
    case friday = "Friday"
    case monday = "Monday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    case thursday = "Thursday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}

// MARK: - Network
struct Network: Codable {
    let id: Int
    let name: String
    let country: Country?
    let officialSite: String?
}

// MARK: - Country
struct Country: Codable {
    let name: String
    let code: String
    let timezone: String
}

// MARK: - Externals
struct Externals: Codable {
    let tvrage: Int
    let thetvdb: Int?
    let imdb: String?
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: Ref?
    let previous: Ref?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previous = "previousepisode"
    }
}

struct Ref: Codable {
    let href:String?
}
