//
//  Restaurant.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct Restaurant: Identifiable, Codable {
    let image: String
    let logo: String
    let type: String
    let name: String
    let duration: String
    let distance: String
    let rating: Double
    let description: String
    let popularProducts: [Food]
    let lastTestimonial: Testimonial
    
    var id: String {
        return UUID().uuidString
    }
}
