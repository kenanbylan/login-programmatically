//
//  HTTP.swift
//  Auth-System
//
//  Created by Kenan Baylan on 24.03.2023.
//

import Foundation

enum HTTP {
    
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        
        enum Key:String {
            case contentType = "Content-Type"
            
        }
        enum Value: String {
            case applicationJson = "application/json"
            
        }
    }
    
    
    
}
