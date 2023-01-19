//
//  HabitRow.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 06.01.2023.
//

import SwiftUI
import ComposableArchitecture

struct HabitRow: View {
    let store: StoreOf<HabitRowDomain>

    var body: some View { 
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                LinearProgressView(
                    color: viewStore.habitModel.color.opacity(0.3),
                    progress: viewStore.binding(
                        get: { $0.progress },
                        send: HabitRowDomain.Action.didTapCompleteButton
                    )
                )
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewStore.habitModel.name)
                            .font(.title2)
                            .bold()
                        Text("Goal: \(viewStore.progressCaption)")
                            .font(.subheadline)
                    }
                    Spacer()

                    HabitActionButton(
                        color: viewStore.state.habitModel.color,
                        imageSystemName: "arrow.uturn.backward.circle",
                        action: {
                            viewStore.send(.didTapResetButton)
                        }
                    )
                    HabitActionButton(
                        color: viewStore.state.habitModel.color,
                        imageSystemName: "checkmark.circle",
                        action: {
                            viewStore.send(.didTapCompleteButton)
                        }
                    )
                }
                .padding()
            }.background()
        }.debug()
    }
}

#if DEBUG
struct HabitRow_Previews: PreviewProvider {
    static let habit = HabitModel(
        name: "Read",
        unit: .duration,
        goal: 20,
        color: .red
    )
    static var previews: some View {
        HabitRow(
            store: .init(
                initialState: .init(habitModel: habit, completed: 12),
                reducer: HabitRowDomain()
            )
        )
        .previewLayout(.fixed(width: 400, height: 120))
        .padding()
        .previewDisplayName("Default preview")
        .environmentObject(HomeViewModel(container: .stub))
    }
}
#endif
