//
//  HabitRow.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 06.01.2023.
//

import SwiftUI

struct HabitRow: View {
    @Binding var habit: HabitModel
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            LinearProgressView(
                color: habit.color.opacity(0.3),
                progress: $habit.progress
            )
            HStack {
                VStack(alignment: .leading) {
                    Text(habit.name)
                        .font(.title2)
                        .bold()
                    Text("Goal: \(habit.progressCaption)")
                        .font(.subheadline)
                }
                Spacer()

                undoButton
                completeButton
            }
            .padding()
        }.background()
    }

    // MARK: - Views

    private var completeButton: some View {
        Button(action: {
            viewModel.completeProgress(for: habit)
        }, label: {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .tint(habit.color)
        })
    }

    private var undoButton: some View {
        Button(action: {
            viewModel.undoProgress(for: habit)
        }, label: {
            Image(systemName: "arrow.uturn.backward.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .tint(habit.color)
        })
    }
}

#if DEBUG
struct HabitRow_Previews: PreviewProvider {
    static let habit = HabitModel(
        name: "Read",
        unit: .duration,
        goal: 20,
        completed: 10,
        color: .red
    )
    static var previews: some View {
        HabitRow(habit: .constant(habit))
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
            .previewDisplayName("Default preview")
            .environmentObject(HomeViewModel(container: .stub))
    }
}
#endif
