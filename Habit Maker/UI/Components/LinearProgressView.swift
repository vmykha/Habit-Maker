//
//  LinearProgressView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 07.01.2023.
//

import SwiftUI

struct LinearProgressView: View {
    let color: Color
    @Binding var progress: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.clear)

                CurvedSideRectangle(progress: $progress)
                    .frame(
                        width: min(progress * geometry.size.width, geometry.size.width),
                        height: geometry.size.height
                    )
                    .foregroundColor(color)
                    .animation(.easeInOut, value: progress)
            }
        }
    }
}

#if DEBUG
struct LinearProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LinearProgressView(
            color: .yellow,
            progress: .constant(0.2)
        )
        .previewLayout(.fixed(width: 400, height: 120))
        .padding()
        .previewDisplayName("Default preview")
    }
}
#endif

