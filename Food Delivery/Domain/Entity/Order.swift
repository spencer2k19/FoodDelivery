//
//  Order.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 08/10/2023.
//

import Foundation


struct ResponseOrder: Codable {
    let data: [Order]
}


//   let order = try? JSONDecoder().decode(Order.self, from: jsonData)

import Foundation

// MARK: - Order
struct Order: Codable,Identifiable {
    let id: Int?
    let status, userCreated, dateCreated, userUpdated: String?
    let dateUpdated, orderStatus: String?
    let foods: [FoodOrder]?

    enum CodingKeys: String, CodingKey {
        case id, status
        case userCreated = "user_created"
        case dateCreated = "date_created"
        case userUpdated = "user_updated"
        case dateUpdated = "date_updated"
        case orderStatus = "order_status"
        case foods
    }
}

// MARK: - Food
struct FoodOrder: Codable, Identifiable {
    let id: Int?
    let quantity: Int?
    let foodsID: FoodsID?

    enum CodingKeys: String, CodingKey {
        case id
        case quantity
        case foodsID = "foods_id"
    }
}

// MARK: - FoodsID
struct FoodsID: Codable {
    let price: Double?
    let image: String?
    let name: String?
    let currency: String?
    let restaurant: Restaurant?
}

// MARK: - Restaurant
struct RestaurantOrder: Codable {
    let id: Int?
    let status, dateCreated, dateUpdated, name: String?
    let logo: String?
    let rating: Int?
    let description, coverImage: String?

    enum CodingKeys: String, CodingKey {
        case id, status
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case name, logo, rating, description
        case coverImage = "cover_image"
    }
}

