//
//  OrdersViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class OrdersViewModel: BaseViewModel {
    @Published var orders: [Order] = []
    private var useCase = FoodUseCase()
    
    override init() {
        super.init()
       
    }
    
     func fetchOrders() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchOrders(with: ["fields":"*,foods.foods_id.restaurant.*,foods.quantity,foods.foods_id.price,foods.foods_id.image,foods.foods_id.name,foods.foods_id.currency,foods.id"])
            await setBusy(value: false)
            await MainActor.run(body: {
                orders = data
            })
        } catch let error {
            await setBusy(value: false)
            await setError(error: error)
        }
    }
}
