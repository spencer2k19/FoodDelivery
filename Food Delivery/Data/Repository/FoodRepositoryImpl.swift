//
//  FoodRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation

class FoodRepositoryImpl: FoodRepository {
    
    func fetchTestimonials(of restaurantId: String) async throws -> [Testimonial] {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return [
                Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023",
                            rate: 5, description: "The food is very ddelicious an the service is best! love it! "),
                
                Testimonial(imageName: "testimonial1", authorName: "Keelan Vasquez", date: "28.01.2023",
                            rate: 4, description: "Had brunch at this restaurant one time and since then this place is my favorite one."),
                
                Testimonial(imageName: "testimonial2", authorName: "Adem Bennett", date: "07.08.2023",
                            rate: 5, description: "Love this place and the food is just awesome."),
                
                Testimonial(imageName: "testimonial3", authorName: "Woody Mccoy", date: "10.05.2023",
                            rate: 5, description: "Everything is simply perfect about this place. Highly suggested.")
                
                
            ]
        } catch let error {
            throw error
        }
    }
    
    
    func fetchAllPopularMenu() async throws -> [Food] {
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            return [
                Food(imageName: "cheese", name: "Cheese Burger", description: "Steak House", price: "5.99"),
                Food(imageName: "pizza", name: "Pizza", description: "Grill Bar", price: "12.45"),
                Food(imageName: "chicken_sandwich", name: "Chicken Burger", description: "Irish Pub", price: "3.59"),
                Food(imageName: "salad", name: "Caesar salad", description: "Zala Resturant", price: "13.29"),
            ]
        } catch let error {
            throw error
        }
    }
    
    
    func fetchCategories()async throws -> [Category] {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return [
                Category(imageName: "dessert", name: "Deserts"),
                Category(imageName: "vegetarian", name: "Vegetarian"),
                Category(imageName: "meat", name: "Meat"),
                Category(imageName: "fruits", name: "Fruits"),
            ]
            
        } catch let error {
            throw error
        }
    }
    
    
    func fetchProducts() async throws -> [Food] {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return  [
                Food(imageName: "cheese", name: "Cheese Burger", description: "Cheesy Heaven", price: "5.99"),
                Food(imageName: "chicken_sandwich", name: "Chicken Sandwich", description: "Popeyes what", price: "3.59"),
            ]
            
        } catch let error {
            throw error
        }
    }
    
    
    func fetchRestaurants() async throws -> [Restaurant] {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return [
                Restaurant(image: "restaurant_page", logo: "mcdonald", type: "Popular", name: "Mcdonald's", duration: "15 mins", distance: "3 km", rating: 4.8, description: """
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
                       Food(imageName: "chicken_sandwich", name: "Chicken Sandwich", description: "Popeyes what", price: "3.59")], lastTestimonial: Testimonial(imageName: "person_testimonial", authorName: "Ricky Martin", date: "20.11.2023", rate: 5, description: "The food is very ddelicious an the service is best! love it! ")),
                
                
                
                
                
                Restaurant(image: "restaurant_page", logo: "wendy", type: "Popular", name: "Wendy's", duration: "15 mins", distance: "3 km", rating: 4.8, description: """
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
                
            ]
            
        } catch let error {
            throw error
        }
    }
    
    
}
