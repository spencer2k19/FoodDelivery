//
//  IntroViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation
class IntroViewModel: ObservableObject {
    let service = AuthService.instance
    
    func startup() async throws {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            try service.tryAutoLogin()
            
        } catch let error {
            print(error)
        }
    }
    
    func isUserLogged() -> Bool {
        return service.tokenData != nil
    }
}
