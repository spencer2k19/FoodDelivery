//
//  Destination.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import Foundation

enum Destination: Codable, Hashable {
    
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    case login
    case register
    case bio
    case payment(fromLogin: Bool)
    case addCreditCard
    case uploadPhoto
    case location
    case home
    case notifications
    case orderDetails(order: Order)
    case deliverAddress
    case restaurantDetails(restaurant: Restaurant)
    case testimonials(restaurantId: Int)
    case favorites
    case popularMenu(restaurantId: Int)
    case forgotPassword
    case resendPassword
    case congratsForgotPassword
    case start
    case cart
    
    
    // Implement the hash(into:) function
       func hash(into hasher: inout Hasher) {
           // Hash each case individually
           switch self {
           case .login:
               hasher.combine(0)
           case .register:
               hasher.combine(1)
           case .bio:
               hasher.combine(2)
           case .payment(_):
               hasher.combine(3)
           case .addCreditCard:
               hasher.combine(4)
           case .uploadPhoto:
               hasher.combine(5)
           case .location:
               hasher.combine(6)
           case .home:
               hasher.combine(7)
           case .notifications:
               hasher.combine(8)
           case .orderDetails:
               hasher.combine(9)
           case .deliverAddress:
               hasher.combine(10)
           case .restaurantDetails(_):
               hasher.combine(11)
           case .testimonials(_):
               hasher.combine(12)
           case .favorites:
               hasher.combine(13)
           case .popularMenu:
               hasher.combine(14)
           case .forgotPassword:
               hasher.combine(15)
               
           case .resendPassword:
               hasher.combine(16)
               
           case .congratsForgotPassword:
               hasher.combine(17)
               
           case .start:
               hasher.combine(18)
               
           case .cart:
               hasher.combine(19)
               
           }
       }
    
}
