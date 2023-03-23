//
//  ContentView.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct GithubUsersView: View {
    @StateObject var viewModel = GithubUsersViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
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
                            Text(user.login)
                        }
                    }
                }
            }
            .navigationTitle(Text("Github Users"))
        }
        .task {
            viewModel.getUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GithubUsersView()
    }
}
