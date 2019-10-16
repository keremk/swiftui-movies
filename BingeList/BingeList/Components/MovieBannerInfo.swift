//
//  MovieBannerInfo.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/16/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct MovieBannerInfo: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
                Spacer()
                Text("\(movie.title)")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                Text("\(movie.tagline)")
                    .font(.system(size: 17))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                }
                .padding()
        }
    
}


//struct MovieBannerInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieBannerInfo()
//    }
//}
