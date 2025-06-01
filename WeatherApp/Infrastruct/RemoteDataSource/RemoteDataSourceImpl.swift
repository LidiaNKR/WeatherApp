//
//  RemoteDataSourceImpl.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation
import Combine

final class RemoteDataSourceImpl: FetchWeatherDataSourceInterface {
    
    func getWeather(query: String, 
                    days: Int) -> AnyPublisher<WeatherDTO, Error> {
        guard
            let url = APIURL.url(query: query, days: days)
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        return dataPublisher
    }
}
