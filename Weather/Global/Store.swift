//
//  Store.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

public final class Store: ObservableObject {
    @Published var weatherList: Set<WeatherViewModel> = Set<WeatherViewModel>()

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.insert(weather)
    }
}
