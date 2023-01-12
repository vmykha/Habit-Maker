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
    @EnvironmentObject var viewModel: HomeViewModel

    private var rows: [GridItem] = [
        GridItem(.fixed(60))
    ]

    init(items: Binding<[DayModel]>, selectedModel: Binding<DayModel?>) {
        self._items = items
        self._selectedModel = selectedModel
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                dayTilesGrid
                    .padding()
            }.onAppear {
                guard let id = selectedModel?.id else { return }
                proxy.scrollTo(id, anchor: .center)
            }
        }
    }

    // MARK: - Views

    private var dayTilesGrid: some View {
        LazyHGrid(rows: rows, spacing: 16) {
            ForEach(viewModel.weekDays) {
                DayTileView(
                    dayModel: $0,
                    selectedItem: $selectedModel,
                    progress: $viewModel.dailyProgress
                )
            }
        }
    }
}

#if DEBUG
struct WeekTilesView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTilesView(items: .constant([
            DayModel(date: .init(), dayOfWeek: "Mon", formattedDayOfWeek: "", dayOfMonth: "12"),
            DayModel(date: .init(), dayOfWeek: "Tue", formattedDayOfWeek: "", dayOfMonth: "13"),
            DayModel(date: .init(), dayOfWeek: "Wed", formattedDayOfWeek: "", dayOfMonth: "14"),
            DayModel(date: .init(), dayOfWeek: "Thu", formattedDayOfWeek: "", dayOfMonth: "15"),
            DayModel(date: .init(), dayOfWeek: "Fri", formattedDayOfWeek: "", dayOfMonth: "16"),
            DayModel(date: .init(), dayOfWeek: "Sat", formattedDayOfWeek: "", dayOfMonth: "17"),
            DayModel(date: .init(), dayOfWeek: "Sun", formattedDayOfWeek: "", dayOfMonth: "18")
        ]), selectedModel: .constant(nil))
    }
}
#endif
