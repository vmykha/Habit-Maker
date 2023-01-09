//
//  HabitRow.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 06.01.2023.
//

import SwiftUI

struct HabitRow: View {
    let color: Color
    @Binding var progress: CGFloat

    var body: some View {
        ZStack {
            LinearProgressView(
                color: color.opacity(0.3),
                progress: $progress
            )
            HStack {
                VStack(alignment: .leading) {
                    Text("Read")
                        .font(.title2)
                        .bold()
                    Text("Goal: 1/2")
                        .font(.subheadline)
                }
                Spacer()

                undoButton
                completeButton
            }
            .padding()
        }.background()
    }

    // MARK: - Views

    private var completeButton: some View {
        Button(action: {
            print(#function)
        }, label: {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .tint(color)
        })
    }

    private var undoButton: some View {
        Button(action: {
            print(#function)
        }, label: {
            Image(systemName: "arrow.uturn.backward.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .tint(color)
        })
    }
}

#if DEBUG
struct HabitRow_Previews: PreviewProvider {
    static var previews: some View {
        HabitRow(color: .red, progress: .constant(0.1))
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
            .previewDisplayName("Default preview")
    }
}
#endif
