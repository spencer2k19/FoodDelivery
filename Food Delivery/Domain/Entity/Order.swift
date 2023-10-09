//
//  Order.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 08/10/2023.
//

import Foundation

struct Order: Identifiable {
    let restaurantLogo: String
    let restaurantName: String
    let createdAt: String
    let totalPrice: String
    let status: String
    
    var id: String {
        return UUID().uuidString
    }
}
