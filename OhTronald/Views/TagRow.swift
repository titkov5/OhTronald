//
//  TagRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagRow: View {
    
    @EnvironmentObject var data: DataContainer
    var tag: TagViewModel
    var tagIndex: Int {
        data.fetchedTags.firstIndex(where: { $0.id == tag.id}) ?? 0
    }
    
    var body: some View {
        HStack {
    
            Text(tag.value)
            Spacer()
            if tag.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }.frame(height: 80)
    }
}

struct TagRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagRow(tag: tags[0])
                .environmentObject(DataContainer())
            TagRow(tag: tags[2])
                .environmentObject(DataContainer())
            TagRow(tag: tags[3])
                .environmentObject(DataContainer())
        }.previewLayout(.fixed(width: 320, height: 80))
        
    }
}
