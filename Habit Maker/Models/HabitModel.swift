//
//  HabitModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 06.01.2023.
//

import SwiftUI
import Foundation

struct HabitModel: Identifiable, Equatable {
    enum Unit {
        case quantity
        case duration
    }

    var id = UUID()
    let name: String
    let unit: Unit
    let goal: Int
    var completed: Int {
        didSet {
            progress = Double(completed / goal)
        }
    }
    var progress: Double
    // TODO: replace with hex or Data
    let color: Color

    var progressCaption: String {
        switch unit {
        case .quantity:
            return "\(completed)/\(goal)"
        case .duration:
            return "\(completed)/\(goal) min"
        }
    }

    init(
        id: UUID = UUID(),
        name: String,
        unit: Unit,
        goal: Int,
        completed: Int,
        color: Color
    ) {
        self.id = id
        self.name = name
        self.unit = unit
        self.goal = goal
        self.completed = completed
        self.color = color
        self.progress = Double(completed) / Double(goal)
    }
}
