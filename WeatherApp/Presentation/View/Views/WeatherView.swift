//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import SwiftUI

// Основной вью прогноза погоды
struct WeatherView: View {
    
    // MARK: - Properties
    
    private let weather: WeatherEntity
    
    // MARK: - Init
    
    init(weather: WeatherEntity) {
        self.weather = weather
    }
    
    // MARK: - View
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            TopView(currentWeather: weather)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                    Text("5 day forecast")
                }
                .font(.system(size: Constants.fontXS))
                
                ForEach(weather.dailyWeather) { weather in
                    Divider()
                    
                    DailyWeatherCell(weather: weather)
                }
            }
            .padding()
            .background(.ultraThinMaterial.opacity(Constants.opacity))
            .cornerRadius(Constants.cornerRadius)
            .padding(.bottom, Constants.paddingBottom)
        }
    }
}

// MARK: - Constants

private extension WeatherView {
    
    enum Constants {
        static let cornerRadius: CGFloat = 16.0
        static let fontXS: CGFloat = 16
        static let opacity: CGFloat = 0.5
        static let paddingBottom: CGFloat = 32
    }
}

#Preview {
    WeatherView(weather: WeatherEntity.mock())
}
