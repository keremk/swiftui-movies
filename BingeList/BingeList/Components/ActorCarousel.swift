//
//  ActorCarousel.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/15/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct ActorCarousel: View {
    let actorList: [Actor]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(actorList, id: \.self) { actor in
                    VStack {
                        ActorPoster(imageLoader: ImageLoader(path: actor.profilePath, size: TMDBActorSize.medium))
                        Text("\(actor.name)")
                            .font(.callout)
                        Text("\(actor.character)")
                            .font(.caption)
                    }.frame(width: 140)
                }
            }
        }
    }
}

//struct ActorCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        ActorCarousel()
//    }
//}
