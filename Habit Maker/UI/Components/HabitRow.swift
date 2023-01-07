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
                color: color,
                progress: $progress
            )
            HStack {
                VStack(alignment: .leading) {
                    Text("Read")
                        .font(.title)
                    Text("Goal: 2")
                        .font(.subheadline)
                }
                Spacer()
            }
        }.background()

    }
}

#if DEBUG
struct HabitRow_Previews: PreviewProvider {
    static var previews: some View {
        HabitRow(color: .red, progress: .constant(0.2))
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
            .previewDisplayName("Default preview")
    }
}
#endif
