//
//  Player.swift
//  PremierLeague
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var imageName: String
    var bio: String
}
