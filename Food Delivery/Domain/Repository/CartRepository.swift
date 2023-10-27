//
//  CartRepository.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/10/2023.
//

import Foundation

protocol CartRepository {
    func getFoods() throws -> [FoodEntity]
    func addFoodToCart(food: Food) throws
    func increaseFoodQuantity(foodId: Int64) throws
    func removeFoodFromCart(foodId: Int64) throws
    func addOrder(with data: [String: Any]) async throws
}
