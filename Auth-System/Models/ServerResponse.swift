//
//  ServerResponse.swift
//  Auth-System
//
//  Created by Kenan Baylan on 24.03.2023.
//

import Foundation

class SuccessResponse: Decodable {
    let success: String
}


class ErrorResponse: Decodable {
    let error: String
}
