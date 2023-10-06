//
//  Testimonial.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct Testimonial: Identifiable {
    let imageName: String
    let authorName: String
    let date: String
    let rate: Int
    let description: String
    
    var id: String {
        return UUID().uuidString
    }
}
