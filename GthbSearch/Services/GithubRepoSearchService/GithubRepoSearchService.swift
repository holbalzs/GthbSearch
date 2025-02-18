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
        var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "sort", value: "stars"),
            URLQueryItem(name: "order", value: "desc")
        ]
        guard let url = urlComponents?.url else { return Fail(error: GithubRepoServiceError.invalidURLRequest).eraseToAnyPublisher() }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")

        return httpClient.getPublisher(request: urlRequest)
            .tryMap(GithubRepoSearchMapper.map)
            .eraseToAnyPublisher()
    }
}
