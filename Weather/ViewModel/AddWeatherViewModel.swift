//
//  AddWeatherViewModel.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    var city = ""

    private let client = HttpClient()

    func save(completion: @escaping (WeatherViewModel) -> Void) {
        client.getWeather(by: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherViewModel(w: weather))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
