//
//  AppContainer.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import SwiftUI

final class AppContainer {
    
    // MARK: - Singleton
    
    static let shared = AppContainer()
    
    init() {}
    
    // MARK: - Internal Methods
    
    func makeDailyWeatherViewModel() -> DailyWeatherViewModel {
        let dataSource: FetchWeatherDataSourceInterface = RemoteDataSourceImpl()
        let repository: FetchWeatherRepositoryInterface = FetchWeatherRepositoryImpl(dataSource: dataSource)
        let useCase: FetchDailyWeatherUseCaseInterface = FetchWeatherUseCaseImpl(repository: repository)
        let viewModel = DailyWeatherViewModel(useCase: useCase)
        
        return viewModel
    }
}
