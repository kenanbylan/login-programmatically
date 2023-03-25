//
//  AuthService.swift
//  Auth-System
//
//  Created by Kenan Baylan on 24.03.2023.
//

import Foundation

enum ServiceError: Error {
    case serverError(String)
    case unknow(String = "An unknown error occured.")
    case decodingError(String = "Error parsing server response.")
}


class AuthService {
    
    static func createAccount(request: URLRequest, completion: @escaping (Result<String,Error>) -> Void ) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serverError(error.localizedDescription)))
                } else {
                    completion(.failure(ServiceError.unknow()))
                }
                return
            }
            
            
            let decoder = JSONDecoder()
            
            if let successMessage = try? decoder.decode(SuccessResponse.self, from: data) {
                completion(.success(successMessage.success))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serverError(errorMessage.error)))
                return
            } else {
                completion(.failure(ServiceError.decodingError()))
                return
            }
            
        }.resume()
    }
}
