//
//  QuoteRow.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct QuoteRow: View {
    var viewModel: QuoteViewModel

    var body: some View {
        HStack{
            Avatar()
                .padding()
            
            Spacer()
            
            Text(viewModel.value)
                .padding()
                .foregroundColor(.black)
            
        }
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuoteRow(viewModel: QuoteViewModel(id: 1, value: "quote.value"))
        }.previewLayout(.fixed(width: 320, height: 110))
    }
}
