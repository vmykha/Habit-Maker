//
//  WeekTilesView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct WeekTilesView: View {
    let items = [
        DayModel(dayOfWeek: "Mon", dayOfMonth: 12),
        DayModel(dayOfWeek: "Tue", dayOfMonth: 13),
        DayModel(dayOfWeek: "Wed", dayOfMonth: 14),
        DayModel(dayOfWeek: "Thu", dayOfMonth: 15),
        DayModel(dayOfWeek: "Fri", dayOfMonth: 16),
        DayModel(dayOfWeek: "Sat", dayOfMonth: 17),
        DayModel(dayOfWeek: "Sun", dayOfMonth: 18),
    ]

    var rows: [GridItem] = [
        GridItem(.fixed(85))
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(items) {
                    DayTileView(dayModel: $0, isSelected: .constant(false))
                }
            }
            .frame(maxHeight: 85)
            .padding(.horizontal)
        }
    }
}

struct WeekTilesView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTilesView()
    }
}
