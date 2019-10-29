//
//  NetworkServiceError.swift
//  OhTronald
//
//  Created by Ivan Titkov on 14.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

public enum NetworkServiceError: Error, Equatable {
    case badUrl
    case unsupportedHttpMethod
    case networkError(String)
    case emptyData
    case badRequest
    case missingCredentials
    case authenticationFailed
    case alreadyExists
    case serviceUnavailable
    case internalServerError
    case internetConnectionProblem
    
    public static func ==(lhs: NetworkServiceError, rhs: NetworkServiceError) -> Bool {
        switch (lhs, rhs) {
        case (.badUrl, .badUrl),
             (.badRequest, .badRequest),
             (.unsupportedHttpMethod, .unsupportedHttpMethod),
             (.networkError, .networkError),
             (.missingCredentials,.missingCredentials),
             (.authenticationFailed, .authenticationFailed),
             (.alreadyExists, .alreadyExists),
             (.internalServerError, .internalServerError),
             (.internetConnectionProblem, .internetConnectionProblem):
            return true
        default:
            return false
        }
    }

    init?(responseStatus: Int) { //TODO all from api server
        switch responseStatus {
        case 400:
            self = .badRequest
        case 401:
            self = .missingCredentials
        case 403:
            self = .authenticationFailed
        case 409:
            self = .alreadyExists
        case 503:
            self = .serviceUnavailable
        case 500:
            self = .internalServerError
        case -1001:
            self = .internetConnectionProblem
        case -1003:
             self = .internetConnectionProblem
            
        default:
            return nil
        }
    }
}

