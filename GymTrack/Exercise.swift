//
//  Exercise.swift
//  GymTrack
//
//  Created by jahnpm on 04.10.25.
//

import SwiftData

/// Data structure to store information about a single set performed by the user
struct SetRecord: Codable {
    let weight: Double
    let repetitions: Int
    let oneRepMax: Double
    
    init(weight: Double, repetitions: Int) {
        self.weight = weight
        self.repetitions = repetitions
        self.oneRepMax = weight * (1 + Double(repetitions) / 30.0)
    }
}

/// Underlying data model to persistently store and load exercises that were added by the user
@Model
final class Exercise {
    var name: String
    var weightUnit: String
    var weightSteps: Double
    var lastRecord: SetRecord
    
    init(name: String,
         weightUnit: String = "kg",
         weightSteps: Double = 2.5,
         weight: Double = 0.0,
         repetitions: Int = 0) {
        
        self.name = name
        self.weightUnit = weightUnit
        self.weightSteps = weightSteps
        self.lastRecord = SetRecord(weight: weight, repetitions: repetitions)
    }
}
