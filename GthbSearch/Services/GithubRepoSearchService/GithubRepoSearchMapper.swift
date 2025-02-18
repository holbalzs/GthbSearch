//
//  GithubRepoSearchMapper.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

public final class GithubRepoSearchMapper {
    public enum Error: Swift.Error {
        case invalidData
    }

    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> GithubRepoResults {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        guard response.isSuccess else {
            throw Error.invalidData
        }

        do {
            let root = try decoder.decode(GithubRepoResults.self, from: data)
            return root
        } catch let parseError {
            throw parseError
        }
    }
}
