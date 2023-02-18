//
//  HomeView.swift
//  WeatherApp
//
//  Created by Ammar on 2023-02-17.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Colombo")
                .font(.title)
            Text("\(Date().formatted())")
            Text("25.99 °C")
                .font(.system(size: 70))
                .bold()
            Text("Broken Clouds")
                .font(.title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
