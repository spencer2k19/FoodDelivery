//
//  UserRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    
    func fetchFavoritesUserFood() async throws -> [Food] {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return [
                Food(imageName: "peperroni", name: "Pizza pepperoni", description: "", price: "25,90"),
                Food(imageName: "philadelphia", name: "Philadelphia roll", description: "", price: "8.98"),
                Food(imageName: "noodle", name: "Noodle", description: "", price: "10"),
                Food(imageName: "shawarma", name: "Shawarma", description: "", price: "14.49"),
                Food(imageName: "taco", name: "Taco", description: "", price: "5"),
            ]
        } catch let error {
            throw error
        }
    }
    
    
}
