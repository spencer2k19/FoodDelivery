//
//  UserUseCase.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class UserUseCase {
    let repository: UserRepository
    
    init(repository: UserRepository = UserRepositoryImpl()) {
        self.repository = repository
    }
    
    ///fetch all user favorites foods
    func fetchUserFavorites() async throws -> [Food] {
        do {
            return try await repository.fetchFavoritesUserFood()
        } catch let error {
            print(error)
            throw error
        }
    }
    
}
