//
//  DetailScreenView.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import SwiftUI

struct DetailScreenView: View {
    @State var gitRepo: GithubRepo

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    DetailScreenView(
        gitRepo: GithubRepo(
            id: 1,
            name: "Test",
            fullName: "Test",
            owner: .init(
                id: 5,
                login: "Test",
                avatarURL: "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                url: "https://api.github.com/users/dtrupenn"
            ),
            htmlURL: "Test",
            description: "Test",
            url: "Test",
            createdAt: Date(),
            updatedAt: Date(),
            pushedAt: Date(),
            forksCount: 1,
            stargazersCount: 1
        )
    )
}
