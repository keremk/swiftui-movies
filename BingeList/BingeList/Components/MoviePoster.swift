//
//  MoviePoster.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/8/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct PosterSize {
    static let width: CGFloat = 154.0 / 1.5
    static let height: CGFloat = 231.0 / 1.5
}

struct EmptyPoster: View {
    var body: some View {
        Rectangle()
            .size(width: PosterSize.width, height: PosterSize.height)
            .fill(Color.gray)
    }
}

struct MoviePoster: View {
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                .resizable()
                .frame(width: PosterSize.width, height: PosterSize.height, alignment: Alignment.center)
                    
            } else {
                EmptyPoster()
            }
        }
    }
}

//struct MoviePoster_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePoster()
//    }
//}
