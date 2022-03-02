//
//  AddCityView.swift
//  Weather
//
//  Created by Juan Pablo Martinez Ruiz on 02/03/22.
//

import SwiftUI

struct AddCityView: View {
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = AddWeatherViewModel()

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Enter City", text: $viewModel.city)
                    .textFieldStyle(.roundedBorder)

                Button {
                    viewModel.save { vm in
                        store.addWeather(vm)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Save")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Add City")
        .embedInNV()
    }
}

struct AddCityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCityView()
    }
}
