//
//  DailyWeatherViewModel.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

protocol DailyWeatherViewModelInput {
    func load(query: String)
    func reload()
}

protocol DailyWeatherViewModelOutput: ObservableObject {
    var dailyWeatherViewState: DailyWeatherViewState { get }
    var isDay: Bool { get }
    var searchQuery: String { get set }
    var showAlert: Bool { get }
    var alertMessage: String { get }
}

final class DailyWeatherViewModel: DailyWeatherViewModelOutput {
    
    // MARK: - Properties
    
    @Published private var lastLoadedWeather: WeatherEntity?
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: FetchDailyWeatherUseCaseInterface
    
    // MARK: - Output
    
    @Published private(set) var dailyWeatherViewState: DailyWeatherViewState = .loading
    @Published var isDay: Bool = true
    @Published var searchQuery: String = .emptiness
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = .emptiness
    
    // MARK: - Init
    
    init(useCase: FetchDailyWeatherUseCaseInterface) {
        self.useCase = useCase
        
        setupSearchQueryPublisher()
    }
    
    // MARK: - Private Methods
    
    /// Наблюдатель изменения поискового запроса с отложеным запросом данных из сети
    private func setupSearchQueryPublisher() {
        $searchQuery
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self else { return }
                
                if query.isEmpty, let lastLoadedWeather {
                    self.dailyWeatherViewState = .loaded(lastLoadedWeather)
                } else if self.dailyWeatherViewState != .loading {
                    self.dailyWeatherViewState = .loading
                    self.executeFetch(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    /// Обработка полученных данных из сети
    /// - Parameters:
    ///   - query: Город для получения прогноза погоды
    ///   - days: Количество дней прогноза
    private func executeFetch(query: String, days: Int = 5) {
        useCase.exucute(query: query, days: days)
            .sink { [weak self] completion in
                guard let self else { return }
                
                switch completion {
                case .failure(let error):
                    guard
                        let apiError = error as? APIError,
                        apiError.code == 1006
                    else {
                        self.showAlert(with: error.localizedDescription)
                        return
                    }
                    
                    self.dailyWeatherViewState = .noResults
                    
                default: break
                }
            } receiveValue: { [weak self] dailyWeather in
                guard let self else { return }

                self.lastLoadedWeather = dailyWeather
                self.dailyWeatherViewState = .loaded(dailyWeather)
                self.isDay = dailyWeather.isDay
            }
            .store(in: &cancellables)
    }
    
    /// При получении ошибки отображаем алерт с описанием ошибки
    /// Стейт экрана переводим в reload, для возможности отправки повторного запроса
    /// - Parameter message: Текст ошибки
    private func showAlert(with message: String) {
        showAlert = true
        alertMessage = message
        dailyWeatherViewState = .reload
    }
}

// MARK: - Input

extension DailyWeatherViewModel: DailyWeatherViewModelInput {
    
    func load(query: String = "moscow") {
        executeFetch(query: query)
    }
    
    func reload() {
        let query = searchQuery.isEmpty ? "moscow" : searchQuery
        executeFetch(query: query)
    }
}
