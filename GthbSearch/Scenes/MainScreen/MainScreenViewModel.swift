//
//  MainScreenViewModel.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation
import Combine

extension ContentView {
    final class ViewModel: ObservableObject {
        private var cancellables = Set<AnyCancellable>()
        private let githubRepoSearchService: GithubRepoSearchServices
        @Published var searchText: String = ""
        @Published var githbRepoItems: [GithubRepo] = []

        init() {
            self.githubRepoSearchService = GithubRepoSearchService(httpClient: URLSessionHTTPClient(session: .shared))
        }

        func searchRepos() {
            githubRepoSearchService
                .searchRepos(for: searchText)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { receiveComp in
                    switch receiveComp {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("finished search")
                    }
                }, receiveValue: { result in
                    self.githbRepoItems = result.items
                })
                .store(in: &cancellables)
        }
    }
}
