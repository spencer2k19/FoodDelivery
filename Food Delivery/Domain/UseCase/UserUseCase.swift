//
//  UserUseCase.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

class UserUseCase {
    let repository: UserRepository
    let authService = AuthService.instance
    
    init(repository: UserRepository = UserRepositoryImpl()) {
        self.repository = repository
    }
    
    ///login with email and password
    func login(data: [String: String]) async throws {
        do {
           let tokenData =  try await repository.login(data: data)
            authService.tokenData = tokenData
            try authService.saveTokenData(tokenData: tokenData)
            print("Token got successfully: \(tokenData)")
            let user = try await repository.fetchUserData()
            print("User got successfully: \(user)")
            try authService.saveUserData(userData: user)
        } catch let error {
           throw error
        }
    }
    
    func downloadFile(path: String) async throws -> Data {
        do {
            return try await repository.downloadFile(path: path)
        } catch let error {
            throw error
        }
    }
    
    ///fetch current user data
    func fetchUserData() async throws {
        do {
            let user = try await repository.fetchUserData()
            try authService.saveUserData(userData: user)
        } catch let error {
            throw error
        }
    }
    
    ///fetch all user favorites foods
    func fetchUserFavorites(with data: [String: Any]) async throws -> [Food] {
        do {
            return try await repository.fetchFavoritesUserFood(with: data)
        } catch let error {
            print(error)
            throw error
        }
    }
    
}
