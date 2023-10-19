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
    
    
    func fetchFavoritesUserFood() async throws -> [Food] {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return [
//                Food(imageName: "peperroni", name: "Pizza pepperoni", description: "", price: "25,90"),
//                Food(imageName: "philadelphia", name: "Philadelphia roll", description: "", price: "8.98"),
//                Food(imageName: "noodle", name: "Noodle", description: "", price: "10"),
//                Food(imageName: "shawarma", name: "Shawarma", description: "", price: "14.49"),
//                Food(imageName: "taco", name: "Taco", description: "", price: "5"),
            ]
        } catch let error {
            throw error
        }
    }
    
    
}
