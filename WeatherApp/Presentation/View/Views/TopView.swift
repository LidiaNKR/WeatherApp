//
//  TopView.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import SwiftUI

// Вью текущего прогноза погоды
struct TopView: View {
    
    // MARK: - Properties
    
    private let currentWeather: WeatherEntity
    
    // MARK: - Init
    
    init(currentWeather: WeatherEntity) {
        self.currentWeather = currentWeather
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            Text(currentWeather.city)
                .font(.system(size: Constants.fontXL))
            
            Text("\(currentWeather.tempC) °c")
                .font(.system(size: Constants.fontXXL))
            
            HStack {
                Text("Wind: \(currentWeather.windKph) kmph")
                Text("Feels like: \(currentWeather.feelslikeC) °c")
            }
            .font(.system(size: Constants.fontXS))
        }
        .padding(.top, Constants.paddingTop)
        .padding(.vertical, Constants.paddingVertical)
        .padding(.bottom, Constants.paddingBottom)
    }
}

// MARK: - Constants

private extension TopView {
    
    enum Constants {
        static let spacing: CGFloat = 8
        static let paddingTop: CGFloat = 16
        static let paddingVertical: CGFloat = 4
        static let paddingBottom: CGFloat = 24
        static let fontXS: CGFloat = 12
        static let fontXL: CGFloat = 24
        static let fontXXL: CGFloat = 46
    }
}

#Preview {
    TopView(currentWeather: WeatherEntity.mock())
}
