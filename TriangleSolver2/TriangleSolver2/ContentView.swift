//
//  ContentView.swift
//  TriangleSolver
//
//  Created by Ammar on 2023-03-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalculationView()
                .tabItem {
                    Label("calculation", systemImage: "sum")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
