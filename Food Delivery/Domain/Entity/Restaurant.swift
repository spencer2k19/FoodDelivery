//
//  Restaurant.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct ResponseRestaurant: Codable {
    let data: [Restaurant]
}

struct Restaurant: Identifiable, Codable {
    let id: Int?
    let status: String?
    let dateCreated: String?
    let name: String?
    let logo: String?
    var rating: Double? = 0
    let description: String?
    let coverImage: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case dateCreated = "date_created"
        case name
        case logo
        case rating
        case description
        case coverImage = "cover_image"
    }
}
