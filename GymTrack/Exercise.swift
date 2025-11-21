//
//  Exercise.swift
//  GymTrack
//
//  Created by jahnpm on 04.10.25.
//

import SwiftData

/// Underlying data model to persistently store and load exercises that were added by the user
@Model
final class Exercise {
    var name: String
    var weightUnit: String
    var weightSteps: Double
    var weight: Double
    var repetitions: Int
    
    init(name: String,
         weightUnit: String = "kg",
         weightSteps: Double = 2.5,
         weight: Double = 0.0,
         repetitions: Int = 0) {
        
        self.name = name
        self.weightUnit = weightUnit
        self.weightSteps = weightSteps
        self.weight = weight
        self.repetitions = repetitions
    }
}
