//
//  WeatherEntity.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation

// MARK: - WeatherEntity

struct WeatherEntity: Identifiable, Hashable {
    let id: UUID = UUID()
    let city: String
    let tempC: String
    let isDay: Bool
    let windKph: String
    let feelslikeC: String
    let dailyWeather: [DailyWeather]
}

extension WeatherEntity {
    init(from dto: WeatherDTO) {
        city = dto.location.name
        tempC = dto.current.tempC.roundedOneDecimal()
        isDay = dto.current.isDay != .zero
        windKph = dto.current.windKph.roundedOneDecimal()
        feelslikeC = dto.current.feelslikeC.roundedOneDecimal()
        dailyWeather = dto.forecast.forecastday.map{ .init(dto: $0 )}
    }
}

// MARK: - DailyWeather

struct DailyWeather: Identifiable, Hashable {
    let id: UUID = UUID()
    let date: String
    let text: String
    let icon: String
    let tempC: String
    let maxwindKph: String
    let humidity: Int
}

// MARK: - Mock

extension DailyWeather {
    init(dto: Forecastday) {
        date = dto.date
        text = dto.day.condition.text
        icon = dto.day.condition.icon
        tempC = dto.day.avgtempC.roundedOneDecimal()
        maxwindKph = dto.day.maxwindKph.roundedOneDecimal()
        humidity = dto.day.avghumidity
    }
}

extension WeatherEntity {
    static func mock() -> WeatherEntity {
        .init(
            city: "Moscow",
            tempC: "10.4",
            isDay: true,
            windKph: "11.9",
            feelslikeC: "8.8",
            dailyWeather: [.init(
                date: "2025-06-02",
                text: "Clear",
                icon: "//cdn.weatherapi.com/weather/64x64/night/113.png",
                tempC: "12.1",
                maxwindKph: "18.0",
                humidity: 54
            )]
        )
    }
}
