//
//  Category.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct ResponseCategory: Codable {
    let data: [Category]
}

struct Category: Identifiable, Codable {
    let id: Int
    let dateCreated: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case name
        case image
    }
    
}
