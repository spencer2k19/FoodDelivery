//
//  LoginViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation
import Combine

class LoginViewModel: BaseViewModel {
    let useCase = UserUseCase()
    @Published  var email: String = ""
    @Published  var password: String = ""
    
    @Published var errorMsgForEmail = ""
    @Published var errorMsgForPassword = ""
    
    
    override init() {
        super.init()
        //addSubscribers()
    }
    
    
   
    // Output subscribers
    private var cancellables = Set<AnyCancellable>()
    
    func login(onSuccess: () -> Void) async throws {
        do {
            if await !validForm() {
                return
            }
            await setBusy(value: true)
            try await useCase.login(data: ["email": email, "password":password])
            await setBusy(value: false)
            print("All is good there")
             await MainActor.run(body: {
                onSuccess()
            })
           
        }  catch let error as APIError {
            await setBusy(value: false)
            await setError(error: error)
        }
    }
    
    private func validForm() async -> Bool {
        
        return await MainActor.run(body: {
            var errors: [Bool] = []
            errorMsgForEmail = ""
            errorMsgForPassword = ""
            if(email.isEmpty) {
                errorMsgForEmail = "*Please enter your email address"
                errors.append(false)
            } else if !(isEmailValid(email)) {
                errorMsgForEmail = "*Please enter an valid email address"
                errors.append(false)
            }
            
            if password.isEmpty {
                errorMsgForPassword = "*Please enter an valid password"
                errors.append(false)
            }
            return !errors.contains(false)
        })
      
       
    }
    
    private func validateEmail(value: String) {
        if value.isEmpty {
            errorMsgForEmail = "*Please enter your email address"
            return
        }
        
        if !(isEmailValid(value)) {
            errorMsgForEmail = "*Please enter an valid email address"
            return
        }
        errorMsgForEmail = ""
    }
    
    private func validatePassword(value: String) {
        if value.isEmpty  {
            errorMsgForPassword = "*Please enter an valid password"
            return
        }
    }
    
    
    
    func addSubscribers() {
        
        $email.dropFirst(3).sink { [weak self] value in
            self?.validateEmail(value: value)
        }.store(in: &cancellables)
        
        $password.dropFirst(3).sink { [weak self] value in
            self?.validatePassword(value: value)
        }.store(in: &cancellables)
      
    }
    
    private func isEmailValid(_ email: String) -> Bool {
       let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
       
       let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
       return emailTest.evaluate(with: email)
   }
    
   
    
    
    
}
