//
//  HomeView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeViewDomain>

    private let columns = [GridItem(.flexible())]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                NavigationView {
                    contentView(geometry: geometry, state: viewStore.state)
                        .navigationTitle(viewStore.weekTiles.formattedSelectedDayOfWeek)
                }
            }.onAppear {
                viewStore.send(.loadData)
            }
        }
    }

    // MARK: - Views

    private func contentView(geometry: GeometryProxy, state: HomeViewDomain.State) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                WeekTilesView(
                    store: store.scope(
                        state: \.weekTiles,
                        action: HomeViewDomain.Action.weekTiles(action:)
                    )
                )
                let size = geometry.size.width * 0.3
                progressView(state: state)
                    .frame(width: size, height: size)
                    .frame(maxWidth: .infinity, alignment: .center)

                dayTilesGrid(geometry: geometry)
            }
        }
    }

    private func progressView(state: HomeViewDomain.State) -> some View {
        ZStack {
            Text("\(Int(state.dailyProgress * 100))%")
                .font(.largeTitle)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding()

            CircularProgressView(
                color: .red,
                lineWidth: 12,
                progress: state.dailyProgress
            )
        }
    }

    private func dayTilesGrid(geometry: GeometryProxy) -> some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEachStore(
                self.store.scope(
                    state: \.habits,
                    action: HomeViewDomain.Action.habit(id:action:)
                )
            ) {
                HabitRow(store: $0)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
        }.padding()
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            store: .init(
                initialState: HomeViewDomain.State(weekTiles: .init()),
                reducer: HomeViewDomain()
            )
        )
    }
}
#endif
