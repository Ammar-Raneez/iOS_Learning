//
//  GithubUserView.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct GithubUserView: View {
    var user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: user.avatar_url)) { image in
                    image
                        .resizable()
                        .frame(width: .infinity, height: 400)
                } placeholder: {
                    ProgressView()
                }
                
                Text(user.login)
                    .font(.title2)
                
                NavigationLink {
                    GithubUserFollowersView(user: user)
                } label: {
                    Text("View Followers")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .padding(.horizontal)
            .navigationTitle(Text(user.login))
        }
    }
}
