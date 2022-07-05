//
//  DayModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import Foundation

struct DayModel: Identifiable {
    var id = UUID()
    let dayOfWeek: String
    let dayOfMonth: Int
}
