//
//  MovieBanner.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/16/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MovieBanner: View {
    let movie: Movie
    
    var body: some View {
        ZStack(alignment: .leading) {
            MovieBackdrop(imageLoader: ImageLoader(path: movie.posterPath, size: TMDBPosterSize.medium))
            MovieBannerInfo(movie: movie)
        }
        .shadow(radius: 2)
    }
}

//struct MovieBanner_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieBanner()
//    }
//}
