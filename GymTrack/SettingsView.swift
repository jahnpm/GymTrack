//
//  SettingsView.swift
//  GymTrack
//
//  Created by jahnpm on 21.11.25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("defaultUnits") private var defaultUnits: String = "kg"
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Default units")) {
                    Picker("", selection: $defaultUnits) {
                        Text("kg").tag("kg")
                        Text("lbs").tag("lbs")
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
