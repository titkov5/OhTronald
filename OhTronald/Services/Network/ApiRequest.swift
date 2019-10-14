//
//  ApiRequest.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

public enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

struct ApiConfig {
    static let baseUrlString = "https://api.tronalddump.io/"
    static let tagUrlString = "tag"
}

public protocol ApiRequestProtocol {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String : Any]? { get }
}

public struct ApiRequest: ApiRequestProtocol {
    public let urlString: String
    public let httpMethod: HTTPMethod
    public let parameters: [String : Any]?
    public let headers:[String: String]?
    
    init(httpMethod: HTTPMethod, urlString:String, parameters: [String : Any]? = nil, headers:[String:String]?) {
        self.httpMethod = httpMethod
        self.urlString = urlString
        self.parameters = parameters
        self.headers = headers
    }
}
