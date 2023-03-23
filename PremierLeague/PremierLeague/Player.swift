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


let players: [Player] = [
    Player(name: "John Terry", imageName: "jt", bio: "Career:\n" + ". Main Club - Chelsea \n" + ". position - Centre-back \n" + ". England Caps - 58\n"),
    Player(name: "Alan Shearer", imageName: "sheare", bio: "Career:\n" + ". Main Clubs - Southampton, Blackburn Rovers, Newcastle United \n" + ". position - Striker \n" + ". England Caps -63\n"),
    Player(name: "Cristiano Ronaldo", imageName: "ronaldo", bio: "Career:\n" + ". Main Clubs - Man Utd, Real Madrid \n" + ". position - Striker \n" + ". Portugal Caps - 132\n"),
    Player(name: "Paul Scoles", imageName: "scholes", bio: "Career:\n" + ". Main Club - Man Utd \n" + ". position - Central midfield \n" + ". England Caps - 66\n"),
    Player(name: "Rio Ferdinand", imageName: "rio", bio: "Career:\n" + ". Main Clubs - West Ham, Leeds Utd, Man Utd \n" + ". position - Centre-back \n" + ". England Caps - 81\n"),
    Player(name: "Thiery Henry", imageName: "henry", bio: "Career:\n" + ". Main Clubs - Monaco, Arsenal, Barcelona \n" + ". position - Striker \n" + ". France Caps - 123\n"),
    Player(name: "Ryan Giggs", imageName: "giggs", bio: "Career:\n" + ". Main Club - Man Utd \n" + ". position - Winger \n" + ". England Caps - 85\n"),
    Player(name: "Gary Neville", imageName: "gary", bio: "Career:\n" + ". Main Club - Man Utd \n" + ". position - Right-back \n" + ". England Caps - 85\n"),
    Player(name: "Ashley Cole", imageName: "ashley", bio: "Career:\n" + ". Main Clubs - Arsenal, Chelsea \n" + ". position - Left-back \n" + ". England Caps - 107\n"),
    Player(name: "Peter Schmichael", imageName: "peter", bio: "Career:\n" + ". Main Club - Man Utd \n" + ". position - Goalkeeper \n" + ". Denmark Caps - 129\n"),
]
