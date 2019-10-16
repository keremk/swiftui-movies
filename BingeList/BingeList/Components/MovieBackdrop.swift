//
//  MovieBackdrop.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/16/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MovieBackdrop: View {
    @ObservedObject var imageLoader: ImageLoader

    struct BackDropSize {
        static let height: CGFloat = 400.0
    }

    struct EmptyBackdrop: View {
        var body: some View {
            Rectangle()
            .size(width: UIScreen.main.bounds.width, height: BackDropSize.height)
            .fill(Color.gray)
        }
    }

    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .overlay(
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                               startPoint: .center, endPoint: .bottom)
                            )
                            .clipped()
                    )
                    .frame(height: BackDropSize.height)
                    .aspectRatio(contentMode: .fill)
            } else {
                EmptyBackdrop()
            }
        }
    }
}

//struct MovieBackdrop_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieBackdrop()
//    }
//}
