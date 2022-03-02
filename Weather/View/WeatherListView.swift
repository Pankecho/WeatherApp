//
//  WeatherList.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import SwiftUI

private enum Sheets: Identifiable {
    var id: UUID {
        return UUID()
    }

    case add
    case settings
}

struct WeatherListView: View {
    @State private var activeSheet: Sheets?

    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("\(index)")
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
            case .settings:
                SettingsView()
            }
        }
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}

struct WeatherCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15 ) {
                Text("Houston")
                    .fontWeight(.bold)

                HStack {
                    Image(systemName: "")
                    Text("\(Date().format())")
                }

                HStack {
                    Image(systemName: "")
                    Text("\(Date().format())")
                }
            }
            Spacer()

            Text("72 F")
        }
        .padding()
        .cornerRadius(10)
    }
}
