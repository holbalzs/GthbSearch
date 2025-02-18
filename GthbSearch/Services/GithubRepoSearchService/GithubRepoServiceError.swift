//
//  GithubRepoServiceError.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

enum GithubRepoServiceError: LocalizedError {
    case general
    case invalidURLRequest

    var errorDescription: String? {
        switch self {
        case .general:
            return "Something went wrong"
        case .invalidURLRequest:
            return "Invalid URL Request"
        }
    }
}
