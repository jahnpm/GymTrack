//
//  SetHistoryView.swift
//  GymTrack
//
//  Created by jahnpm on 23.11.25.
//

import SwiftUI
import SwiftData

struct SetHistoryView: View {
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(exercise.setHistory.reversed(), id: \.date) { setData in
                    HStack {
                        Text("\(setData.weight, specifier: "%.2f")\(exercise.weightUnit) x \(setData.repetitions)")
                        Spacer()
                        Text("\(setData.date, format: .dateTime.month().day().year().hour().minute().second())")
                    }
                }
            }
        }
    }
}

#Preview {
    let exercise = try! PreviewData.container.mainContext.fetch(FetchDescriptor<Exercise>()).first!
    SetHistoryView(exercise: exercise)
        .modelContainer(PreviewData.container)
}
