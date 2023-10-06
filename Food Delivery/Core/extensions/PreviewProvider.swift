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
    
    let food = Food(imageName: "cheese", name: "Cheese Burger", description: "Cheesy Heaven", price: "5.99")
    let testimonial = Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023", rate: 5, description: "The food is very ddelicious an the service is best! love it! ")
    
    
    let restaurant =  Restaurant(image: "restaurant_page", logo: "wendy", type: "Popular", name: "Wendy's", duration: "15 mins", distance: "3 km", rating: 4.8, description: """
A cheeseburger is a burger with a slice of melted cheese on top of the meat patty, added near the end of the cooking time. Cheeseburgers can include variations in structure, ingredients and composition. As with other hamburgers, a cheeseburger may include various condiments and other toppings such as:
    - Lettuce
    - Tomato
    - Onion
    - Pickles
    - Bacon
    - Avocado
    - Mushrooms
    - Mayonnaise
    - Ketchup
    - Mustard
""", popularProducts: [Food(imageName: "cheese", name: "Cheese Burger", description: "Cheesy Heaven", price: "5.99"),
                       Food(imageName: "chicken_sandwich", name: "Chicken Sandwich", description: "Popeyes what", price: "3.59")], lastTestimonial: Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023", rate: 5, description: "The food is very ddelicious an the service is best! love it! "))
}
