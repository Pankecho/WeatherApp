//
//  Constants.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

public struct Constants {

    public static let API_KEY = "335a6da2bb0a7a12dbce8433f00f8b8d"

    public struct URLs {
        static func getWeather(by city: String) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped)&appid=\(Constants.API_KEY)")
        }

        static func getWeatherIcon(using icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
