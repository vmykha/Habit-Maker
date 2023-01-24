//
//  WeekdaysClient.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 09.01.2023.
//

import Foundation
import ComposableArchitecture

protocol WeekdaysClientProtocol: AnyObject {
    func loadWeekdays(for date: Date) -> [DayModel]
    func findToday(from models: [DayModel]) -> DayModel?
    func formatWeekday(_ date: Date?) -> String?
}

final class WeekdaysClient: WeekdaysClientProtocol {
    private var calendar = Calendar.current

    private lazy var shortDayOfWeekDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "E"
        return formatter
    }()

    private lazy var dayOfWeekDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "EEEE"
        return formatter
    }()

    private lazy var dayOfMonthDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "d"
        return formatter
    }()

    func loadWeekdays(for date: Date) -> [DayModel] {
        let weekdays = currentWeekdays(in: date)

        return weekdays.map {
            DayModel(
                date: $0,
                dayOfWeek: shortDayOfWeekDateFormatter.string(from: $0),
                dayOfMonth: dayOfMonthDateFormatter.string(from: $0)
            )
        }
    }

    func findToday(from models: [DayModel]) -> DayModel? {
        models.first { calendar.isDateInToday($0.date) }
    }

    private func currentWeekdays(in date: Date) -> [Date] {
        calendar.firstWeekday = 2
        let today = calendar.startOfDay(for: date)
        let dayOfWeek = calendar.component(.weekday, from: today)
        return calendar.range(of: .weekday, in: .weekOfYear, for: today)!.compactMap {
            calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today)
        }
    }

    func formatWeekday(_ date: Date?) -> String? {
        guard let date else { return nil }

        if calendar.isDateInToday(date) {
            return "Today"
        }

        if calendar.isDateInYesterday(date) {
            return "Yesterday"
        }

        return dayOfWeekDateFormatter.string(from: date)
    }
}

// MARK: – DependencyKey

enum WeekdaysClientKey: DependencyKey {
    static var liveValue: WeekdaysClientProtocol = WeekdaysClient()
}

// MARK: – DependencyValues

extension DependencyValues {
  var weekdaysClient: WeekdaysClientProtocol {
    get { self[WeekdaysClientKey.self] }
    set { self[WeekdaysClientKey.self] = newValue }
  }
}
