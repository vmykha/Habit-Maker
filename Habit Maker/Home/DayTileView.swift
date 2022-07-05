//
//  DayTileView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct DayTileView: View {
    let dayModel: DayModel
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            Button(action: {
                print("++++++")
            }, label: {
                VStack {
                    Text(dayModel.dayOfWeek.uppercased())
                        .font(.caption)
                        .if(isSelected) {
                            $0.bold()
                        }
                    Text("\(dayModel.dayOfMonth)")
                        .font(.caption)
                        .if(isSelected) {
                            $0.bold()
                        }
                }
            })
            Circle()
                .stroke(
                    Color.yellow.opacity(0.5),
                    lineWidth: 8
                )
        }
        .frame(width: 65, height: 85)
    }
}

struct DayTileView_Previews: PreviewProvider {
    static var previews: some View {
        DayTileView(dayModel: .init(dayOfWeek: "Wed", dayOfMonth: 13), isSelected: .constant(true))
    }
}
