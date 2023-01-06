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
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            CircularProgressView(
                color: .green,
                lineWidth: 6,
                progress: 0.6
            )
        }
    }
}

struct DayTileView_Previews: PreviewProvider {
    static var previews: some View {
        DayTileView(
            dayModel: .init(dayOfWeek: "Wed", dayOfMonth: 13),
            selectedItem: .constant(.init(dayOfWeek: "Wed", dayOfMonth: 13))
        )
    }
}
