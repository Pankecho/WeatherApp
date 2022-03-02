//
//  UserDefaults.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

extension UserDefaults {

    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .celsius
        }
        return TemperatureUnit(rawValue: value) ?? .celsius
    }
}
