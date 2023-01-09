//
//  HomeViewModel.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 09.01.2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    // TODO: Provide DI
    private let weekdaysUseCase = DefaultWeekdaysUseCase()
    @Published var weekDays: [DayModel] = []
    @Published var habits: [HabitModel] = []

    @Published var dailyProgress: Double = 0.5
//    {
//        let sum = habits
//            .compactMap { $0.progress }
//            .reduce(0, +)
//        return Double(sum) / Double(habits.count)
//    }

    func setup() {
        weekDays = weekdaysUseCase.loadWeekdays()
        habits = [
            HabitModel(name: "Read", unit: .duration, goal: 20, completed: 12, color: .red),
            HabitModel(name: "Brush teeth", unit: .quantity, goal: 2, completed: 1, color: .green),
            HabitModel(name: "Learning", unit: .duration, goal: 60, completed: 15, color: .blue),
            HabitModel(name: "Drink water", unit: .quantity, goal: 4, completed: 1, color: .orange),
            HabitModel(name: "Workout", unit: .duration, goal: 20, completed: 12, color: .purple)
        ]
    }

    func completeProgress(for habit: HabitModel) {
        guard let index = habits.firstIndex(of: habit) else {
            return
        }
        habits[index].completed = habits[index].goal
        self.habits = self.habits
    }

    func undoProgress(for habit: HabitModel) {
        guard let index = habits.firstIndex(of: habit) else {
            return
        }
        habits[index].completed = 0
    }
}
