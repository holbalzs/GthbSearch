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
        enum LoadingState {
            case idle
            case loading
            case loaded([GithubRepo])
            case failed(Error)
        }

        private var cancellables = Set<AnyCancellable>()
        private let githubRepoSearchService: GithubRepoSearchServices
        @Published var searchText: String = ""
        @Published var state: LoadingState = .idle

        init() {
            self.githubRepoSearchService = GithubRepoSearchService(httpClient: URLSessionHTTPClient(session: .shared))
        }

        func searchRepos() {
            state = .loading
            githubRepoSearchService
                .searchRepos(for: searchText)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { receiveComp in
                    switch receiveComp {
                    case .failure(let error):
                        print(error)
                        self.state = .failed(error)
                    case .finished:
                        print("finished search")
                    }
                }, receiveValue: { result in
                    self.state = .loaded(result.items)
                })
                .store(in: &cancellables)
        }
    }
}
