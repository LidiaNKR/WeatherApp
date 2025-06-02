//
//  APIURL.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation

enum APIConstant {
    
    // Базовый URL
    static let baseURL = "https://api.weatherapi.com/v1/forecast.json"
    
    // Ключ доступа к API
    static let accessKey = "3bc8011781744cd09af123836250106"
}

enum APIURL {
    
    // Ссылка JSON API
    static func url(query: String, days: Int) -> URL? {
        let baseURL = APIConstant.baseURL
        let asccessKey = "&key=\(APIConstant.accessKey)"
        let query = "?q=\(query)"
        let days = "&days=\(days)"
        
        let url = baseURL + query + days + asccessKey
        
        return URL(string: url)
    }
}
