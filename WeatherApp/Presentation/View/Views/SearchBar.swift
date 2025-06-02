//
//  SearchBar.swift
//  WeatherApp
//
//  Created by Лидия Некрасова on 01.06.2025.
//

import SwiftUI

// Поле поиска на экране прогноза погоды
struct SearchBar: View {
    
    // MARK: - Properties
    
    private let placeHolder: String
    @Binding private var text: String
    @State private var isEditing = false
    @FocusState private var isFocused: Bool
    
    // MARK: - Init
    
    init(placeHolder: String,
         text: Binding<String>,
         isFocused: FocusState<Bool>) {
        self.placeHolder = placeHolder
        self._text = text
        self._isFocused = isFocused
    }

    // MARK: - View
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: Constants.searchIcon)
                    .frame(width: Constants.iconSize,
                           height: Constants.iconSize)
                    .foregroundColor(.white)
                
                TextField(placeHolder, text: $text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .submitLabel(.done)
                    .focused($isFocused)
                
                if !text.isEmpty {
                    Button {
                        text = .emptiness
                    } label: {
                        Image(systemName: Constants.clearIcon)
                            .frame(width: Constants.iconSize,
                                   height: Constants.iconSize)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial.opacity(Constants.opacity))
            .cornerRadius(Constants.cornerRadius)
        }
        .frame(height: Constants.height)
    }
}

// MARK: - Constants

private extension SearchBar {
    
    enum Constants {
        static let searchIcon: String = "magnifyingglass"
        static let clearIcon: String = "multiply"
        static let iconSize: CGFloat = 25
        static let cornerRadius: CGFloat = 16.0
        static let height: CGFloat = 44
        static let opacity: CGFloat = 0.5
    }
}

#Preview {
    SearchBar(
        placeHolder: "City search...",
        text: .constant(.emptiness),
        isFocused: .init()
    )
}
