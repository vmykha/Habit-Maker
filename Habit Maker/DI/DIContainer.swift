//
//  DIContainer.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 12.01.2023.
//

import Foundation

struct DIContainer {
    let useCases: UseCases
}

extension DIContainer {
    struct UseCases {
        let weekdaysUseCase: WeekdaysUseCase
    }

    static var stub: DIContainer {
        .init(useCases: .stub())
    }
}

extension DIContainer.UseCases {
    static func stub(weekdaysUseCase: WeekdaysUseCase = DefaultWeekdaysUseCase()) -> Self {
        .init(weekdaysUseCase: weekdaysUseCase)
    }
}
