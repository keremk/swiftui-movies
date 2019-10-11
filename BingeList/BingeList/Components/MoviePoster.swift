//
//  MoviePoster.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/8/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MoviePoster: View {
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        if let posterImage = imageLoader.image {
            return Image(uiImage: posterImage)
                .onAppear(){}
        } else {
            return Image(uiImage: UIImage(systemName: "paperplane.fill")!)
                .onAppear(){}
        }
    }
}

//struct MoviePoster_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviePoster()
//    }
//}
