//
//  Destination.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import Foundation

enum Destination: Codable, Hashable {
    case login
    case register
    case bio
    case payment
    case addCreditCard
    case uploadPhoto
    case location
    case home
    case notifications
    case orderDetails
    case deliverAddress
    case restaurantDetails
    case testimonials
    case favorites
    case popularMenu
    case forgotPassword
    
}
