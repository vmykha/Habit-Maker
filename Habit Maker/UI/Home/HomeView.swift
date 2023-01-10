//
//  HomeView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private(set) var viewModel: HomeViewModel
    @State var progress: CGFloat = 0.1
    let columns = [GridItem(.flexible())]


    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                contentView(geometry: geometry)
                    .navigationTitle("Today")
            }
        }.onAppear {
            viewModel.loadData()
        }
    }

    // MARK: - Views

    private func contentView(geometry: GeometryProxy) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                WeekTilesView(
                    items: $viewModel.weekDays,
                    selectedModel: $viewModel.selectedDay
                )
                let size = geometry.size.width * 0.3
                progressView
                    .frame(width: size, height: size)
                    .frame(maxWidth: .infinity, alignment: .center)

                dayTilesGrid(geometry: geometry)
            }
        }
    }

    private var progressView: some View {
        ZStack {
            Text("\(Int(viewModel.dailyProgress * 100))%")
                .font(.largeTitle)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding()

            CircularProgressView(
                color: .red,
                lineWidth: 12,
                progress: viewModel.dailyProgress
            )
        }
    }

    private func dayTilesGrid(geometry: GeometryProxy) -> some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach($viewModel.habits) {
                HabitRow(habit: $0)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .environmentObject(viewModel)
            }
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
