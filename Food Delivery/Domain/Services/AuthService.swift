//
//  AuthService.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation

class AuthService {
    static let instance = AuthService()
    var tokenData: TokenData? = nil
    var preferences = UserDefaults(suiteName: "com.spencer.food-delivery")
    
    private init() {
        
    }
    
    func saveTokenData(tokenData: TokenData) throws {
        do {
            self.tokenData = tokenData
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(tokenData)
            preferences?.set(jsonData, forKey: "tokenData")
           
        } catch let error {
            throw error
        }
    }
    
    
    func tryAutoLogin() throws  {
        do {
            guard let data = preferences?.data(forKey: "tokenData") else {return}
            let jsonDecoder = JSONDecoder()
            tokenData = try jsonDecoder.decode(TokenData.self, from: data)
        } catch let error {
            throw error
        }
    }
    
    
}
