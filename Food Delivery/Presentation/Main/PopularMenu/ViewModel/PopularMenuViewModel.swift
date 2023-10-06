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
    
    override init() {
        super.init()
        Task { [weak self] in
            try? await self?.fetchPopularFoods()
        }
    }
    
    
    func fetchPopularFoods() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchPopularMenu()
            await setBusy(value: false)
            await MainActor.run(body: {
                popularFoods = data
            })
        } catch let error {
            await setBusy(value: false)
            throw error
        }
    }
    
}
