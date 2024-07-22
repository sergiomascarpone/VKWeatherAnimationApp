//
//  Weather.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import Foundation

enum WeatherType: String, CaseIterable {
    case clear = "Clear"
    case rain = "Rain"
    case wind = "Wind"
    case fog = "Fog"
    case snow = "Snow"
    case cloudy = "Cloudy"
    case storm = "Storm"
    
    var localized: String {
        switch self {
        case .clear:
            return NSLocalizedString("Clear", comment: "Clear weather")
        case .rain:
            return NSLocalizedString("Rain", comment: "Rainy weather")
        case .wind:
            return NSLocalizedString("Wind", comment: "Windy weather")
        case .fog:
            return NSLocalizedString("Fog", comment: "Foggy weather")
        case .snow:
            return NSLocalizedString("Snow", comment: "Snowy weather")
        case .cloudy:
            return NSLocalizedString("Cloudy", comment: "Cloudy weather")
        case .storm:
            return NSLocalizedString("Storm", comment: "Stormy weather")
        }
    }
}

struct Weather {
    let type: WeatherType
}

