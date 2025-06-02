//
//  ErrorResponse.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import Foundation

struct APIErrorResponse: Decodable {
    let error: APIError
}

struct APIError: Decodable, Error {
    let code: Int
    let message: String
}
