//
//  DetailScreenView.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import SwiftUI

struct DetailScreenView: View {
    @Environment(\.openURL) private var openURL
    @State var gitRepo: GithubRepo

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Group {
                    Text(gitRepo.name ?? "")
                        .font(.title)
                    Text("Description:")
                        .padding(.top, 8)
                    Text(gitRepo.description ?? "")
                        .font(.callout)

                    Text("Forks:")
                        .padding(.top, 8)
                    Text(gitRepo.forksCount?.description ?? "0")
                        .font(.callout)

                    Text("Description:")
                        .padding(.top, 8)
                    Text(gitRepo.description ?? "")
                        .font(.callout)

                    Label((gitRepo.stargazersCount ?? 0).description, systemImage: "star")
                        .font(.caption)
                        .padding(.vertical)
                }

                HStack {
                    Text("Created at:")
                        .font(.caption)
                    Text(gitRepo.createdAt, style: .date)
                        .font(.caption2)
                }
                HStack {
                    Text("Last update:")
                        .font(.caption)
                    Text(gitRepo.updatedAt, style: .date)
                        .font(.caption2)
                }

                if let html = gitRepo.htmlURL, let htmlURL = URL(string: html) {
                    Button {
                        openURL(htmlURL)
                    } label: {
                        Label("Open in GitHub", systemImage: "person.fill")
                    }
                    .padding(.top, 8)
                }

                ownerPart
                    .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal)
        }
    }

    @ViewBuilder var ownerPart: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Owner:")
                .font(.subheadline)

            Text(gitRepo.owner.login)
                .font(.title)
            if let ownerLink = gitRepo.owner.htmlURL, let ownerURL = URL(string: ownerLink) {
                Link("Owner in GitHub", destination: ownerURL)
            }

            AsyncImage(url: URL(string: gitRepo.owner.avatarURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 100, height: 100)
            .border(Color.black)
        }
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
                url: "https://api.github.com/users/dtrupenn",
                htmlURL: "https://github.com/dtrupenn/Tetris"
            ),
            htmlURL: "https://github.com/dtrupenn/Tetris",
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
