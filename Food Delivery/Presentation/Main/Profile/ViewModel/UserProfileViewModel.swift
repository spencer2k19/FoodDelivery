//
//  UserProfileViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class UserProfileViewModel: BaseViewModel {
    @Published var favorites: [Food] = []
    private var useCase = UserUseCase()
    let service = AuthService.instance
    
    
    var user: User? {
        return service.userData
    }
    
    override init() {
        super.init()
        Task { [weak self] in
            try? await self?.fetchFavorites()
        }
    }
    
    
    func logout() {
        service.logout()
    }
    
    
    private func fetchFavorites() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.fetchUserFavorites()
            await setBusy(value: false)
            await MainActor.run(body: {
                favorites = Array(data.prefix(3))
            })
        } catch let error {
            await setBusy(value: false)
            print(error)
        }
    }
}
