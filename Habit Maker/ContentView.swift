//
//  ContentView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // TODO: Add DI
        HomeView(viewModel: HomeViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
