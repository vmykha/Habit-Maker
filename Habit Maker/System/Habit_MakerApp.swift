//
//  Habit_MakerApp.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 05.07.2022.
//

import SwiftUI

@main
struct Habit_MakerApp: App {
    private let environment: Environment

    var body: some Scene {
        WindowGroup {
            ContentView(container: environment.container)
        }
    }

    init() {
        environment = Environment.bootstrap()
    }
}
