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
    let color: Color

    init(
        id: UUID = UUID(),
        name: String,
        unit: Unit,
        goal: Int,
        color: Color
    ) {
        self.id = id
        self.name = name
        self.unit = unit
        self.goal = goal
        self.color = color
    }
}
