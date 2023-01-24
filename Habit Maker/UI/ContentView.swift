//
//  ContentView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(
            store: .init(
                initialState: HomeViewDomain.State(
                    weekTiles: .init()
                ),
                reducer: HomeViewDomain()
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
