//
//  Quotes.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

class QuoteData:Decodable {
    var appeared_at: String
    var created_at: String
    var quote_id: String
    var tags: [String]
    var value: String
    //TODO: пробросл url
}

 //TODO: rename quotes as network model
 class Quote: Decodable {
     var count: Int = 0
     var total: Int = 0
     var quotes: [QuoteData]
     
     enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case tags
        case count
        case total
        case quotes
     }
    
     
     public required init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         count = try container.decode(Int.self, forKey: .count)
         total = try container.decode(Int.self, forKey: .total)
         
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .embedded)
        quotes = try nestedContainer.decode([QuoteData].self, forKey: .quotes)
        for q in quotes {
            print(q.value)
        }
        
     }
 }

 

