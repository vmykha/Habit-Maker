//
//  CurvedSideRectangle.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 07.01.2023.
//

import SwiftUI

struct CurvedSideRectangle: Shape {
    @Binding var progress: CGFloat

    func path(in rect: CGRect) -> Path {
        let curveCoefficient = rect.width * 0.2 * abs(progress - 1)
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX - curveCoefficient, y: .zero))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.midY )
        )
        path.addLine(to: CGPoint(x: .zero, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#if DEBUG
struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle(progress: .constant(0.5))
            .background(.gray)
            .foregroundColor(.orange)
            .previewLayout(.fixed(width: 400, height: 120))
            .padding()
            .previewDisplayName("Default preview")
    }
}
#endif
