//
//  ContentView.swift
//  GymTrack
//
//  Created by jahnpm on 04.10.25.
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Exercise.name, order: .forward)
    var exercises: [Exercise]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        Text("\(exercise.name) details")
                    } label: {
                        Text("\(exercise.name)")
                    }
                }
                .onDelete(perform: deleteExercises)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addExercise) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an exercise")
        }
    }

    private func addExercise() {
        withAnimation {
            let newExercise = Exercise(name: "New Exercise")
            modelContext.insert(newExercise)
        }
    }

    private func deleteExercises(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(exercises[index])
            }
        }
    }
}

#Preview {
    ExerciseListView()
        .modelContainer(for: Exercise.self, inMemory: true)
}
