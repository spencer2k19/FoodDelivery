//
//  ApiConstants.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation

struct ApiConstants {
    static let BASE_URL = "http://0.0.0.0:8055"
    
   
    static let LOGIN_URL = BASE_URL + "/auth/login"
    static let REFRESH_URL = BASE_URL + "/auth/refresh"
    static let ME_URL = BASE_URL + "/users/me"
    static let CATEGORY_URL = BASE_URL + "/items/categories"
}
