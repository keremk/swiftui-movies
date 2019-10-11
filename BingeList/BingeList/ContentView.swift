//
//  ContentView.swift
//  BingeList
//
//  Created by Kerem Karatal on 9/25/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: SearchResults
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            SearchResultsView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            WatchlistView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
