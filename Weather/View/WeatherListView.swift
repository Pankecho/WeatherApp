//
//  WeatherList.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import SwiftUI
import URLImage

private enum Sheets: Identifiable {
    var id: UUID {
        return UUID()
    }

    case add
    case settings
}

struct WeatherListView: View {
    @EnvironmentObject private var store: Store
    @State private var activeSheet: Sheets?

    var body: some View {
        List {
            ForEach(Array(store.weatherList), id: \.city) { item in
                WeatherCell(vm: item, unit: store.selectedUnit)
            }
        }
        .listStyle(.plain)
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }, label: {
            Image(systemName: "gearshape")
        }), trailing: Button(action: {
            activeSheet = .add
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Cities")
        .embedInNV()
        .sheet(item: $activeSheet) { item in
            switch item {
            case .add:
                AddCityView()
                    .environmentObject(store)
            case .settings:
                SettingsView()
                    .environmentObject(store)
            }
        }
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
            .environmentObject(Store())
    }
}

struct WeatherCell: View {
    private let unit: TemperatureUnit
    private let viewModel: WeatherViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15 ) {
                Text(viewModel.city)
                    .fontWeight(.bold)

                HStack {
                    Image(systemName: "sunrise")
                    Text(viewModel.sunrise)
                }

                HStack {
                    Image(systemName: "sunset")
                    Text(viewModel.sunset)
                }
            }
            Spacer()

            URLImage(viewModel.icon) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }

            Text("\(viewModel.convertTemperature(to: unit)) \(String(unit.displayText.prefix(1)))")
        }
        .padding()
        .cornerRadius(10)
    }

    init(vm: WeatherViewModel, unit: TemperatureUnit) {
        self.viewModel = vm
        self.unit = unit
    }
}
