//
//  EpisodeDetailView.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import SwiftUI

struct EpisodeDetailView: View {
    
    @ObservedRealmObject var episode: Episode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24){
                if let image = episode.image, let mediumImage = image.medium {
                    AsyncImageView(stringImage: mediumImage)
                }
                Divider()
                if let summary = episode.summary {
                    Text("\(summary)".removeHTMLTags())
                        .font(.callout)
                }
                Divider()
                VStack(spacing: 8) {
                    if let season = episode.season {
                        HStack(spacing: 4) {
                            Text("\(Constants.season): ")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("\(season)")
                        }
                    }
                    if let number = episode.number {
                        HStack(spacing: 4) {
                            Text("\(Constants.number): ")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("\(number)")
                        }
                    }
                }
                Divider()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(16)
        .navigationTitle(episode.name)
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: Episode())
    }
}
