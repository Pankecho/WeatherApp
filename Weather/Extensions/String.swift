//
//  String.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation

extension String {
    var escaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
