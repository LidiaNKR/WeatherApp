//
//  DailyWeatherViewModel.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

protocol DailyWeatherViewModelInput {
    func executeFetch()
}

protocol DailyWeatherViewModelOutput {
    var dailyWeather: [WeatherEntity] { get }
}

final class DailyWeatherViewModel: ObservableObject, DailyWeatherViewModelOutput {
    
    @Published private(set) var dailyWeather: [WeatherEntity] = []
    private var cancellables: Set<AnyCancellable> = []
    
    private let useCase: FetchDailyWeatherUseCaseInterface
    
    init(useCase: FetchDailyWeatherUseCaseInterface) {
        self.useCase = useCase
    }
}

extension DailyWeatherViewModel: DailyWeatherViewModelInput {
    
    func executeFetch() {
        useCase.exucute(query: "moscow", days: 5)
            .sink { completion in
                switch completion {
                case .failure(let error) :
                    print(error.localizedDescription)
                default: break
                }
                
            } receiveValue: { [weak self] dailyWeather in
                guard let self else { return }

                self.dailyWeather = dailyWeather
                
            }
            .store(in: &cancellables)
    }
}
