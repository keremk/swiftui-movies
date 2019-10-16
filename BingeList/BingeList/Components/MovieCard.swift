//
//  MovieCard.swift
//  BingeList
//
//  Created by Kerem Karatal on 9/28/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            MoviePoster(imageLoader: ImageLoader(path: movie.posterPath, size: TMDBPosterSize.small))
            Spacer()
            VStack (alignment: .leading) {
                Text("\(movie.title)")
                    .font(.title)
                HStack {
                    Text("\(movie.tagline)")
                        .font(.subheadline)
                    Spacer()
                    Text("\(movie.releaseYear)")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

//struct MovieCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCard(movie: Movie(id: 1, title: "Star Wars", tagline: "The last hope", releaseYear: 1977))
//    }
//}
