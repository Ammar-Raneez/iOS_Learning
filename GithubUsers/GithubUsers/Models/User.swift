//
//  User.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct User: Identifiable, Decodable {
    var id: Int
    var html_url: String
    var login: String
    var avatar_url: String
    var followers_url: String
}
