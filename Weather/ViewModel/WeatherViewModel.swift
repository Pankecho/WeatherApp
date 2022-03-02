//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

public struct WeatherViewModel {
    private let weather: Weather

    var id: String {
        return "\(weather.id)"
    }

    var temperature: Int {
        return Int(weather.temperature)
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

    var icon: URL {
        return URL(string: Constants.URLs.getWeatherIcon(using: weather.icon))!
    }

    init(w: Weather) {
        weather = w
    }
}

extension WeatherViewModel: Hashable {
    
    public var hashValue: Int {
        return weather.id
    }

    public static func == (lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
