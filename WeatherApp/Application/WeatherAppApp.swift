//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    var body: some Scene {
        
        // TODO: Убрать в DI
        let repository = FetchWeatherRepositoryImpl(dataSource: RemoteDataSourceImpl())
        let useCase = FetchWeatherUseCaseImpl(repository: repository)
        let viewModel = DailyWeatherViewModel(useCase: useCase)
        
        WindowGroup {
            DailyWeatherView(viewModel: viewModel)
        }
    }
}
