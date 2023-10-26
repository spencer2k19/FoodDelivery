//
//  PopularMenuViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class PopularMenuViewModel: BaseViewModel {
    @Published var popularFoods: [Food] = []
    private var useCase = FoodUseCase()
    private let cartUseCase = CartUseCase()
    @Published var savedFoods: [FoodEntity] = []
    
  
    
    var restaurantId: Int = 0
    
    required init(restaurantId: Int) {
        super.init()
        self.restaurantId = restaurantId
        Task {
            try? await fetchPopularProducts()
        }
        
        Task {
            try? await self.fetchSavedFoods()
        }
    }
    
    
    func addFood(food: Food) async throws {
        do {
            try cartUseCase.addFoodToCart(food: food)
            try await fetchSavedFoods()
        } catch let error {
            print("Error: \(error)")
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
           await setBusy(value: true)
            let data = try await useCase.fetchFoodsPerRestaurant(with: ["filter[restaurant][id][_eq]": restaurantId])
            await setBusy(value: false)
            await MainActor.run(body: {
               popularFoods = data
            })
            
        } catch let error {
            await setBusy(value: false)
            await setError(error: error)
        }
    }

    
}
