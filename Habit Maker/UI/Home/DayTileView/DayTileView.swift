//
//  DayTileView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI
import ComposableArchitecture

struct DayTileView: View {
    let store: StoreOf<DayTileViewDomain>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Button(action: {
                    viewStore.send(.select)
                }, label: {
                    VStack {
                        Text(viewStore.dayModel.dayOfWeek.uppercased())
                            .font(.caption)
                            .foregroundColor(.black)
                            .if(viewStore.isSelected) {
                                $0.bold()
                            }
                        Text("\(viewStore.dayModel.dayOfMonth)")
                            .font(.caption)
                            .foregroundColor(.black)
                            .if(viewStore.isSelected) {
                                $0.bold()
                            }
                    }
                })

                CircularProgressView(
                    color: viewStore.isSelected ? .green : .yellow,
                    lineWidth: 6,
                    progress: .init(0.2)
                ).animation(.easeInOut, value: viewStore.isSelected)
            }
        }
    }
}

#if DEBUG
struct DayTileView_Previews: PreviewProvider {
    static var previews: some View {
        DayTileView(
            store: .init(
                initialState: .init(dayModel: .init(date: .init(), dayOfWeek: "Wed", dayOfMonth: "13"), isSelected: false),
                reducer: DayTileViewDomain())
        )
    }
}
#endif
