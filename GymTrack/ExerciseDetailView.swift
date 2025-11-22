//
//  ExerciseDetailView.swift
//  GymTrack
//
//  Created by jahnpm on 22.11.25.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Last Record")) {
                    VStack {
                        HStack {
                            Text("Weight")
                            Spacer()
                            Text("\(exercise.lastRecord.weight, specifier: "%.2f") \(exercise.weightUnit)")
                        }
                        HStack {
                            Text("Repetitions")
                            Spacer()
                            Text("\(exercise.lastRecord.repetitions)")
                        }
                    }
                }
            }
            .navigationTitle(exercise.name)
        }
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise(name: "Bench Press"))
}
