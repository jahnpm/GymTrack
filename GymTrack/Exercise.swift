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
    var weight: Double
    var repetitions: Int
    
    init(name: String, weight: Double = 0.kg, repetitions: Int = 0) {
        self.name = name
        self.weight = weight
        self.repetitions = repetitions
    }
}
