//
//  EndPoint.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import Foundation

// API için bir protocol tanımladım.

protocol EndPointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get } 
    func fullURL() -> String
    func urlRequest() -> URLRequest
}

// HTTP methodları. Şimdilik ihtiyacım olan get methodunu kullandım.

enum HTTPMethod: String {
    case get = "GET"
}

// Ana URL'nin uzantısını almak için.

enum EndPoint {
    case getUsers
}

// EndPoint enumunun özelliklerini extension ile genişletip protocol uyguladım.

extension EndPoint: EndPointProtocol {
    var baseUrl: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        return "/users"
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers: .get
        }
    }
    
    func fullURL() -> String {
        return "\(baseUrl)\(path)"
    }
    
    func urlRequest() -> URLRequest {
        guard let url = URL(string: fullURL()) else { fatalError() }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
