//
//  HabitActionButton.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 19.01.2023.
//

import SwiftUI

struct HabitActionButton: View {
    let color: Color
    let imageSystemName: String
    let size: CGSize = .init(width: 30, height: 30)
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageSystemName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .tint(color)
        }
    }
}

struct HabitActionButton_Previews: PreviewProvider {
    static var previews: some View {
        HabitActionButton(
            color: .red,
            imageSystemName: "arrow.uturn.backward.circle",
            action: {}
        )
    }
}
