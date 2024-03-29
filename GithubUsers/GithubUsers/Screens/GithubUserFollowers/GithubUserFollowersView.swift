//
//  GithubUserFollowersView.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct GithubUserFollowersView: View {
    var user: User
    @StateObject var viewModel = GithubUserFollowersViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.userFollowers) { user in
                    NavigationLink {
                        GithubUserView(user: user)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: user.avatar_url)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(user.login)
                                Link(destination: URL(string: user.html_url)!) {
                                    Text("View on GitHub")
                                        .font(.caption)
                                        .foregroundColor(.cyan)
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("\(user.login)'s Followers"))
        }
        .task {
            viewModel.getUserFollowers(user: user)
        }
    }
}
