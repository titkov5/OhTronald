//
//  ModelsStakeholder.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
import Combine

final class AppState: ObservableObject {
    @Published var fetchedTags:[TagViewModel] = []
    @Published var showFavoritesOnly = false
    @Published var currentTag: String? = nil {
        didSet{
            if let currentTag = currentTag {
                self.fetchQuotes(tag: currentTag)
            }
        }
    }
    @Published var fetchedQuotes:[QuoteViewModel] = []
    
    init() {
        fetchTags()
   }
    
    private let service = NetworkService()
    
    func fetchTags() {
        let tagRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.tag ,
                        headers: headers)
        
        service.fetchEntities(apiRequest: tagRequest, type: TagsListModel.self) { (entities, error) in
            self.fetchedTags = self.createTags(tagValues: entities?.tags)
        }
    }
    
    func fetchQuotes(tag: String) {
        if let tag = currentTag {
            let quoteRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.quote, parameters: ["query" : tag], headers: headers)
            
            service.fetchEntities(apiRequest: quoteRequest, type: QuoteListModel.self) { (entities, error) in
                self.fetchedQuotes = []
                print(entities?.count, entities?.total )
                
                if let quotes = entities?.quotes {
                    var id = 0
                    for quote in quotes {
                        let quoteViewModel = QuoteViewModel(id: id, value: quote.value)
                        self.fetchedQuotes.append(quoteViewModel)
                        id += 1
                    }
                }
                
            }
        }
    }
    
    func createTags(tagValues: [String]?) -> [TagViewModel] {
        guard let tagValues = tagValues else {
            return []
        }
        var result: [TagViewModel] = []
        var i = 0
        for tag in tagValues {
            let isFavorite = (i == 3) || (i == 7) || (i == 0)
            result.append(TagViewModel(id: i, value: tag, isFavorite: isFavorite))
            i+=1
        }
        return result
    }
    
    func createQuotes(quotes:[QuoteListModel]) -> [QuoteViewModel] {
        return []
    }
    
}
