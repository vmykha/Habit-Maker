//
//  HabitModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 06.01.2023.
//

import Foundation

struct HabitModel: Identifiable {
    enum Unit {
        case quantity(count: Int)
        case duration(minutes: Int)
    }

    var id = UUID()
    let name: String
    let goal: Unit
    let completed: Unit
}
