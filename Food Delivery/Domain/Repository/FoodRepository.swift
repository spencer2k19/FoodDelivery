//
//  FoodRepository.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation

protocol FoodRepository {
    func fetchProducts() async throws -> [Food]
    func fetchProductsPerRestaurant(data:[String: Any]) async throws -> [Food]
    func fetchAllPopularMenu() async throws -> [Food]
    func fetchCategories() async throws -> [Category]
    func fetchRestaurants() async throws -> [Restaurant]
    func fetchOrders(with data: [String: Any]) async throws -> [Order]
    func fetchTestimonials(of data: [String: Any]) async throws -> [Testimonial]
}
