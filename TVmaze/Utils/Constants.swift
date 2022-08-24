//
//  Constants.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import Foundation

struct Constants {
    
    // URIs
    static let baseUri = "https://api.tvmaze.com"
    static let showsUri = "shows"
    static let episodesUri = "episodes"
    static let peopleUri = "people"
    static let pageUri = "page"

    // UI Texts
    static let shows = "TV Maze Shows"
    static let showFavorites = "Show Favorites"
    static let episodes = "Episodes"
    static let schedule = "Schedule"
    static let genres = "Genres"
    static let number = "Episode"
    static let season = "Season"
    static let people = "People"
    static let name = "name"
    static let searchPrompt = "Look for some show"

    // Images
    static let starFillImage = "star.fill"
    static let starImage = "star"
    static let placeholderImage = "placeholder"
    
    // Errors
    static let couldNotSave = "An error has occured saving data."
    static let couldNotFetch = "An error has occured fetching data."

}
