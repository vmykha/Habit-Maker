//
//  WeekTilesView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct WeekTilesView: View {
    @Binding var items: [DayModel]
    @State var selectedModel: DayModel?
    private var rows: [GridItem] = [
        GridItem(.fixed(60))
    ]

    init(items: Binding<[DayModel]>) {
        self._items = items

    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            dayTilesGrid
                .padding()
        }
    }

    // MARK: - Views

    private var dayTilesGrid: some View {
        LazyHGrid(rows: rows, spacing: 16) {
            ForEach(items) {
                DayTileView(dayModel: $0, selectedItem: $selectedModel)
            }
        }
    }
}

#if DEBUG
struct WeekTilesView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTilesView(items: .constant( [
            DayModel(dayOfWeek: "Mon", dayOfMonth: 12),
            DayModel(dayOfWeek: "Tue", dayOfMonth: 13),
            DayModel(dayOfWeek: "Wed", dayOfMonth: 14),
            DayModel(dayOfWeek: "Thu", dayOfMonth: 15),
            DayModel(dayOfWeek: "Fri", dayOfMonth: 16),
            DayModel(dayOfWeek: "Sat", dayOfMonth: 17),
            DayModel(dayOfWeek: "Sun", dayOfMonth: 18)
        ]))
    }
}
#endif
