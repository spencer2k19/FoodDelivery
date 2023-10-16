//
//  LoginViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation

class LoginViewModel: BaseViewModel {
    let useCase = UserUseCase()
    
    func login(email: String, password: String) async throws {
        do {
            await setBusy(value: true)
            try await useCase.login(data: ["email": email, "password":password])
            await setBusy(value: false)
        }  catch let error as APIError {
            await setBusy(value: false)
            print("An error occured: \(error.localizedDescription)")
        }
    }
    
}
