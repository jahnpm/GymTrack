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

    @State private var isPresentingNewExerciseView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        ExerciseDetailView(exercise: exercise)
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
                    Button {
                        isPresentingNewExerciseView = true
                    } label: {
                        Label("Add Exercise", systemImage: "plus")
                    }
                }
            }
            
            .fullScreenCover(isPresented: $isPresentingNewExerciseView) {
                NewExerciseView(isPresented: $isPresentingNewExerciseView)
            }
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
