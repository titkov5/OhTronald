//
//  TagsList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagsList: View {
    @EnvironmentObject var data: AppState
    
    var body: some View {
        NavigationView {
                ScrollView {
                        HStack {
                            Spacer()
                            Toggle(isOn: $data.showFavoritesOnly) {
                                Text("Favorites only")
                            }
                            Spacer()
                        }
                    
                        ForEach(data.fetchedTags) { tag in
                            if !self.data.showFavoritesOnly || tag.isFavorite {
                                NavigationLink(destination: QuotesList().environmentObject(self.data).onAppear() {
                                    self.data.currentTag = tag.value
                                }) {
                                    TagRow(tag: tag)
                                }
                            }
                        }
                    
                }
        }
    }
}

struct TagsList_Previews: PreviewProvider {
    static var previews: some View {
        TagsList()
            .environmentObject(AppState())
    }
}
