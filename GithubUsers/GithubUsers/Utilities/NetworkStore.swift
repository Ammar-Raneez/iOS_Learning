//
//  NetworkStore.swift
//  GithubUsers
//
//  Created by Ammar on 2023-03-23.
//

import Foundation

final class NetworkStore {
    static let shared = NetworkStore()
    
    private init() {}
    
    func getUserData(dataUrl: String) async throws -> [User] {
        guard let url = URL(string: dataUrl) else {
            print("Error in creation of the URL")
            throw AppError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([User].self, from: data)
        } catch {
            print("Something went wrong in fetching the data")
            throw AppError.failedToFetchData
        }
    }
}
