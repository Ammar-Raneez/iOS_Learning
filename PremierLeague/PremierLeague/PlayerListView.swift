//
//  ContentView.swift
//  PremierLeague
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct PlayerListView: View {
    var body: some View {
        NavigationStack {
            List(players) { player in
                NavigationLink {
                    PlayerDetailView(player: player)
                } label: {
                    HStack {
                        Image(player.imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(1000)
                        Text(player.name)
                    }
                }
            }
            .navigationTitle(Text("Top EPL Players"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
