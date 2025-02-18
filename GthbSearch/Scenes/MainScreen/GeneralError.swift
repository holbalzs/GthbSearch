//
//  GeneralError.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import Foundation

enum GTHBSearchError: LocalizedError {
    case generalError(String?)

    var errorDescription: String? {
        switch self {
        case .generalError(let message):
            return message
        }
    }
}
