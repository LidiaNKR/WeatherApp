//
//  FetchWeatherDataSourceInterface.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

protocol FetchWeatherDataSourceInterface {
    func getWeather(query: String, days: Int) -> AnyPublisher<WeatherDTO, Error>
}
