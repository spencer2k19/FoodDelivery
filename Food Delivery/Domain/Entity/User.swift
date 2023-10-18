//
//  User.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 18/10/2023.
//

import Foundation
// let user = JSONDecoder().decode(ResponseUser.self, from: jsonData)


//MARK: - ResponseUser
struct ResponseUser: Codable {
    let data: User
}


//MARK: - User
struct User: Codable {
    let id: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case status
    }
    
}







