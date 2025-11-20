//
//  NewExerciseView.swift
//  GymTrack
//
//  Created by jahnpm on 20.11.25.
//

import SwiftUI

struct NewExerciseView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var exerciseName: String = ""
    @State private var weight: String = ""
    @State private var repetitions: String = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Exercise name", text: $exerciseName)
                }
                Section(header: Text("Most recent record")) {
                    HStack {
                        TextField("Weight", text: $weight)
                        Text("kg")
                    }
                    TextField("Repetitions", text: $repetitions)
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
        }
    }
    
    private func addExercise() {
        withAnimation {
            let newExercise = Exercise(name: exerciseName, weight: Double(weight)!, repetitions: Int(repetitions)!)
            modelContext.insert(newExercise)
        }
    }
}

#Preview {
    NewExerciseView(isPresented: .constant(true))
}
