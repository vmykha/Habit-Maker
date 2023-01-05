//
//  CircularProgressView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 05.01.2023.
//

import SwiftUI

struct CircularProgressView: View {
    let color: Color
    let lineWidth: CGFloat
    let progress: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: lineWidth
                )

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.radians(.pi / -2))
                .animation(.easeInOut, value: progress)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(
            color: .green,
            lineWidth: 30,
            progress: 0.4
        )
    }
}
