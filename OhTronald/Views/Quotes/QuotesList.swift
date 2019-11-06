//
//  QuotesList.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct QuotesList: View {

    @EnvironmentObject var viewModel: QuotesListViewModel
    
    var body: some View {
        ScrollView {
            
            ForEach(viewModel.quotes) { quote  in
                QuoteRow(viewModel: quote)
            }
            
            if !viewModel.isFull {
                
                Button(action: {
                    self.viewModel.uploadNewPage()
                }) {
                    Text("Load more...")
                        .padding()
                }
            }
        }.onAppear() {
            self.viewModel.uploadNewPage()
        }
    }
}

struct QuotesList_Previews: PreviewProvider {
    static var previews: some View {
        QuotesList().environmentObject(QuotesListViewModel(tag: "Hillary"))
    }
}
