//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    // MARK: - Properties
    
    private let container = AppContainer.shared
    
    // MARK: - Scene
    
    var body: some Scene {
        WindowGroup {
            DailyWeatherView(viewModel: container.makeDailyWeatherViewModel())
        }
    }
}
