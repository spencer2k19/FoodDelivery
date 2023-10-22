//
//  UserRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation
import Alamofire



class UserRepositoryImpl: UserRepository {
    
    func downloadFile(path: String) async throws -> Data {
        do {
            return try await ApiRequest.download(path: path)
        } catch let error {
            throw error
        }
    }
    
    func fetchUserData() async throws -> User {
        do {
            var request = GenericRequest()
            request.method = .get
            request.path = ApiConstants.ME_URL
            request.encoding = JSONEncoding.default
            let responseUser: ResponseUser = try await ApiRequest.request(request)
            return responseUser.data
            
        } catch let error {
            throw error
        }
    }
    
    func login(data: [String : String]) async throws -> TokenData {
        do {
            var request = GenericRequest()
            request.method = .post
            request.parameters = data
            request.path = ApiConstants.LOGIN_URL
            request.encoding = JSONEncoding.default
           
            let result: ResponseToken = try await ApiRequest.request(request)
            return result.data
          
        } catch let error {
            throw error
        }
    }
    
    
    func fetchFavoritesUserFood(with data: [String: Any]) async throws -> [Food] {
        do {
            var request = GenericRequest()
            request.method = .get
            request.parameters = data
            request.path = ApiConstants.FOODS_URL
            request.encoding = URLEncoding.default
            let result: ResponseFood = try await ApiRequest.request(request)
            return result.data
            
        } catch let error {
            throw error
        }
    }
    
    
}
