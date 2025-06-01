//
//  String.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation

extension String {
    
    func formattedIconURL() -> URL? {
        guard
            let formattedString = self.replacingOccurrences(of: "\\/", with: "/") as String?,
            let url = URL(string: "https:\(formattedString)")
        else {
            return nil
        }
        return url
    }
}
