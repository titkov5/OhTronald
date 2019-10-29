//
//  QuoteRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct QuoteRow: View {
    var quote:String
    var body: some View {
        HStack{
            Avatar()
            Text(quote)
        }
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
             QuoteRow(quote: "Test")
        }.previewLayout(.fixed(width: 320, height: 110))
    }
}
