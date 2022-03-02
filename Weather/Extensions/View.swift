//
//  View.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 01/03/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNV() -> some View {
        return NavigationView { self }
    }
}
