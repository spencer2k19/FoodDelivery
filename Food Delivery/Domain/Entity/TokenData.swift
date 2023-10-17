//
//  TokenData.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation

struct TokenData: Codable {
    let accessToken: String?
    let expires: Int?
    let refreshToken: String?
    
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expires = "expires"
        case refreshToken = "refresh_token"
    }
}
