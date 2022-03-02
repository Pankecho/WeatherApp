//
//  Weather.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

public struct WeatherResponse: Decodable {
    let name: String
    let weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys

    private enum CodingKeys: String, CodingKey {
        case name
        case weather = "main"
        case icon = "weather"
        case sys
    }

    private enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        icon = try container.decode([WeatherIcon].self, forKey: .icon)
        sys = try container.decode(Sys.self, forKey: .sys)

        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)

        self.weather = Weather(city: name,
                               temperature: temperature,
                               icon: icon.first?.icon ?? "",
                               sunset: sys.sunset,
                               sunrise: sys.sunrise)
    }
}

public struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

public struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date

    private enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunrise = try container.decode(Int32.self, forKey: .sunrise)
        let sunset = try container.decode(Int32.self, forKey: .sunset)

        self.sunrise = Date(timeIntervalSince1970: TimeInterval(sunrise))
        self.sunset = Date(timeIntervalSince1970: TimeInterval(sunset))
    }
}

public struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunset: Date
    let sunrise: Date
}
