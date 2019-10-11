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
    private let imageLoader: ImageLoader

    init(movie: Movie) {
        self.movie = movie
        imageLoader = ImageLoader(path: self.movie.posterPath, size: TMDBPosterSize.small)
    }
    
    var body: some View {
        HStack {
            MoviePoster(imageLoader: imageLoader)
            VStack {
                Text("\(movie.title)")
                Spacer()
                HStack {
                    Text("\(movie.tagline)")
                        .font(.subheadline)
                    Spacer()
                    Text("\(movie.releaseYear)")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

//struct MovieCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCard(movie: Movie(id: 1, title: "Star Wars", tagline: "The last hope", releaseYear: 1977))
//    }
//}
