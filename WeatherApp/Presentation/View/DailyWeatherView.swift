//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @StateObject private var viewModel: DailyWeatherViewModel
    
    init(viewModel: DailyWeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.dailyWeather) { weather in
                    VStack {
                        Text(weather.text)
                        
                        if let iconURL = weather.icon.formattedIconURL() {
                            AsyncImage(url: iconURL)
                                .frame(width: 50, height: 50, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                        }
                        Text("\(weather.tempC)")
                        Text("\(weather.maxwindKph)")
                        Text("\(weather.humidity)")
                    }
                }
            }
        }
        .padding()
        .task {
            viewModel.executeFetch()
        }
    }
}

//#Preview {
//    HomeView(viewModel: HomeViewModel())
//}
