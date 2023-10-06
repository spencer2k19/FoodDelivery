//
//  RestaurantView.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 15/09/2023.
//

import SwiftUI

struct RestaurantView: View {
    let restaurant: Restaurant
    
    var body: some View {
        Rectangle()
            .foregroundColor(.theme.cardBackgroundColor)
            .frame(width: 150, height: 150)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.12, green: 0.12, blue: 0.12).opacity(0.08), radius: 8, x: 0, y: 4)
            .overlay(
                VStack(spacing: 10,content: {
                    Image(restaurant.logo)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .scaledToFit()
                    
                    Text(restaurant.name)
                        .font(.custom("Satoshi-Bold", size: 15))
                    
                    Text(restaurant.duration)
                        .font(.custom("Satoshi-Regular", size: 13))
                        .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.62))
                })
            )

    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: Restaurant(image: "restaurant_page", logo: "wendy", type: "Popular", name: "Wendy's", duration: "15 mins", distance: "3 km", rating: 4.8, description: """
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
                       Food(imageName: "chicken_sandwich", name: "Chicken Sandwich", description: "Popeyes what", price: "3.59")], lastTestimonial: Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023", rate: 5, description: "The food is very ddelicious an the service is best! love it! ")))
    }
}
