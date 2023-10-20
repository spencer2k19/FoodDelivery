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
    
    
    func fetchTestimonials(of data: [String: Any]) async throws -> [Testimonial] {
        do {
          var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.TESTIMONIALS_URL
            request.parameters = data
            request.encoding = URLEncoding.default
            let response: ResponseTestimonial = try await ApiRequest.request(request)
            return response.data
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
