//
//  TemperatureUnit.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import Foundation

public enum TemperatureUnit: String, CaseIterable, Identifiable {
    public var id: String {
        return rawValue
    }

    case celsius
    case fahrenheit
    case kelvin
}

extension TemperatureUnit {
    var displayText: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
}
