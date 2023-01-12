//
//  Environment.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 12.01.2023.
//

import Foundation

struct Environment {
    let container: DIContainer
}

extension Environment {
    static func bootstrap() -> Environment {
        // Configure repositories, handlers here
        let useCases = resolveUseCases()
        let diContainer = DIContainer(useCases: useCases)
        return Environment(container: diContainer)
    }

    private static func resolveUseCases() -> DIContainer.UseCases {
        let weekdaysUseCase = DefaultWeekdaysUseCase()
        return .init(weekdaysUseCase: weekdaysUseCase)
    }
}
