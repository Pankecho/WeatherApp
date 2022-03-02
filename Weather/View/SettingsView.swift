//
//  SettingsView.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var selectedUnit: TemperatureUnit = .celsius

    var body: some View {
        VStack {
            Picker(selection: $selectedUnit) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)")
                }
            } label: {
                Text("Select temperature unit")
            }
            .padding()
            .pickerStyle(.segmented)

            Spacer()
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Text("Done")
        }))
        .embedInNV()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
