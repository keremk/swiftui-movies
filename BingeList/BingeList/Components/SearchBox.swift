//
//  SearchBox.swift
//  BingeList
//
//  Created by Kerem Karatal on 9/28/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct SearchBox: View {
    @Binding var searchInput: String

    var body: some View {
        HStack {
            TextField("Search", text: $searchInput)
        }
        .padding()
    }
}

//struct SearchBox_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBox(searchText: Binding<String>(
//            get: {
//                return ""
//            },
//            set: {
//
//            })
//    }
//}
