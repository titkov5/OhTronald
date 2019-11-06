//
//  TagsList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagsList: View {
    
    @EnvironmentObject var viewModel: TagsListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                HStack {
                    Spacer()
                    
                    Toggle(isOn: $viewModel.showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    Spacer()
                }
                
                ForEach(viewModel.tags) { tag in
                    if !self.viewModel.showFavoritesOnly || tag.isFavorite {
                        NavigationLink(destination:
                        QuotesList().environmentObject(QuotesListViewModel(tag: tag.value))) {
                            TagRow(tag: tag)
                        }
                    }
                }
                
            }.navigationBarTitle(Text("Tags"))
        }
           
    }
}
    

struct TagsList_Previews: PreviewProvider {
    static var previews: some View {
        TagsList()
            .environmentObject(TagsListViewModel())
    }
}
