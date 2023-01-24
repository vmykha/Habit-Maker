//
//  WeekTilesViewDomain.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 23.01.2023.
//

import Foundation
import ComposableArchitecture

struct WeekTilesViewDomain: ReducerProtocol {
    struct State: Equatable {
        var formattedSelectedDayOfWeek: String = ""
        var dayTiles: IdentifiedArrayOf<DayTileViewDomain.State> = []

        var selectedDay: DayModel? {
            dayTiles.first { $0.isSelected }?.dayModel
        }
    }

    enum Action: Equatable {
        case loadData
        case dayTile(id: DayTileViewDomain.State.ID, action: DayTileViewDomain.Action)
    }

    @Dependency(\.weekdaysClient) var weekdaysClient
    @Dependency(\.date) var date

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadData:
                state.dayTiles.removeAll()
                for weekday in weekdaysClient.loadWeekdays(for: date.now) {
                    state.dayTiles.append(.init(dayModel: weekday))
                }
                guard let today = weekdaysClient.findToday(from: state.dayTiles.map(\.dayModel)) else {
                    return .none
                }
                return .task {
                    .dayTile(id: today.id, action: .select)
                }
            case .dayTile(let id, action: .select):
                for (index, tile) in state.dayTiles.enumerated() {
                    let isSelected = tile.id == id
                    state.dayTiles[index].isSelected = isSelected
                }

                state.formattedSelectedDayOfWeek = weekdaysClient.formatWeekday(
                    state.selectedDay?.date
                ) ?? ""

                return .none
            }
        }
        .forEach(\.dayTiles, action: /Action.dayTile(id:action:)) {
            DayTileViewDomain()
        }
    }
}
