//
//  Exercise.swift
//  GymTrack
//
//  Created by jahnpm on 04.10.25.
//

import SwiftData
import Foundation

/// Data structure to store information about a single set performed by the user
struct SetData: Codable, Comparable {
    let weight: Double
    let repetitions: Int
    let date: Date
    let oneRepMax: Double
    
    init(weight: Double, repetitions: Int) {
        self.weight = weight
        self.repetitions = repetitions
        self.date = Date()
        self.oneRepMax = Helpers.oneRepMax(weight: weight, reps: repetitions)
    }
    
    static func < (lhs: SetData, rhs: SetData) -> Bool {
        return lhs.oneRepMax < rhs.oneRepMax
    }
}

/// Underlying data model to persistently store and load exercises that were added by the user
@Model
final class Exercise {
    var name: String
    var weightUnit: String
    var weightSteps: Double
    var personalRecord: SetData?
    
    private(set) var setHistory: [SetData]
    
    init(name: String,
         weightUnit: String = "kg",
         weightSteps: Double = 2.5,
         weight: Double = 0.0,
         repetitions: Int = 0) {
        
        self.name = name
        self.weightUnit = weightUnit
        self.weightSteps = weightSteps
        let initialSet = SetData(weight: weight, repetitions: repetitions)
        self.personalRecord = initialSet
        self.setHistory = [initialSet]
    }
    
    func addSet(setData: SetData) {
        setHistory.append(setData)
        updatePersonalRecord()
    }
    
    private func updatePersonalRecord() {
        if setHistory.isEmpty {
            personalRecord = nil
            return
        }
        personalRecord = setHistory.reduce(setHistory.first!) { currentMax, nextSet in
            max(currentMax, nextSet)
        }
    }
}

@MainActor
enum PreviewData {
    static var container: ModelContainer = {
        let exercise1 = Exercise(name: "Bench Press", weightUnit: "kg", weightSteps: 2.5, weight: 80.0, repetitions: 8)
        let exercise2 = Exercise(name: "Squats", weightUnit: "kg", weightSteps: 5.0, weight: 100.0, repetitions: 5)
        let exercise3 = Exercise(name: "Deadlift", weightUnit: "kg", weightSteps: 5.0, weight: 120.0, repetitions: 3)
        
        do {
            let container = try ModelContainer(for: Exercise.self,
                                               configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let context = container.mainContext
            
            context.insert(exercise1)
            context.insert(exercise2)
            context.insert(exercise3)
            
            try context.save()
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
