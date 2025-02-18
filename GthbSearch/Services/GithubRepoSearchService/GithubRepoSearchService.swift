//
//  GithubRepoSearchService.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation
import Combine

public protocol GithubRepoSearchServices {
    func searchRepos(for query: String) -> AnyPublisher<GithubRepoResults, Error>
}

public final class GithubRepoSearchService {
    private let httpClient: URLSessionHTTPClient

    init(httpClient: URLSessionHTTPClient) {
        self.httpClient = httpClient
    }
}

extension GithubRepoSearchService: GithubRepoSearchServices {
    public func searchRepos(for query: String) -> AnyPublisher<GithubRepoResults, any Error> {
        return Fail(error: GithubRepoServiceError.general).eraseToAnyPublisher()
    }
}
