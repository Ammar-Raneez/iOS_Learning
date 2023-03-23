//
//  ContentView.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GithubUsersViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        
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
        ContentView()
    }
}
