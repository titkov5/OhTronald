//
//  TagsHorizontalRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagsHorizontalRow: View {
    var tag: String
    var quotes: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Tags")
                .font(.headline)
                .padding(.top, 15)
                .padding(.leading, 15)
                .padding(.bottom, 15)
          Spacer()
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(tags) { tag in
                        Text(tag.value)
                      }
                }
            }
        }.frame(height: 140)
       
    }
}

struct TagsHorizontalRow_Previews: PreviewProvider {
    static var previews: some View {
        TagsHorizontalRow(tag: "Hillary", quotes: ["Hillary"])
    }
}
