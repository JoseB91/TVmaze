//
//  ShowDetailView.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import SwiftUI

struct ShowDetailView: View {
    
    @ObservedObject var showDetailViewModel = ShowDetailViewModel()
    
    @ObservedRealmObject var show: Show
    @ObservedResults(Episode.self) var episodes
    
    var episodesOfShow : [Episode]? {
        Array(episodes.where { $0.showId == show.id })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing:16) {
                if let image = show.image, let mediumImage = image.medium {
                    AsyncImageView(stringImage: mediumImage)
                }
                if let summary = show.summary {
                    Text("\(summary)".removeHTMLTags())
                        .font(.footnote)
                        .lineLimit(14)
                }
            }
            Divider()
            if let schedule = show.schedule, let time = schedule.time {
                HStack(spacing: 4) {
                    Text("\(Constants.schedule): ")
                        .font(.body)
                        .fontWeight(.bold)
                    ForEach(schedule.days) { day in
                        Text("\(day.rawValue)s at \(time)")
                    }
                }
            }
            Divider()
            //                if let genres = show.genres {
            //                    HStack(spacing: 4) {
            //                        Text("\(Constants.genres): ")
            //                            .font(.body)
            //                            .fontWeight(.bold)
            //                        ForEach(genres, id:\.self) { genre in
            //                            Text("\(genre)")
            //                        }
            //                    }
            //                }
        }
        .navigationTitle(show.name)
        .onAppear {
            if let episodesOfShow = episodesOfShow, episodesOfShow.isEmpty {
                showDetailViewModel.getEpisodes(of: show.id)
            }
        }
        .padding(16)
        VStack (alignment: .leading) {
            Text("\(Constants.episodes)")
                .font(.title)
                .padding(.leading, 16)
            ZStack {
                if let episodesOfShow = episodesOfShow, let last = episodesOfShow.last, let lastSeason = last.season {
                    List {
                        ForEach(1...lastSeason, id: \.self) { seasonNumber in
                            Section {
                                ForEach(episodesOfShow.filter { $0.season == seasonNumber }) { episode in
                                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                        Text("\(episode.name)")
                                            .font(.body)
                                    }
                                }
                            } header: {
                                Text("\(Constants.season): \(seasonNumber)")
                            }
                        }
                    }
                    .frame(height: 300)
                    .cornerRadius(16)
                }
                if showDetailViewModel.loading {
                    ProgressView()
                }
            }
        } // EPISODES
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    $show.isFavorite.wrappedValue?.toggle()
                }) {
                    $show.isFavorite.wrappedValue ?? false ? Image(systemName: Constants.starFillImage).foregroundColor(.yellow): Image(systemName: Constants.starImage).foregroundColor(.gray)
                }
            }
        }
    }
}

struct ShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailView(show: Show())
    }
}


