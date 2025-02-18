//
//  GithubRepoResults.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

public struct GithubRepoResults: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [GithubRepo]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
