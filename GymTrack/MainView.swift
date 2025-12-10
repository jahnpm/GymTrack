//
//  MainView.swift
//  GymTrack
//
//  Created by jahnpm on 21.11.25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Text("Statistics Tab")
                .tabItem {
                    Label("Statistics", systemImage: "chart.line.uptrend.xyaxis")
                }
            ExerciseListView()
                .tabItem {
                    Label("Exercises", systemImage: "dumbbell")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(PreviewData.container)
}
