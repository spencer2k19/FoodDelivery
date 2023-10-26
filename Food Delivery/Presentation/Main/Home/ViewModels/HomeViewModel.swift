//
//  HomeViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 14/09/2023.
//

import Foundation
class HomeViewModel: BaseViewModel {
    
    @Published var categories: [Category] = []
    @Published var foods: [Food] = []
    @Published var restaurants: [Restaurant] = []
    @Published var savedFoods: [FoodEntity] = []
    
    
    private var useCase: FoodUseCase = FoodUseCase()
    private var cartUseCase: CartUseCase = CartUseCase()
    
    var keyForCategory: String {
        return "categories"
    }
    
    var keyForRestaurants: String {
        return "restaurants"
    }
    
    var keyForFoods: String {
        return "foods"
    }
    
    
    override init() {
        super.init()
        
        Task {
            try? await self.fetchSavedFoods()
        }
        
        Task {
            try? await self.fetchCategories()
        }
        
        Task {
            try? await self.fetchPopularProducts()
        }
        Task {
            try? await self.fetchRestaurants()
        }
        
        
    }
    
    func addFoodToCart(food: Food) async throws {
        do {
            try cartUseCase.addFoodToCart(food: food)
            try await fetchSavedFoods()
        } catch let error {
            print("Error while adding food to cart: \(error)")
        }
    }
    
    func fetchCategories() async throws {
        do {
            await setBusyForObject(for: keyForCategory, value: true)
            let data = try await useCase.fetchCategories()
            await setBusyForObject(for: keyForCategory ,value: false)
            await MainActor.run(body: {
                categories = data
            })
            
        } catch let error {
            await setBusyForObject(for: keyForCategory, value: false)
            await setError(error: error)
        }
    }
    
    
    func fetchSavedFoods() async throws {
        do {
            try await MainActor.run(body: {
                savedFoods =  try cartUseCase.getSavedFoods()
            })
          
        } catch let error {
           print("Error: \(error)")
        }
    }
    
    
    
    
    
    func fetchPopularProducts() async throws {
        do {
            await setBusyForObject(for: keyForFoods, value: true)
            let data = try await useCase.fetchFoods()
            await setBusyForObject(for: keyForFoods, value: false)
            await MainActor.run(body: {
                
                foods = data
            })
            
        } catch let error {
            await setBusyForObject(for: keyForFoods, value: false)
            throw error
        }
    }
    
    
    func fetchRestaurants() async throws {
        do {
            await setBusyForObject(for: keyForRestaurants, value: true)
            let data = try await useCase.fetchRestaurants()
            await setBusyForObject(for: keyForRestaurants, value: false)
            await MainActor.run(body: {
                
                restaurants = data
            })
            
        } catch let error {
            print("Error: \(error)")
            await setBusyForObject(for: keyForRestaurants, value: false)
            throw error
        }
    }
}
