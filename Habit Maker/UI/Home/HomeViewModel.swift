//
//  HomeViewModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 09.01.2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private let container: DIContainer
    private var bag = Set<AnyCancellable>()

    @Published var weekDays: [DayModel] = []
    @Published var habits: [HabitModel] = []
    @Published var dailyProgress: Double = 0.5
    @Published var selectedDay: DayModel?

    init(container: DIContainer) {
        self.container = container
        setupBindings()
    }

    func loadData() {
        weekDays = container.useCases.weekdaysUseCase.loadWeekdays(for: Date())
        habits = [
            HabitModel(name: "Read", unit: .duration, goal: 20, color: .red),
            HabitModel(name: "Brush teeth", unit: .quantity, goal: 2, color: .green),
            HabitModel(name: "Learning", unit: .duration, goal: 60, color: .blue),
            HabitModel(name: "Drink water", unit: .quantity, goal: 4, color: .orange),
            HabitModel(name: "Workout", unit: .duration, goal: 20, color: .purple)
        ]
        selectDefaultDate()
    }

    private func setupBindings() {
        $habits.sink {
            self.recalculateDailyProgress(with: $0)
        }.store(in: &bag)
    }

    private func recalculateDailyProgress(with models: [HabitModel]) {
        // TODO: apply the logic within TCA
//        guard !models.isEmpty else { return }
//
//        let sum = models
//            .compactMap { $0.progress }
//            .reduce(0, +)
//
//        dailyProgress = Double(sum) / Double(models.count)
    }

    private func selectDefaultDate() {
        selectedDay = container.useCases.weekdaysUseCase.findToday(from: weekDays)
    }
}
