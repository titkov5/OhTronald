//
//  SearchQuotesList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 04.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct SearchQuotesList: View {
    @EnvironmentObject var viewModel: SearchQuotesListViewModel
    var body: some View {
        VStack {
            TextField("search", text: $viewModel.searchQuote)
            ScrollView {
                ForEach(viewModel.searchResult) { quote  in
                    QuoteRow(viewModel: quote)
                }
            }
        }
    }
}

struct SearchQuotesList_Previews: PreviewProvider {
    static var previews: some View {
        SearchQuotesList().environmentObject(SearchQuotesListViewModel())
    }
}
