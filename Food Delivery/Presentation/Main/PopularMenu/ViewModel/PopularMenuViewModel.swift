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
    
  
    
    var restaurantId: Int = 0
    
    required init(restaurantId: Int) {
        super.init()
        self.restaurantId = restaurantId
        Task {
            try? await fetchPopularProducts()
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
