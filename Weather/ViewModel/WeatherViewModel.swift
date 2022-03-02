//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

public struct WeatherViewModel {
    private let weather: Weather

    var temperature: Double {
        return weather.temperature
    }

    var city: String {
        return weather.city
    }

    var sunrise: String {
        return weather.sunrise.format()
    }

    var sunset: String {
        return weather.sunset.format()
    }

    init(w: Weather) {
        weather = w
    }
}
