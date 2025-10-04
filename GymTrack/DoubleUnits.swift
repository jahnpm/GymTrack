//
//  DoubleUnits.swift
//  GymTrack
//
//  Created by jahnpm on 04.10.25.
//

extension Double {
    /// Converts weight from kilograms to pounds
    var lbs: Double { return self * 2.20462262 }
    /// Returns self but makes it explicit that the value is in kilograms
    var kg: Double { return self }
}
