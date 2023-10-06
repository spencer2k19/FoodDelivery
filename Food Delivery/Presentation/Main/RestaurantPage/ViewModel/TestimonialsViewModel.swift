//
//  TestimonialsViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation
class TestimonialViewModel: BaseViewModel {
    @Published var testimonials: [Testimonial] = []
    private var useCase = FoodUseCase()
    private var restaurantId: String = ""
    
   
    required init(restaurant: String) {
        super.init()
        restaurantId = restaurant
        Task { [weak self] in
            try? await self?.fetchTestimonials()
        }
    }
    
   
    
    func fetchTestimonials() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchAllTestimonials(restaurantId: restaurantId)
            await setBusy(value: false)
            await MainActor.run(body: {
                testimonials = data
            })
        } catch let error {
            await setBusy(value: false)
            print(error)
        }
    }
    
}
