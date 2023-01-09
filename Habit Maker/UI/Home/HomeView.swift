//
//  HomeView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct HomeView: View {
    let columns = [GridItem(.flexible())]
    @State var progress: CGFloat = 0.1

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                contentView(geometry: geometry)
                    .navigationTitle("Today")
            }
        }
    }

    // MARK: - Views

    private func contentView(geometry: GeometryProxy) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                WeekTilesView()
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
            Text("10%")
                .font(.largeTitle)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding()

            CircularProgressView(
                color: .red,
                lineWidth: 12,
                progress: 0.4
            )
        }
    }

    private func dayTilesGrid(geometry: GeometryProxy) -> some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(1..<10) {_ in
                HabitRow(color: .red, progress: $progress)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)

            }
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
