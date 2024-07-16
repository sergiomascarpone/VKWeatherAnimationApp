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
    case storm = "Storm"
    case fog = "Fog"
    
    var localized: String {
        switch self {
        case .clear:
            return NSLocalizedString("Clear", comment: "Clear weather")
        case .rain:
            return NSLocalizedString("Rain", comment: "Rainy weather")
        case .storm:
            return NSLocalizedString("Storm", comment: "Stormy weather")
        case .fog:
            return NSLocalizedString("Fog", comment: "Foggy weather")
        }
    }
}

struct Weather {
    let type: WeatherType
}

//import Foundation
//
//enum WeatherType: String {
//    case clear = "Clear"
//    case rain = "Rain"
//    case storm = "Storm"
//    case fog = "Fog"
//    
//    var localized: String {
//        switch self {
//        case .clear:
//            return NSLocalizedString("Clear", comment: "Clear weather")
//        case .rain:
//            return NSLocalizedString("Rain", comment: "Rainy weather")
//        case .storm:
//            return NSLocalizedString("Storm", comment: "Stormy weather")
//        case .fog:
//            return NSLocalizedString("Fog", comment: "Foggy weather")
//        }
//    }
//}
//
//struct Weather {
//    let type: WeatherType
//}
