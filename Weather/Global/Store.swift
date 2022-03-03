//
//  Store.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

public final class Store: ObservableObject {
    @Published var weatherList: Set<WeatherViewModel> = Set<WeatherViewModel>()
    @Published var selectedUnit: TemperatureUnit = .kelvin

    init() {
        selectedUnit = UserDefaults.standard.unit
    }

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.insert(weather)
    }
}
