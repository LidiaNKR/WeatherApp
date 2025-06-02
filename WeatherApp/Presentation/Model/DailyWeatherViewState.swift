//
//  DailyWeatherViewState.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import Foundation

enum DailyWeatherViewState: Equatable {
    case loading
    case loaded(WeatherEntity)
    case noResults
    case reload
}
