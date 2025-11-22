//
//  AddSetView.swift
//  GymTrack
//
//  Created by jahnpm on 22.11.25.
//

import SwiftUI
import SwiftData

struct AddSetView: View {
    @Bindable var exercise: Exercise
    @Binding var isPresented: Bool
    
    @State private var weight: Double = 0.0
    @State private var repetitions: Int = 0
    
    var body: some View {
        Form {
            Section("New Set") {
                TextField( "Weight", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Repetitions", value: $repetitions, format: .number)
                    .keyboardType(.numberPad)
            }
            Section {
                Button("Submit") {
                    let newSet = SetRecord(weight: weight, repetitions: repetitions)
                    exercise.lastRecord = newSet
                    isPresented = false
                }
            }
        }
    }
}

#Preview {
    let exercise = try! PreviewData.container.mainContext.fetch(FetchDescriptor<Exercise>()).first!
    AddSetView(exercise: exercise, isPresented: .constant(true))
        .modelContainer(PreviewData.container)
}
