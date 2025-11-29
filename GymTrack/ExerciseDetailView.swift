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
                    HStack {
                        Text("\(exercise.setHistory.last!.weight, specifier: "%.2f") \(exercise.weightUnit), \(exercise.setHistory.last!.repetitions) Reps")
                        Spacer()
                        Text("1RM: \(exercise.setHistory.last!.oneRepMax, specifier: "%.2f") \(exercise.weightUnit)")
                    }
                }
                Section {
                    Button("Add Set") {
                        isPresentingAddSetSheet = true
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Section {
                    NavigationLink {
                        SetHistoryView(exercise: exercise)
                    } label: {
                        Text("Set History")
                    }
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
