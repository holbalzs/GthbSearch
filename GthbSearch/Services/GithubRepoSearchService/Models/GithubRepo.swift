//
//  GithubRepo.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

public struct GithubRepo: Codable {
    let id: Int
    let name, fullName: String?
    let owner: GithubRepoOwner
    let htmlURL: String?
    let description: String?
    let url: String?
    let createdAt, updatedAt, pushedAt: Date
    let forksCount: Int?
    let stargazersCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description
        case url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
    }
}

struct GithubRepoOwner: Codable {
    let id: Int
    let login: String
    let avatarURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case url
    }
}
