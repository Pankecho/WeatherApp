//
//  Date.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

extension Date {
    func format() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
}
