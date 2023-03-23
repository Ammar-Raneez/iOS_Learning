//
//  PlayerDetailView.swift
//  PremierLeague
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct PlayerDetailView: View {
    var player: Player
    
    var body: some View {
        VStack {
            HStack {
                Image(player.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(1000)
            }
            
            Text(player.bio)
            Spacer()
            Image("epl")
                .resizable()
                .frame(height: 200)
        }
        .navigationTitle(Text(player.name))
    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(player: PlayerList().players[0])
    }
}
