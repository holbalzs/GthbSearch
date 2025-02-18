//
//  ContentView.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView {
                        Text("Loading..")
                    }
                case .loaded(let repos):
                    List(repos, id: \.id) { item in
                        generateItem(item)
                            .onTapGesture {
                                path.append(item)
                            }
                    }
                case .failed(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationBarTitle("Github Search")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("Search", text: $viewModel.searchText)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                        Button(action: {
                            viewModel.searchRepos()
                        }) {
                            Text("Search")
                        }
                        .padding(.trailing)
                    }
                }
            }
            .navigationDestination(for: GithubRepo.self) { value in
                DetailScreenView(gitRepo: value)
            }
        }
    }

    @ViewBuilder func generateItem(_ item: GithubRepo) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name ?? "no name")
                    .font(.title)

                Spacer()

                Label((item.stargazersCount ?? 0).description, systemImage: "star")
                    .font(.caption)
            }
            if let description = item.description {
                Text(description)
                    .font(.footnote)
            }
            HStack {
                Text("Last update:")
                    .font(.caption)
                Text(item.updatedAt, style: .date)
                    .font(.caption2)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    ContentView()
}
