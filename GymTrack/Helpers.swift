//
//  Helpers.swift
//  GymTrack
//
//  Created by jahnpm on 23.11.25.
//

enum Helpers {
    /// Calculates the one-rep max using a weighted average of the Epley and Brzycki formulas.
    static func oneRepMax(weight: Double, reps: Int) -> Double {
        if reps == 0 { return 0.0 }
        
        let clampedDelta = min(max(reps - 9, -2), 2)
        let epleyFactor = 0.5 + Double(clampedDelta) * 0.25
        let brzyckiFactor = 1.0 - epleyFactor
        
        return epleyFactor * epleyFormula(weight: weight, reps: reps) +
               brzyckiFactor * brzyckiFormula(weight: weight, reps: reps)
    }
    
    private static func brzyckiFormula(weight: Double, reps: Int) -> Double {
        return weight / (1.0278 - 0.0278 * Double(reps))
    }
    
    private static func epleyFormula(weight: Double, reps: Int) -> Double {
        return weight * (1 + Double(reps) / 30)
    }
}
