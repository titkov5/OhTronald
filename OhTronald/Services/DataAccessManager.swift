//
//  DataAccessManager.swift
//  OhTronald
//
//  Created by Ivan Titkov on 02.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

class DataAccessManager {
    
  //  private let service = NetworkService()
    
//    func fetchTags(completionHandler: @escaping (_ tags: [TagViewModel])->Void ) {
//        let tagRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.tag ,
//                        headers: headers)
//
//        service.fetchEntities(apiRequest: tagRequest, type: TagsListModel.self) { (entities, error) in
//            let fetchedTags = self.createTags(tagValues: entities?.tags)
//            completionHandler(fetchedTags)
//        }
//    }
    
//    func fetchQuotes(tag: String, completionHandler: @escaping(_ quotes:[QuoteViewModel])->Void ) {
//        let quoteRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.quote, parameters: ["query" : tag], headers: headers)
//
//        service.fetchEntities(apiRequest: quoteRequest, type: QuoteListModel.self) { (entities, error) in
//            var fetchedQuotes:[QuoteViewModel] = []
//            if let quotes = entities?.quotes {
//                var id = 0
//                for quote in quotes {
//                    let quoteViewModel = QuoteViewModel(id: id, value: quote.value)
//                    fetchedQuotes.append(quoteViewModel)
//                    id += 1
//                }
//            }
//            completionHandler(fetchedQuotes)
//        }
//    }
    
//    func createTags(tagValues: [String]?) -> [TagViewModel] {
//        guard let tagValues = tagValues else {
//            return []
//        }
//        var result: [TagViewModel] = []
//        var i = 0
//        for tag in tagValues {
//            let isFavorite = (i == 3) || (i == 7) || (i == 0)
//            result.append(TagViewModel(id: i, value: tag, isFavorite: isFavorite))
//            i+=1
//        }
//        return result
//    }
    
//    func createQuotes(quotes:[QuoteListModel]) -> [QuoteViewModel] {
//        return []
//    }
}
