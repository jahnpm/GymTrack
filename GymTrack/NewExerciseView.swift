//
//  NewExerciseView.swift
//  GymTrack
//
//  Created by jahnpm on 20.11.25.
//

import SwiftUI

struct NewExerciseView: View {
    @AppStorage("defaultWeightUnit") private var defaultWeightUnit: String = "kg"

    @Environment(\.modelContext) private var modelContext
    
    @State private var exerciseName: String = ""
    @State private var weightUnit: String = "kg"
    @State private var weight: Double = 0.0
    @State private var repetitions: Int = 0
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Exercise name", text: $exerciseName)
                }
                Section(header: Text("Unit")) {
                    Picker("", selection: $weightUnit) {
                        Text("kg").tag("kg")
                        Text("lbs").tag("lbs")
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Last record")) {
                    HStack {
                        TextField("Weight", value: $weight, format: .number)
                            .keyboardType(.decimalPad)
                        Text(weightUnit)
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
                weightUnit = defaultWeightUnit
            }
        }
    }
    
    private func addExercise() {
        withAnimation {
            let newExercise = Exercise(name: exerciseName,
                                       weightUnit: weightUnit,
                                       weight: weight,
                                       repetitions: repetitions)
            modelContext.insert(newExercise)
        }
    }
}

#Preview {
    NewExerciseView(isPresented: .constant(true))
}
