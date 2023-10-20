//
//  FoodRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation
import Alamofire

class FoodRepositoryImpl: FoodRepository {
    
    
    func fetchProductsPerRestaurant(data: [String : Any]) async throws -> [Food] {
        do {
            var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.FOODS_URL
            request.parameters = data
            request.encoding = URLEncoding.default
            let responseFoods: ResponseFood = try await ApiRequest.request(request)
            return responseFoods.data
        } catch let error {
            throw error
        }
    }
    
    func fetchOrders() async throws -> [Order] {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return [
                Order(restaurantLogo: "donald", restaurantName: "Mcdonald's", createdAt: "21:30", totalPrice: "$ 45.50", status: "Proccess"),
                
                Order(restaurantLogo: "subway", restaurantName: "Subway", createdAt: "11:00", totalPrice: "$ 8.98", status: "Completed"),
                
                Order(restaurantLogo: "starbuck", restaurantName: "Starbucks", createdAt: "23:45", totalPrice: "$ 10", status: "Canceled"),
                
            ]
        } catch let error {
            throw error
        }
    }
    
    
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
//                Food(imageName: "cheese", name: "Cheese Burger", description: "Steak House", price: "5.99"),
//                Food(imageName: "pizza", name: "Pizza", description: "Grill Bar", price: "12.45"),
//                Food(imageName: "chicken_sandwich", name: "Chicken Burger", description: "Irish Pub", price: "3.59"),
//                Food(imageName: "salad", name: "Caesar salad", description: "Zala Resturant", price: "13.29"),
            ]
        } catch let error {
            throw error
        }
    }
    
    ///fetch list of categories
    func fetchCategories() async throws -> [Category] {
        do {
           var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.CATEGORY_URL
            request.encoding = JSONEncoding.default
            let responseCategory: ResponseCategory = try await ApiRequest.request(request)
            return responseCategory.data
            
        } catch let error {
            throw error
        }
    }
    
    ///fetch all foods of app
    func fetchProducts() async throws -> [Food] {
        do {
          var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.FOODS_URL
            request.encoding = JSONEncoding.default
            let responseFoods: ResponseFood = try await ApiRequest.request(request)
            return responseFoods.data
            
        } catch let error {
            throw error
        }
    }
    
    ///fetch list of all restaurants
    func fetchRestaurants() async throws -> [Restaurant] {
        do {
           var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.RESTAURANTS_URL
            request.encoding = JSONEncoding.default
            let responseRestaurants: ResponseRestaurant = try await ApiRequest.request(request)
            return responseRestaurants.data
            
        } catch let error {
            throw error
        }
    }
    
    
}
