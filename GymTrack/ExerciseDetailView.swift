//
//  ExerciseDetailView.swift
//  GymTrack
//
//  Created by jahnpm on 22.11.25.
//

import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    @Bindable var exercise: Exercise
    
    @State private var isPresentingAddSetSheet = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Last Set")) {
                    VStack {
                        Text("\(exercise.lastRecord.weight, specifier: "%.2f") \(exercise.weightUnit), \(exercise.lastRecord.repetitions) Reps")
                    }
                }
                Section {
                    Button("Add Set") {
                        isPresentingAddSetSheet = true
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle(exercise.name)
            .sheet(isPresented: $isPresentingAddSetSheet) {
                AddSetView(exercise: exercise, isPresented: $isPresentingAddSetSheet)
            }
        }
    }
}

#Preview {
    let exercise = try! PreviewData.container.mainContext.fetch(FetchDescriptor<Exercise>()).first!
    ExerciseDetailView(exercise: exercise)
        .modelContainer(PreviewData.container)
}
