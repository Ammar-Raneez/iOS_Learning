//
//  GithubUserViewModel.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import Foundation

@MainActor
final class GithubUserFollowersViewModel: ObservableObject {
    @Published var userFollowers: [User] = []
    
    func getUserFollowers(user: User) {
        Task {
            do {
                userFollowers = try await NetworkStore.shared.getUserData(dataUrl: user.followers_url)
            } catch {
                print("Something went wrong fetching user's followers")
            }
        }
    }
}
