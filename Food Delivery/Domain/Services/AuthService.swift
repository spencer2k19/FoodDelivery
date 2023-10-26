//
//  AuthService.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation
import SwiftUI


class AuthModel: ObservableObject {
    @Published var name: String = ""
}



class AuthService {
    static let instance = AuthService()
    @Published var tokenData: TokenData? = nil
    @Published var userData: User? = nil
    
   var preferences:UserDefaults?
    
    private init() {
        preferences = UserDefaults(suiteName: AppConstants.APP_GROUP_BUNDLE_ID)
            
    }
    
    func saveTokenData(tokenData: TokenData) throws  {
        do {
            self.tokenData = tokenData
           let jsonData = try TokenData.encodeTokenData(tokenData)
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
            guard let dataForToken = preferences?.string(forKey: AppConstants.PREFS_TOKEN) else {return}
            guard let dataForUser = preferences?.data(forKey: AppConstants.PREFS_USER) else {return}
            
            
            let jsonDecoder = JSONDecoder()
            tokenData =  TokenData.decodeTokenData(tokenJSON: dataForToken)
            userData = try jsonDecoder.decode(User.self, from: dataForUser)
        } catch let error {
            throw error
        }
    }
    
    
}
