//
//  FetchWeatherUseCase.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

protocol FetchDailyWeatherUseCaseInterface {
    func exucute(query: String, days: Int) -> AnyPublisher<[WeatherEntity], Error>
}

final class FetchWeatherUseCaseImpl: FetchDailyWeatherUseCaseInterface {
    
    private let repository: FetchWeatherRepositoryInterface
    
    init(repository: FetchWeatherRepositoryInterface) {
        self.repository = repository
    }
    
    func exucute(query: String, days: Int) -> AnyPublisher<[WeatherEntity], Error> {
        repository.fetchWeather(query: query, days: days)
    }
}
