//
//  DailyWeatherCell.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

// Ячейка ежедневного прогноза погоды
struct DailyWeatherCell: View {
    
    // MARK: - Properties
    
    private let weather: DailyWeather
    
    // MARK: - Init
    
    init(weather: DailyWeather) {
        self.weather = weather
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Text(weather.date.formatDayWeekdayMonth())
                .font(.system(size: Constants.fontS, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                
                if let iconURL = weather.icon.formattedIconURL() {
                    AsyncImage(
                        url: iconURL,
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: Constants.iconSize,
                                       maxHeight: Constants.iconSize)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
                
                Text("\(weather.tempC) °c")
                    .font(.system(size: Constants.fontM, weight: .heavy))
                
                Text(weather.text)
                    .font(.system(size: Constants.fontM))
                    .lineLimit(Constants.lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, Constants.paddingS)
            }
            
            HStack {
                Text("Max wind: \(weather.maxwindKph) kmph")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Humidity: \(weather.humidity) %")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.system(size: Constants.fontXS, weight: .thin))
        }
        .padding(.vertical, Constants.paddingXS)
    }
}

// MARK: - Constants

private extension DailyWeatherCell {
    
    enum Constants {
        static let iconSize: CGFloat = 40
        static let cornerRadius: CGFloat = 16.0
        static let lineLimit: Int = 1
        static let paddingXS: CGFloat = 4
        static let paddingS: CGFloat = 8
        static let fontXS: CGFloat = 16
        static let fontS: CGFloat = 18
        static let fontM: CGFloat = 20
    }
}

#Preview {
    DailyWeatherCell(weather: WeatherEntity.mock().dailyWeather.first!)
}
