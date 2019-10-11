//
//  MovieList.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/3/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MovieListEmpty: View {
    var body: some View {
        Text("No Movies")
    }
}

struct MovieList: View {
    @Binding var movieList: [Movie]
    
    var body: some View {
        List {
            if movieList.isEmpty {
                MovieListEmpty()
            } else {
                ForEach(movieList) { movie in
                    MovieCard(movie: movie)
                }
            }
        }
    }
}

//struct MovieList_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieList(movieList: <#Binding<[Movie]>#>)
//    }
//}
