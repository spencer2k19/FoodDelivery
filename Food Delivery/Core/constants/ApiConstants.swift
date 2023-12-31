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
    static let ORDERS_URL = BASE_URL + "/items/orders"
    static let FOODS_URL = BASE_URL + "/items/foods"
    static let RESTAURANTS_URL = BASE_URL + "/items/restaurants"
    static let TESTIMONIALS_URL = BASE_URL + "/items/testimonials"
    static let ASSETS_URL = BASE_URL + "/assets"
}
