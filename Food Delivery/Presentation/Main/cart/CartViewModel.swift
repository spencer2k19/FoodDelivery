//
//  CartViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 27/10/2023.
//

import Foundation

class CartViewModel: BaseViewModel {
    @Published var savedFoods: [FoodEntity] = []
    private let useCase = CartUseCase()
    private let foodUsecase = FoodUseCase()
    @Published var providers: [Int64: String] = [:]
    
    
    var total: Double {
        var total = 0.0
        savedFoods.forEach { foodEntity in
            total += Double(foodEntity.quantity) * foodEntity.price
        }
        return total
    }
    
    override init() {
        super.init()
        Task {
            try? await fetchSavedFoods()
        }
        
        Task {
            try? await fetchRestaurants()
        }
    }
    
    func addOrder(comments: String) async throws {
        do {
            await setBusy(value: true)
            var data: [String: Any] = [:]
            var foodData:[[String: Any]] = []
            savedFoods.forEach { foodEntity in
                foodData.append([
                    "id": Int(foodEntity.id),
                    "quantity": Int(foodEntity.quantity)
                ])
            }
            
            
            data = [
                "order_status":"process",
                "comments": comments,
                "foods":foodData,
                "status":"published"
            ]
            
            try await useCase.addOrder(with: data)
            await setBusy(value: false)
        } catch let error {
            await setBusy(value: false)
            await setError(error: error)
            throw error
        }
    }
    
    
    func addQuantity(for foodId: Int64) throws {
        do {
            try useCase.increaseFoodQuantity(for: foodId)
            savedFoods = try useCase.getSavedFoods()
        } catch let error {
            print("An error occured: \(error)")
        }
    }
    
    func reduceQuantity(for foodId: Int64) throws {
        do {
            try useCase.removeFoodFromCart(foodId: foodId)
            savedFoods = try useCase.getSavedFoods()
        } catch let error {
            print("An error occured: \(error)")
        }
    }
    
    func fetchSavedFoods() async throws {
        do {
           try await MainActor.run(body: {
                savedFoods = try useCase.getSavedFoods()
            })
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    
    func fetchRestaurants() async throws {
        do {
            let data = try await foodUsecase.fetchRestaurants()
            await MainActor.run(body: {
                data.forEach { restaurant in
                    providers[Int64(restaurant.id ?? 0)] = restaurant.name ?? ""
                }
            })
            
        } catch let error {
            print("Error: \(error)")
            throw error
        }
    }
    
}
