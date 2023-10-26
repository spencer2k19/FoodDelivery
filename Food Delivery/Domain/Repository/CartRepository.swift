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
    func removeFoodFromCart(food: FoodEntity)
}
