//
//  GithubUsersViewModel.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import Foundation

@MainActor
final class GithubUsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func getUsers() {
        Task {
            do {
                users = try await NetworkStore.shared.getUserData(dataUrl: "https://api.github.com/users")
            } catch {
                print("Something went wrong")
            }
        }
    }
}
