//
//  APIRouter.swift
//  UsersApp-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 4/09/21.
//

import Foundation

enum APIRouter {
    
    case Users
    case Posts([String: Any])
    
    private var method: HTTPMethod {
        switch self {
        case .Users,
             .Posts:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Users:
            return "users"
        case .Posts:
            return "posts"
        }
    }
    
    private var url: String {
        APIManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Users,
             .Posts:
            return nsUrlRequest
        }
    }
    
}

