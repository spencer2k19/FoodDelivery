//
//  RestaurantPageViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation
class RestaurantPageViewModel: ObservableObject {
    @Published var foods: [Food] = []
    @Published var isBusy: Bool = false
    
    init() {
        Task {
            try? await fetchPopularProducts()
        }
    }
    
    
    func fetchPopularProducts() async throws {
        do {
            
             try await Task.sleep(nanoseconds: 1_000_000_000)
            await MainActor.run(body: {
                isBusy.toggle()
                foods = [
                    Food(imageName: "cheese", name: "Cheese Burger", description: "Cheesy Heaven", price: "5.99"),
                    Food(imageName: "chicken_sandwich", name: "Chicken Sandwich", description: "Popeyes what", price: "3.59"),
                ]
                isBusy.toggle()
            })
           
        } catch let error {
            isBusy.toggle()
            throw error
        }
    }
}
