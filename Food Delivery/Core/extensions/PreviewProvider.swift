//
//  PreviewProvider.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {
        
    }
    
    let food = Food(id: 1, status: "", dateCreated: "", name: "", price: 12.2, currency: "", shortDescription: "", isLiked: false, image: "", restaurant: 0)
    let favorite =  Food(id: 2, status: "", dateCreated: "", name: "", price: 10, currency: "", shortDescription: "", isLiked: false, image: "", restaurant: 0)
    
    
    let testimonial = Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023", rate: 5, description: "The food is very ddelicious an the service is best! love it! ")
    
    let order = Order(restaurantLogo: "mcdonald", restaurantName: "McDonald's", createdAt: "21:30",
                      totalPrice: "45.50", status: "Proccess")
    
    
    let restaurant =  Restaurant(id: 0, status: "", dateCreated: "", name: "", logo: "", description: "", coverImage: "")
}
