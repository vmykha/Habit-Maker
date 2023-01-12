//
//  DayTileView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct DayTileView: View {
    let dayModel: DayModel
    @Binding var selectedItem: DayModel?
    @Binding var progress: Double

    private var isSelected: Bool {
        selectedItem == dayModel
    }
    
    var body: some View {
        ZStack {
            Button(action: {
                selectedItem = dayModel
            }, label: {
                VStack {
                    Text(dayModel.dayOfWeek.uppercased())
                        .font(.caption)
                        .foregroundColor(.black)
                        .if(isSelected) {
                            $0.bold()
                        }
                    Text("\(dayModel.dayOfMonth)")
                        .font(.caption)
                        .foregroundColor(.black)
                        .if(isSelected) {
                            $0.bold()
                        }
                }
            })

            CircularProgressView(
                color: isSelected ? .green : .yellow,
                lineWidth: 6,
                progress: progress
            ).animation(.easeInOut, value: isSelected)
        }
    }
}

#if DEBUG
struct DayTileView_Previews: PreviewProvider {
    static var previews: some View {
        DayTileView(
            dayModel: .init(date: .init(), dayOfWeek: "Wed", formattedDayOfWeek: "", dayOfMonth: "13"),
            selectedItem: .constant(.init(date: .init(), dayOfWeek: "Wed", formattedDayOfWeek: "", dayOfMonth: "13")),
            progress: .constant(0.3)
        )
    }
}
#endif
