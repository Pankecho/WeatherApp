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
    }
}
