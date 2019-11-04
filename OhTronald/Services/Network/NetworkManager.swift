//
//  NetworkManager.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

let baseUrl = "https://api.tronalddump.io/"
let headers = ["accept": "application/hal+json"]

let kPage = "page"
let kSize = "size"
let kQuery = "query"

struct Endpoints {
    static let tag = "/tag"
    static let quotesByTag = "/tag/"
    static let search = "/search/quote"
}

class NetworkManager {

    private let service = NetworkService()

    func fetchTagListModel(completionHandler: @escaping (_ tagsList: TagsListModel?) -> Void) {
        let tagRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.tag ,
                                         parameters: [:], headers: headers)
        
        service.fetchEntities(apiRequest: tagRequest, type: TagsListModel.self) { (listModel, error) in
            completionHandler(listModel)
        }
    }
    
    func fetchQuotes(page: Int, size:Int, tag: String, completionHandler: @escaping(_ quotes: QuotesListModel?) -> Void ) {
        
        let pageAsString = String(page)
        let sizeAsString = String(size)
        let parameters:[String: String] = [kPage: pageAsString, kSize: sizeAsString]
        
        let quoteRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.quotesByTag + tag, parameters: parameters, headers: headers)
        
        service.fetchEntities(apiRequest: quoteRequest, type: QuotesListModel.self) { (listModel, error) in
            completionHandler(listModel)
        }
    }
    
    func fetchSearchResult(searchQuote: String,completionHandler: @escaping(_ quotes: SearchListModel?) -> Void) {
        let parameters = [kQuery: searchQuote]
        
        let searchRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.search, parameters: parameters, headers: headers)
        
        service.fetchEntities(apiRequest: searchRequest, type: SearchListModel.self) { (listModel, error) in
            completionHandler(listModel)
        }
    }
    
}
