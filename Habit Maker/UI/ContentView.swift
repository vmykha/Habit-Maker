//
//  ContentView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    private let container: DIContainer

    var body: some View {
        HomeView.build(container: container)
    }

    init(container: DIContainer) {
        self.container = container
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .stub)
    }
}
