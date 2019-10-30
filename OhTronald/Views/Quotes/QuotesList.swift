//
//  QuotesList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct QuotesList: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        ScrollView {
            ForEach(state.fetchedQuotes) { quote  in
                QuoteRow(quote: quote.value)
            }
        }.onDisappear {
            self.state.fetchedQuotes = []
        }
    }
}

struct QuotesList_Previews: PreviewProvider {
    static var previews: some View {
        QuotesList()
    }
}
