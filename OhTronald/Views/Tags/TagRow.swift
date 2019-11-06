//
//  TagRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagRow: View {
    
    var tag: TagViewModel
    
    var body: some View {
        HStack {
            Text(tag.value)
                .padding()
                .foregroundColor(.black)
  
            Spacer()
            
            if tag.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
                    .padding()
            }
        }.frame(height: 80)
    }
}

struct TagRow_Previews: PreviewProvider {
    static var previews: some View {
        TagRow(tag: TagViewModel(id: 0, value: "Hillary Clinton", isFavorite: true))
            .previewLayout(.fixed(width: 320, height: 80))
        
    }
}
