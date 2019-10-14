//
//  WatchlistView.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/3/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct WatchlistView: View {
    @EnvironmentObject private var searchResults: SearchResults
    
    var body: some View {
        NavigationView {
            VStack {
                MovieList(movieList: $searchResults.movies)
                Spacer()
            }
            .navigationBarTitle(Text("Bookmarks"))
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
