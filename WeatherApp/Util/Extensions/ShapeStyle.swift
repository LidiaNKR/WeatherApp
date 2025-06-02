//
//  ShapeStyle.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 02.06.2025.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    
    static var dayGradient: LinearGradient {
        LinearGradient(stops: [.init(color: .blueCustom, location: 0.6),
                               .init(color: .white, location: 1)],
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    static var nigntGradient: LinearGradient {
        LinearGradient(stops: [.init(color: .darkBlueCustom, location: 0.6),
                               .init(color: .purpleCustom, location: 1)],
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
