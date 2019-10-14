//
//  TagsList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagsList: View {
    var body: some View {
        NavigationView {
            List(tags, id: \.id) { tag in
                NavigationLink(destination: ContentView(tag: tag.value)) {
                    TagRow(tag: tag.value)
                }
            }
        }.navigationBarTitle(Text("Tags"))
    }
}

struct TagsList_Previews: PreviewProvider {
    static var previews: some View {
        TagsList()
    }
}
