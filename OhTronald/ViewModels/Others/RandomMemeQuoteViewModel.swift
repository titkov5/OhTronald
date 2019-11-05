//
//  RandomMemeQuoteViewModel.swift
//  OhTronald
//
//  Created by Ivan Titkov on 04.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
import UIKit

final class RandomMemeQuoteViewModel: ObservableObject {
    @Published var quote: QuoteViewModel?
    @Published var imageData: Data?
    
    private let networkManager = NetworkManager()
    
    init() {
       loadRandomMem()
        loadRandomQuote()
    }
    
    func loadRandomMem() {
        networkManager.fetchRandomMeme { data in
            self.imageData = data
        }
    }
    
    func loadRandomQuote() {
        networkManager.fetchRandomQuote { randomQuote in
            if let randomQuote = randomQuote {
                self.quote = QuoteViewModel(id: 0, value: randomQuote.value)
            }
        }
    }
}
