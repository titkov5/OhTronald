//
//  RootView.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(tags) {tag in
                    TagsHorizontalRow(tag: "wow", quotes: ["one","two"])
                }
            }.navigationBarTitle("Tronald's Topics")
        }
    }

}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
