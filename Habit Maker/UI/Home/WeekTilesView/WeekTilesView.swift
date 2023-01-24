//
//  WeekTilesView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI
import ComposableArchitecture

struct WeekTilesView: View {
    let store: StoreOf<WeekTilesViewDomain>
    private let rows = [GridItem(.fixed(60))]

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    dayTilesGrid
                        .padding()
                }.onAppear {
                    viewStore.send(.loadData)
                    guard let id = viewStore.selectedDay?.id else { return }
                    proxy.scrollTo(id, anchor: .center)
                }
            }
        }.debug()
    }

    // MARK: - Views

    private var dayTilesGrid: some View {
        LazyHGrid(rows: rows, spacing: 16) {
            ForEachStore(
                self.store.scope(state: \.dayTiles, action: { .dayTile(id: $0, action: $1) })
            ) {
                DayTileView(store: $0)
            }
        }
    }
}

#if DEBUG
struct WeekTilesView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTilesView(
            store: .init(
                initialState: .init(),
                reducer: WeekTilesViewDomain()
            )
        )
    }
}
#endif
