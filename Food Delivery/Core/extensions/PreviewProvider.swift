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
    
    
    let testimonial = Testimonial(id: 0, status: "", dateCreated: "", authorName: "", content: "", rating: 9, avatar: "")
    
    let order = Order(id: 0, status: "", userCreated: "", dateCreated: "", userUpdated: "", dateUpdated: "", orderStatus: "", foods: nil)
    
    
    let restaurant =  Restaurant(id: 0, status: "", dateCreated: "", name: "", logo: "", description: "", coverImage: "")
}
