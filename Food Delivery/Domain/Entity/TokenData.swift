//
//  TokenData.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation


//   let responseToken = try? JSONDecoder().decode(ResponseToken.self, from: jsonData)

import Foundation

// MARK: - ResponseToken
struct ResponseToken: Codable {
    let data: TokenData
}

// MARK: - TokenData
struct TokenData: Codable {
    let accessToken: String?
    let expires: Int?
    let refreshToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expires
        case refreshToken = "refresh_token"
    }
}

