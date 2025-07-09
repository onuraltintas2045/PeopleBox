//
//  FavUserRepoError.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import Foundation

enum FavUserRepoError: Error, LocalizedError {
    case saveFailed
    case fetchFailed
    case deleteFailed

    var errorDescription: String? {
        switch self {
        case .saveFailed: return "Failed to save favorite user."
        case .fetchFailed: return "Failed to fetch favorite users."
        case .deleteFailed: return "Failed to remove favorite user."
        }
    }
}
