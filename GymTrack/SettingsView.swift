//
//  SettingsView.swift
//  GymTrack
//
//  Created by jahnpm on 21.11.25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("defaultWeightUnit") private var defaultWeightUnit: String = "kg"
    @AppStorage("defaultWeightSteps") private var defaultWeightSteps: Double = 2.5
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Default Weight Settings")) {
                    Picker("Unit", selection: $defaultWeightUnit) {
                        Text("kg").tag("kg")
                        Text("lbs").tag("lbs")
                    }
                    .pickerStyle(.segmented)
                    Stepper(value: $defaultWeightSteps, in: 0.25...100.0, step: 0.25) {
                        HStack {
                            Text("Steps")
                            Spacer()
                            TextField("",
                                      value: $defaultWeightSteps,
                                      format: .number.precision(.fractionLength(2)))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("\(defaultWeightUnit)")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
