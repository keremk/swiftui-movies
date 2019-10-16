//
//  ActorPoster.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/15/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct ActorPoster: View {
    @ObservedObject var imageLoader: ImageLoader
    
    struct PosterSize {
        static let width: CGFloat = 154.0 / 1.5
        static let height: CGFloat = 231.0 / 1.5
        static let shadowRadius: CGFloat = 10.0
    }
    
    struct EmptyPoster: View {
        var body: some View {
            Circle()
                .size(width: PosterSize.width, height: PosterSize.height)
                .fill(Color.gray)
                .shadow(radius: PosterSize.shadowRadius)
        }
    }

    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .frame(width: PosterSize.width, height: PosterSize.height, alignment: Alignment.center)
                .shadow(radius: PosterSize.shadowRadius)
            } else {
                EmptyPoster()
            }
        }
    }
}

//struct ActorPoster_Previews: PreviewProvider {
//    static var previews: some View {
//        ActorPoster()
//    }
//}
