//
//  HomeViewModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 09.01.2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    // TODO: Provide DI
    private let weekdaysUseCase = DefaultWeekdaysUseCase()
    @Published var weekDays: [DayModel] = []
    @Published var habits: [HabitModel] = []
    @Published var dailyProgress: Double = 0.5
    @Published var selectedDay: DayModel?

    private var bag = Set<AnyCancellable>()

    init() {
        $habits.sink {
            self.recalculateDailyProgress(with: $0)
        }.store(in: &bag)
    }

    func loadData() {
        weekDays = weekdaysUseCase.loadWeekdays(for: Date())
        habits = [
            HabitModel(name: "Read", unit: .duration, goal: 20, completed: 12, color: .red),
            HabitModel(name: "Brush teeth", unit: .quantity, goal: 2, completed: 1, color: .green),
            HabitModel(name: "Learning", unit: .duration, goal: 60, completed: 15, color: .blue),
            HabitModel(name: "Drink water", unit: .quantity, goal: 4, completed: 1, color: .orange),
            HabitModel(name: "Workout", unit: .duration, goal: 20, completed: 12, color: .purple)
        ]
        selectDefaultDate()
    }

    func completeProgress(for habit: HabitModel) {
        guard let index = habits.firstIndex(of: habit) else {
            return
        }
        habits[index].completed = habits[index].goal
    }

    func undoProgress(for habit: HabitModel) {
        guard let index = habits.firstIndex(of: habit) else {
            return
        }
        habits[index].completed = 0
    }

    private func recalculateDailyProgress(with models: [HabitModel]) {
        guard !models.isEmpty else { return }

        let sum = models
            .compactMap { $0.progress }
            .reduce(0, +)

        dailyProgress = Double(sum) / Double(models.count)
    }

    private func selectDefaultDate() {
        selectedDay = weekdaysUseCase.findToday(from: weekDays)
    }
}