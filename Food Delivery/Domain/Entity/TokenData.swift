//
//  TokenData.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation


//   let responseToken = try? JSONDecoder().decode(ResponseToken.self, from: jsonData)


// MARK: - ResponseToken
struct ResponseToken: Codable {
    let data: TokenData
}

// MARK: - TokenData
class TokenData: Codable, ObservableObject {
    
     var accessToken: String? = ""
     var expires: Int? = 0
     var refreshToken: String? = ""

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expires
        case refreshToken = "refresh_token"
    }
    
    static func encodeTokenData(_ token: TokenData) throws -> String {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(token)
            return String(data: jsonData, encoding: .utf8) ?? ""
        } catch {
            print("Encoding error: \(error)")
            throw error
        }
    }
    
    static func decodeTokenData(tokenJSON: String) -> TokenData? {
        if let jsonData = tokenJSON.data(using: .utf8) {
            do {
                let decoder = JSONDecoder()
                let token = try decoder.decode(TokenData.self, from: jsonData)
                return token
            } catch {
                print("Decoding error: \(error)")
            }
        }
        return nil
    }
    

}

