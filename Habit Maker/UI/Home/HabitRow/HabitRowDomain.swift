//
//  HabitRowDomain.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 17.01.2023.
//

import SwiftUI
import ComposableArchitecture

struct HabitRowDomain: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
        let habitModel: HabitModel
        var completed: Int

        var progress: Double {
            Double(completed) / Double(habitModel.goal)
        }

        var isCompleted: Bool {
            completed >= habitModel.goal
        }

        var progressCaption: String {
            switch habitModel.unit {
            case .quantity:
                return "\(completed)/\(habitModel.goal)"
            case .duration:
                return "\(completed)/\(habitModel.goal) min"
            }
        }
    }

    enum Action: Equatable {
        case didTapCompleteButton
        case didTapResetButton
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didTapCompleteButton:
            state.completed = state.habitModel.goal
            return .none
        case .didTapResetButton:
            state.completed = 0
            return .none
        }
    }
}
