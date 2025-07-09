//
//  FavoriteUserRepository.swift
//  PeopleBox
//
//  Created by Onur Altintas on 9.07.2025.
//

import Foundation
import SwiftData

@MainActor
class FavoriteUserRepository {
    // MARK: - Properties
    private let context: ModelContext

    // MARK: - Initialization
    init(context: ModelContext) {
        self.context = context
    }

    // MARK: - Favorites Management
    func addToFavorites(_ user: User) throws {
        let fav = FavoriteUser(from: user)
        context.insert(fav)
        do {
            try context.save()
        } catch {
            throw FavUserRepoError.saveFailed
        }
    }

    func removeFromFavorites(_ user: User) throws {
        let descriptor = FetchDescriptor<FavoriteUser>(
            predicate: #Predicate { $0.id == user.id }
        )
        do {
            if let fav = try context.fetch(descriptor).first {
                context.delete(fav)
                try context.save()
            }
        } catch {
            throw FavUserRepoError.deleteFailed
        }
    }

    func fetchFavorites() throws -> [FavoriteUser] {
        let descriptor = FetchDescriptor<FavoriteUser>()
        do {
            return try context.fetch(descriptor)
        } catch {
            throw FavUserRepoError.fetchFailed
        }
    }
}
