//
//  Double.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import Foundation

extension Double {
    
    /// Округление числа до одной цифры после запятой
    func roundedOneDecimal() -> String {
        String(format: "%.1f", self)
    }
}
