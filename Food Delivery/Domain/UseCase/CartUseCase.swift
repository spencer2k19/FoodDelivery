//
//  CartUseCase.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/10/2023.
//

import Foundation

class CartUseCase {
    let repository: CartRepository
    
    init(repository: CartRepository = CartRepositoryImpl.instance) {
        self.repository = repository
    }
    
    func getSavedFoods() throws -> [FoodEntity] {
        do {
            return try repository.getFoods()
        } catch {
            throw error
        }
    }
    
    
    func addFoodToCart(food: Food) throws {
        do {
            try repository.addFoodToCart(food: food)
        } catch  {
            throw error
        }
    }
    
    func removeFoodFromCart(food: FoodEntity) {
        repository.removeFoodFromCart(food: food)
    }
    
    
    
    
}
