//
//  Endpoints.swift
//  Auth-System
//
//  Created by Kenan Baylan on 24.03.2023.
//

import Foundation

enum Endpoints {
    
    case createAccount(path: String = "auth/create-account", userRequest: RegisterUser)
    case getData(path: String = "data/get-data")
    
    
    
    //tüm gerekli network işlemlerini tek bir request isteğinde birleştirdik.
    var request: URLRequest? {
        
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.addValues(for: self)
        request.httpBody = self.httpBody
        return request
        
    }
    
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.port = Int(Constants.port)
        components.host = Constants.baseUrl
        components.path = self.path
        return components.url
        
    }
    
    private var path: String {
        switch self {
        case .createAccount( let path, _), .getData(let path):
            return path
            
        }
        
    }
    
    private var httpMethod:String {
        switch self {
        case .createAccount:
            return HTTP.Method.post.rawValue
            
        case .getData:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        
        switch self {
            
        case .createAccount(_, userRequest: let userRequest):
            return try? JSONEncoder().encode(userRequest)
            
        case .getData:
            return nil
        }
        
    }
    
}

extension URLRequest {
    
    mutating func addValues(for endpoint: Endpoints) {
        switch endpoint {
        case .createAccount,
              .getData:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
            
        }
        
    }
    
}

