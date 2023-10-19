//
//  Food.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct ResponseFood: Codable {
    let data: [Food]
}


struct Food: Identifiable,Codable {
    let id: Int?
    let status: String?
    let dateCreated: String?
    let name: String?
    let price: Double?
    let currency: String?
    let shortDescription: String?
    let isLiked: Bool?
    let image: String?
    let restaurant: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case dateCreated = "date_created"
        case name
        case price
        case currency
        case shortDescription = "short_description"
        case isLiked = "is_liked"
        case image
        case restaurant
    }
}
