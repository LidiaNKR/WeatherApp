//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation

// MARK: - WeatherDTO

struct WeatherDTO: Codable, Hashable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: - CurrentDTO

struct Current: Codable, Hashable {
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let windKph: Double
    let feelslikeC: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windKph = "wind_kph"
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - ConditionDTO

struct Condition: Codable, Hashable {
    let text: String
    let icon: String
}

// MARK: - ForecastDTO

struct Forecast: Codable, Hashable {
    let forecastday: [Forecastday]
}

// MARK: - ForecastdayDTO

struct Forecastday: Codable, Hashable {
    let date: String
    let day: Day
}

// MARK: - DayDTO

struct Day: Codable, Hashable {
    let avgtempC, maxwindKph: Double
    let avghumidity: Int
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case maxwindKph = "maxwind_kph"
        case avghumidity
        case condition
    }
}

// MARK: - LocationDTO

struct Location: Codable, Hashable {
    let name: String
}
