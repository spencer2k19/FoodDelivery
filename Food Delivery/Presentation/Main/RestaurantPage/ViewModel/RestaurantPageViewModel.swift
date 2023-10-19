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
                   
                ]
                isBusy.toggle()
            })
           
        } catch let error {
            isBusy.toggle()
            throw error
        }
    }
}
