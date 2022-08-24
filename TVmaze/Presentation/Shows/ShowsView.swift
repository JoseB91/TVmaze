//
//  ShowsView.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import RealmSwift
import SwiftUI

struct ShowsView: View {
    
    @ObservedObject var showsViewModel = ShowsViewModel()
    
    @ObservedResults(Show.self) var showsRealm
    @ObservedResults(
        Show.self,
        where: { $0.isFavorite == true },
        sortDescriptor: SortDescriptor(keyPath: "\(Constants.name)")
    ) var favoriteShows
    
    @State var showFavorites = false
    @State var searchText = ""

    var shows: [Show] {
        if searchText.isEmpty {
            return showFavorites ? Array(favoriteShows) : Array(showsRealm)
        } else {
            return showFavorites ? Array(favoriteShows.filter { $0.name.contains(searchText) }) : Array(showsRealm.filter { $0.name.contains(searchText) })
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    Toggle(Constants.showFavorites, isOn: $showFavorites)
                        .padding([.top, .leading, .trailing], 16)
                                    
                    List(0..<shows.count, id: \.self) { i in
                        NavigationLink(destination: ShowDetailView(show: shows[i])) {
                            ShowRowView(show: shows[i])
                            if i == shows.count - 1 && !showFavorites && shows.count > 200 {
                                onAppear(perform: showsViewModel.getShows)
                            }
                        }
                    } // LIST
                    .searchable(text: $searchText, prompt: "\(Constants.searchPrompt)")
                    .cornerRadius(16)
                } // VSTACK
               .navigationTitle("\(Constants.shows)")
                if showsViewModel.loading {
                    ProgressView()
                }
            } // ZSTACK
        }.navigationViewStyle(.stack)
        .onAppear {
            if showsRealm.isEmpty {
                showsViewModel.getShows()
            }
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) //TODO: Delete this
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}


