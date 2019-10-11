//
//  MovieDiscoveryView.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/3/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    @EnvironmentObject private var searchResults: SearchResults
        
    var body: some View {
        VStack {
            SearchBox(searchInput: $searchResults.searchTerm)
            MovieList(movieList: $searchResults.movies)
        }
    }
}

//struct MovieDiscoveryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDiscoveryView()
//    }
//}
