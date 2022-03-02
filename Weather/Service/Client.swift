//
//  Client.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

public enum NetworkError: Error {
    case badURL
    case noData
}

public protocol Client {
    func getWeather(by city: String,
                    completion: @escaping ((Result<Weather, NetworkError>) -> Void))
}

public final class HttpClient: Client {
    public func getWeather(by city: String,
                           completion: @escaping ((Result<Weather, NetworkError>) -> Void)) {
        guard let url = Constants.URLs.getWeather(by: city) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return completion(.failure(.noData))
            }

            if let response = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                completion(.success(response.weather))
            }
        }
        .resume()
    }
}
