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
 let header = ["accept": "application/hal+json"]

struct Endpoints {
    static let tag = "tag"
    static let search = "search/quote?query"
}

class NetworkManager {

    private let service = NetworkService()
    
    func fetchTags() {
        let urlString = baseUrl + Endpoints.tag
        let tagRequest = ApiRequest.init(httpMethod: .GET,urlString: urlString ,
                        headers: header)
        
        service.fetchEntities(apiRequest: tagRequest, type: Tag.self) { (entities, error) in
            print("tag:", entities?.tags)
            print("error:",error)
        }
    }
    
    
}
