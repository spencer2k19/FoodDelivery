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
    var userData: User? = nil
    
    
    var preferences:UserDefaults?
    
    private init() {
        preferences = UserDefaults(suiteName: AppConstants.APP_GROUP_BUNDLE_ID)
            
    }
    
    func saveTokenData(tokenData: TokenData) throws {
        do {
            self.tokenData = tokenData
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(tokenData)
            preferences?.set(jsonData, forKey: AppConstants.PREFS_TOKEN)
            preferences?.synchronize()
           
        } catch let error {
            throw error
        }
    }
    
    func saveUserData(userData: User) throws {
        do {
            self.userData = userData
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(userData)
            preferences?.set(jsonData, forKey: AppConstants.PREFS_USER)
            preferences?.synchronize()
        } catch let error {
            throw error
        }
    }
    
    func logout()  {
        
        preferences?.removePersistentDomain(forName: AppConstants.APP_GROUP_BUNDLE_ID)
        preferences?.synchronize()
        tokenData = nil
    }
    
    
    func tryAutoLogin() throws  {
        do {
            guard let dataForToken = preferences?.data(forKey: AppConstants.PREFS_TOKEN) else {return}
            guard let dataForUser = preferences?.data(forKey: AppConstants.PREFS_USER) else {return}
            
            let jsonDecoder = JSONDecoder()
            tokenData = try jsonDecoder.decode(TokenData.self, from: dataForToken)
            userData = try jsonDecoder.decode(User.self, from: dataForUser)
        } catch let error {
            throw error
        }
    }
    
    
}
