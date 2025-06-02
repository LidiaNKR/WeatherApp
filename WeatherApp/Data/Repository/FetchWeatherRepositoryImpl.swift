//
//  FetchWeatherRepositoryImpl.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

final class FetchWeatherRepositoryImpl: FetchWeatherRepositoryInterface {
    
    private let dataSource: FetchWeatherDataSourceInterface
    
    init(dataSource: FetchWeatherDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func fetchWeather(query: String, days: Int) -> AnyPublisher<WeatherEntity, Error> {
        return dataSource.getWeather(query: query, days: days)
            .map { WeatherEntity(from: $0 )}
            .eraseToAnyPublisher()
    }
}
