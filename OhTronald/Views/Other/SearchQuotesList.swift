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
            Spacer()
            
            Text("Search Quote")
            
            HStack {
                Spacer()
                
                TextField("type here...", text: $viewModel.searchQuote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .shadow(radius: 5)
                
                Spacer()
            }
            
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
