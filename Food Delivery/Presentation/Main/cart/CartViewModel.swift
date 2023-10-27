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
    
    override init() {
        super.init()
        Task {
            try? await fetchSavedFoods()
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
    
}
