//
//  SettingsView.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin

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
            store.selectedUnit = selectedUnit
        }, label: {
            Text("Done")
        }))
        .embedInNV()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Store())
    }
}
