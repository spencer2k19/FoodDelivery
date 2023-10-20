//
//  Testimonial.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation


struct ResponseTestimonial: Codable {
    let data: [Testimonial]
}

struct Testimonial: Identifiable, Codable {
    let id: Int?
    let status: String?
    let dateCreated: String?
    let authorName: String?
    let content: String?
    let rating: Double?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case dateCreated = "date_created"
        case authorName = "author_name"
        case content
        case rating
        case avatar
    }
    
}
