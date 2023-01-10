//
//  WeekTilesView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct WeekTilesView: View {
    @Binding var items: [DayModel]
    @Binding var selectedModel: DayModel?
    private var rows: [GridItem] = [
        GridItem(.fixed(60))
    ]

    init(items: Binding<[DayModel]>, selectedModel: Binding<DayModel?>) {
        self._items = items
        self._selectedModel = selectedModel
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
            DayModel(date: .init(), dayOfWeek: "Mon", dayOfMonth: "12"),
            DayModel(date: .init(), dayOfWeek: "Tue", dayOfMonth: "13"),
            DayModel(date: .init(), dayOfWeek: "Wed", dayOfMonth: "14"),
            DayModel(date: .init(), dayOfWeek: "Thu", dayOfMonth: "15"),
            DayModel(date: .init(), dayOfWeek: "Fri", dayOfMonth: "16"),
            DayModel(date: .init(), dayOfWeek: "Sat", dayOfMonth: "17"),
            DayModel(date: .init(), dayOfWeek: "Sun", dayOfMonth: "18")
        ]), selectedModel: .constant(nil))
    }
}
#endif
