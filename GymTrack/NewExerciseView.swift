//
//  NewExerciseView.swift
//  GymTrack
//
//  Created by jahnpm on 20.11.25.
//

import SwiftUI

struct NewExerciseView: View {
    @AppStorage("defaultUnits") private var defaultUnits: String = "kg"
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var exerciseName: String = ""
    @State private var weight: Double = 0.0
    @State private var repetitions: Int = 0
    @State private var unit: String = "kg"
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Exercise name", text: $exerciseName)
                }
                Section(header: Text("Unit")) {
                    Picker("", selection: $unit) {
                        Text("kg").tag("kg")
                        Text("lbs").tag("lbs")
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Last record")) {
                    HStack {
                        TextField("Weight", value: $weight, format: .number)
                            .keyboardType(.decimalPad)
                        Text(unit)
                    }
                    TextField("Repetitions", value: $repetitions, format: .number)
                        .keyboardType(.numberPad)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addExercise()
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
            .onAppear {
                unit = defaultUnits
            }
        }
    }
    
    private func addExercise() {
        withAnimation {
            // repetitions is already an Int; pass it directly
            let newExercise = Exercise(name: exerciseName, weight: weight, repetitions: repetitions)
            modelContext.insert(newExercise)
        }
    }
}

#Preview {
    NewExerciseView(isPresented: .constant(true))
}
