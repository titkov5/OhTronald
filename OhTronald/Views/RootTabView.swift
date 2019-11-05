//
//  RootTabView.swift
//  OhTronald
//
//  Created by Ivan Titkov on 05.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            
            TagsList()
            .environmentObject(TagsListViewModel())
                .tabItem {
                    Text("Tags")
            }
            .tag(0)
            
            SearchQuotesList()
            .environmentObject(SearchQuotesListViewModel())
                .tabItem {
                    Text("Search")
            }
            .tag(1)
            
            RandomMemeView()
                .environmentObject(RandomMemeQuoteViewModel())
                .tabItem {
                    Text("RNDM")
            }
            .tag(2)
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
