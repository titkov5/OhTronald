//
//  NetworkManager.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
//TODO privacy
 let baseUrl = "https://api.tronalddump.io/"
 let headers = ["accept": "application/hal+json"]

struct Endpoints {
    static let tag = "/tag"
    static let quote = "/search/quote"
}

class NetworkManager {

    private let service = NetworkService()
    
    func fetchTags() {
        let tagRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.tag ,
                        headers: headers)
        
        service.fetchEntities(apiRequest: tagRequest, type: Tag.self) { (entities, error) in
            print("tag:", entities?.tags)
            print("error:",error)
        }
    }
    
    func fetchQuotes(tag: String) {
        let urlString = baseUrl + Endpoints.quote
        let quoteRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.quote, parameters: ["query" : tag], headers: headers)
        
        service.fetchEntities(apiRequest: quoteRequest, type: Quote.self) { (entities, error) in
            print("entites", entities?.count)
        }
    }
}
