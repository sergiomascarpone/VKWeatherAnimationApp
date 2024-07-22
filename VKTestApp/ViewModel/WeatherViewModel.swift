//
//  WeatherViewModel.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import Foundation

class WeatherViewModel {
    let weathers: [Weather] = [
        Weather(type: .clear),
        Weather(type: .rain),
        Weather(type: .wind),
        Weather(type: .snow),
        Weather(type: .cloudy),
        Weather(type: .storm),
        Weather(type: .fog)
    ]
    
    func getRandomWeather() -> Weather {
        return weathers.randomElement()!
    }
}

