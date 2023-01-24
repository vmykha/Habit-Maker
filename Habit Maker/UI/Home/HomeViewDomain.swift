//
//  HomeViewDomain.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 23.01.2023.
//

import Foundation
import ComposableArchitecture

struct HomeViewDomain: ReducerProtocol {
    struct State: Equatable {
        var habits: IdentifiedArrayOf<HabitRowDomain.State> = []
        var weekTiles: WeekTilesViewDomain.State
        
        var dailyProgress: Double {
            guard !habits.isEmpty else {
                return 0
            }

            let sum = habits
                .compactMap { $0.progress }
                .reduce(0, +)

            return Double(sum) / Double(habits.count)
        }
    }

    enum Action: Equatable {
        case sortHabits
        case loadData
        case habit(id: HabitRowDomain.State.ID, action: HabitRowDomain.Action)
        case weekTiles(action: WeekTilesViewDomain.Action)
    }

    @Dependency(\.continuousClock) var clock
    @Dependency(\.uuid) var uuid

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .habit(id: _, action: _):
                return .run { send in
                    try await self.clock.sleep(for: .milliseconds(250))
                    await send(.sortHabits, animation: .default)
                }
            case .weekTiles(action: _):
                return .none
            case .loadData:
                loadHabits(&state)
                return .none
            case .sortHabits:
                state.habits.sort { $1.isCompleted && !$0.isCompleted }
                return .none
            }
        }.forEach(\.habits, action: /Action.habit(id:action:)) {
            HabitRowDomain()
        }

        Scope(state: \.weekTiles, action: /Action.weekTiles(action:)) {
            WeekTilesViewDomain()
        }
    }

    private func loadHabits(_ state: inout State) {
        // TODO: load from DB client
        state.habits = [
            .init(id: uuid(), habitModel: HabitModel(name: "Read", unit: .duration, goal: 20, color: .red), completed: 3),
            .init(id: uuid(), habitModel: HabitModel(name: "Read", unit: .duration, goal: 20, color: .red), completed: 5),
            .init(id: uuid(), habitModel: HabitModel(name: "Brush teeth", unit: .quantity, goal: 2, color: .green), completed: 1),
            .init(id: uuid(), habitModel:  HabitModel(name: "Learning", unit: .duration, goal: 60, color: .blue), completed: 0),
            .init(id: uuid(), habitModel: HabitModel(name: "Drink water", unit: .quantity, goal: 4, color: .orange), completed: 1),
            .init(id: uuid(), habitModel: HabitModel(name: "Workout", unit: .duration, goal: 20, color: .purple), completed: 10)
        ]
    }
}
