//
//  String.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import Foundation

extension String {
    
    static let emptiness = ""
    
    /// Форматирование URL- адреса изображения
    /// - Returns: Отформатированный URL?
    func formattedIconURL() -> URL? {
        guard
            let formattedString = self.replacingOccurrences(of: "\\/", with: "/") as String?,
            let url = URL(string: "https:\(formattedString)")
        else {
            return nil
        }
        return url
    }
    
    /// Форматирование даты
    /// - Returns: Дата в формате String вида 
    func formatDayWeekdayMonth() -> String {
        guard let date = dateFromStringYYYYMMDD(from: self) else {
            return .emptiness
        }
        
        let formatter = Date.FormatStyle()
            .day()
            .weekday()
            .month(.wide)
            .locale(.init(identifier: "en_US"))
        return date.formatted(formatter)
    }
    
    /// Форматирование даты из String в Data
    /// - Parameter string: Дата в формате строки
    /// - Returns: Дата в формате "yyyy-MM-dd"
    private func dateFromStringYYYYMMDD(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: string)
    }
}
