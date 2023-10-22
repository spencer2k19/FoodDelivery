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
        Task { [weak self] in
            try? await self?.fetchOrders()
        }
    }
    
    private func fetchOrders() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchOrders(with: ["fields":"*,foods.foods_id.restaurant.*,foods.quantity,foods.foods_id.price"])
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
