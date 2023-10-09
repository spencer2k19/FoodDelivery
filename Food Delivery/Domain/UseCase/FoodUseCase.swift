//
//  FoodUseCase.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation

class FoodUseCase {
    let foodRepository: FoodRepository
    
    init(foodRepository: FoodRepository = FoodRepositoryImpl()) {
        self.foodRepository = foodRepository
    }
    
    ///fetch all foods
    func fetchFoods() async throws -> [Food] {
        do {
            let foods =  try await foodRepository.fetchProducts()
            return foods
        } catch let error {
            print(error)
            throw error
        }
    }
    
    ///fetch all popular menu of restaurant
    func fetchPopularMenu() async throws -> [Food] {
        do {
            return try await foodRepository.fetchAllPopularMenu()
        } catch let error {
            throw error
        }
    }
    
    ///fetch all categories
    func fetchCategories() async throws -> [Category] {
        do {
            return try await foodRepository.fetchCategories()
        } catch let error {
            print(error)
            throw error
        }
    }
    
    ///fetch all restaurants
    func fetchRestaurants() async throws -> [Restaurant] {
        do {
            return try await foodRepository.fetchRestaurants()
        } catch let error {
            throw error
        }
    }
    
    
    ///fetch all restaurants
    func fetchOrders() async throws -> [Order] {
        do {
            return try await foodRepository.fetchOrders()
        } catch let error {
            throw error
        }
    }
    
    ///fetch all testimonials of restaurant
    func fetchAllTestimonials(restaurantId: String) async throws -> [Testimonial] {
        do {
            return try await foodRepository.fetchTestimonials(of: restaurantId)
        } catch let error {
            throw error
        }
    }
}
