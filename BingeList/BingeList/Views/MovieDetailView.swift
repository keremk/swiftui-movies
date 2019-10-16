//
//  MovieDetailView.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/12/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI


struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        VStack {
            MovieBanner(movie: movie)
            Spacer()
            ActorCarousel(actorList: movie.cast)
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
