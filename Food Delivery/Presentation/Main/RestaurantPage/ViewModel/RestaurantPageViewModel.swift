//
//  RestaurantPageViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation
class RestaurantPageViewModel: BaseViewModel {
    @Published var foods: [Food] = []
    let useCase = FoodUseCase()
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
           print("Fetching popular products is called")
           await setBusy(value: true)
            let data = try await useCase.fetchFoodsPerRestaurant(with: ["filter[restaurant][id][_eq]": restaurantId])
            await setBusy(value: false)
            await MainActor.run(body: {
                foods = Array(data.prefix(8))
            })
            
        } catch let error {
            await setBusy(value: false)
            await setError(error: error)
        }
    }
}
