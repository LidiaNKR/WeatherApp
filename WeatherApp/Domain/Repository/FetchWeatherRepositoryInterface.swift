//
//  FetchWeatherRepositoryInterface.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

protocol FetchWeatherRepositoryInterface {
    func fetchWeather(query: String, days: Int) -> AnyPublisher<[WeatherEntity], Error>
}
