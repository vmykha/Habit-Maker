//
//  DayTileViewDomain.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 23.01.2023.
//

import Foundation
import ComposableArchitecture

struct DayTileViewDomain: ReducerProtocol {
    struct State: Equatable, Identifiable {
        var id: UUID { self.dayModel.id }
        var dayModel: DayModel
        var isSelected: Bool = false
    }

    enum Action: Equatable {
        case select
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .select:
            return .none
        }
    }
}
