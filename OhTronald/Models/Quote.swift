//
//  Quotes.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

class Quote: Decodable {
    var value: String = ""
    var count: Int = 0
    //var appeared_at
    //var "quote_id"
    
    enum CodingKeys: String, CodingKey {
        case value = "first_name"
    }
   
    internal init(quote: String) {
         self.value = quote
     }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
    }
}
