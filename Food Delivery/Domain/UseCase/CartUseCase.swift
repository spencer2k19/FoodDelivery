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
    
    func addOrder(with data: [String: Any]) async throws {
        do {
            try await repository.addOrder(with: data)
        } catch {
            throw error
        }
        
    }
    
    func increaseFoodQuantity(for foodId: Int64) throws {
        do {
            try repository.increaseFoodQuantity(foodId: foodId)
        } catch {
            throw error
        }
    }
    
    func removeFoodFromCart(foodId: Int64) throws {
        do {
            try repository.removeFoodFromCart(foodId: foodId)
        } catch {
            throw error
        }
    }
    
    
    
    
}
