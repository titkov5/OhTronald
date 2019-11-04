//
//  QuotesListViewModel.swift
//  OhTronald
//
//  Created by Ivan Titkov on 03.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

final class QuotesListViewModel: ObservableObject {

    @Published var quotes: [QuoteViewModel] = []
    
    private var tag: String
    var isFull: Bool = false

    private let size = 25
    private var currentPage = 1
    private var id = 0
    private let networkManager = NetworkManager()

    init(tag: String) {
        self.tag = tag
    }
    
    func uploadNewPage() {
        if !isFull {
            networkManager.fetchQuotes(page: currentPage, size: size, tag: self.tag) { (model) in
                if let newModel = model {
                    self.mergeNetworkModelIntoCurrentModel(newModel: newModel)
                }
            }
        }
    }
        
    private func mergeNetworkModelIntoCurrentModel(newModel: QuotesListModel) {
        var fetchedQuotes:[QuoteViewModel] = []
                
        for quote in newModel.quotes {
            let quoteViewModel = QuoteViewModel(id: id, value: quote.value)
            fetchedQuotes.append(quoteViewModel)
            id += 1
        }
        
        quotes.append(contentsOf: fetchedQuotes)
        self.isFull = newModel.total == quotes.count
        self.currentPage += 1
    }
    
}
