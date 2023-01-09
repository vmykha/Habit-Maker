//
//  WeekdaysUseCase.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 09.01.2023.
//

import Foundation

protocol WeekdaysUseCase: AnyObject {
    func loadWeekdays() -> [DayModel]
}

final class DefaultWeekdaysUseCase: WeekdaysUseCase {
    func loadWeekdays() -> [DayModel] {
        [
            DayModel(dayOfWeek: "Mon", dayOfMonth: 12),
            DayModel(dayOfWeek: "Tue", dayOfMonth: 13),
            DayModel(dayOfWeek: "Wed", dayOfMonth: 14),
            DayModel(dayOfWeek: "Thu", dayOfMonth: 15),
            DayModel(dayOfWeek: "Fri", dayOfMonth: 16),
            DayModel(dayOfWeek: "Sat", dayOfMonth: 17),
            DayModel(dayOfWeek: "Sun", dayOfMonth: 18)
        ]
    }
}
