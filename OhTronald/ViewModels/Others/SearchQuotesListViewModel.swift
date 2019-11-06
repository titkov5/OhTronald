//
//  SearchListViewModel.swift
//  OhTronald
//
//  Created by Ivan Titkov on 04.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

final class SearchQuotesListViewModel: ObservableObject {
    @Published var searchQuote: String = "" {
        didSet {
            self.loadQuotes()
        }
    }
    @Published var searchResult: [QuoteViewModel] = []
    
    private let networkManager = NetworkManager()
    
    func loadQuotes() {
        
        networkManager.fetchSearchResult(searchQuote: searchQuote) { (newModel) in
            self.searchResult = []
            var fetchedQuotes:[QuoteViewModel] = []
            var id = 0
            if let model = newModel {
                for quote in model.quotes {
                    let quoteViewModel = QuoteViewModel(id: id, value: quote.value)
                    fetchedQuotes.append(quoteViewModel)
                    id+=1
                }
                self.searchResult = fetchedQuotes
            }
        }
        
    }
    
    
}
