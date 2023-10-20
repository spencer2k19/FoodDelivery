//
//  RestaurantPageViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation
class RestaurantPageViewModel: BaseViewModel {
    @Published var foods: [Food] = []
    @Published var testimonials: [Testimonial] = []
    
    var keyForTestimonials: String {
        return "testimonials"
    }
    
    let useCase = FoodUseCase()
    var restaurantId: Int = 0
    
    required init(restaurantId: Int) {
        super.init()
        self.restaurantId = restaurantId
        Task {
            try? await fetchPopularProducts()
        }
        
        Task {
            try? await fetchLastTestimonials()
        }
    }
    
    
    func fetchLastTestimonials() async throws {
        do {
            await setBusyForObject(for: keyForTestimonials, value: true)
            let data = try await useCase.fetchTestimonials(with: ["filter[restaurant][id][_eq]": restaurantId])
            await setBusyForObject(for: keyForTestimonials, value: false)
            await MainActor.run(body: {
                testimonials = Array(data.prefix(2))
            })
        } catch let error {
            await setBusyForObject(for: keyForTestimonials, value: false)
            print(error)
        }
    }
    
    
    func fetchPopularProducts() async throws {
        do {
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
