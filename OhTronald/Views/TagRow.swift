//
//  TagRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct TagRow: View {
    var tag: String
    
    var body: some View {
        Text(tag)
    }
}

struct TagRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagRow(tag: tags[1].value)
            TagRow(tag: tags[2].value)
            TagRow(tag: tags[3].value)
        }.previewLayout(.fixed(width: 320, height: 80))
        
    }
}
