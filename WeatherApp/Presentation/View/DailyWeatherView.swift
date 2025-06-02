//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

struct DailyWeatherView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: DailyWeatherViewModel
    @FocusState private var isFocused: Bool
    
    // MARK: - Init
    
    init(viewModel: DailyWeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            setBackgroundGradient().ignoresSafeArea()
            
            VStack {
                SearchBar(placeHolder: "City search...",
                          text: $viewModel.searchQuery,
                          isFocused: _isFocused)
                
                VStack {
                    switch viewModel.dailyWeatherViewState {
                    case .loading:
                        ProgressView()
                    case .loaded(let weatherEntity):
                        WeatherView(weather: weatherEntity)
                    case .noResults:
                        Text("No results found for country: \(viewModel.searchQuery)")
                    case .reload:
                        Button {
                            viewModel.load()
                        } label: {
                            Text("Update")
                                .padding()
                                .background(.ultraThinMaterial.opacity(Constants.opacity))
                                .foregroundStyle(.white)
                                .cornerRadius(Constants.cornerRadius)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                .onTapGesture {
                    isFocused = false
                }
            }
            .padding()
            .animation(.easeInOut,
                       value: viewModel.dailyWeatherViewState)
            .alert(viewModel.alertMessage, 
                   isPresented: $viewModel.showAlert,
                   actions: {})
            .edgesIgnoringSafeArea(.bottom)
            .task {
                viewModel.load()
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func setBackgroundGradient() -> LinearGradient {
        viewModel.isDay ? Color.dayGradient : Color.nigntGradient
    }
}

// MARK: - Constants

private extension DailyWeatherView {
    
    enum Constants {
        static let cornerRadius: CGFloat = 16.0
        static let opacity: CGFloat = 0.5
    }
}
