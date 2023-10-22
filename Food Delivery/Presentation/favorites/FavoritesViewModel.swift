//
//  FavoritesViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class FavoritesViewModel: BaseViewModel {
    @Published var favorites: [Food] = []
    private var useCase = UserUseCase()
    
    override init() {
        super.init()
        Task { [weak self] in
            try? await self?.fetchFavorites()
        }
    }
    
    
    private func fetchFavorites() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchUserFavorites(with: ["filter[is_liked][_eq]":true])
            await setBusy(value: false)
            await MainActor.run(body: {
                favorites = data
            })
        } catch let error {
            await setBusy(value: false)
            print(error)
        }
    }
}
