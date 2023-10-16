//
//  GeneralError.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 16/10/2023.
//

import Foundation


//   let generalError = try? JSONDecoder().decode(GeneralError.self, from: jsonData)

import Foundation

// MARK: - GeneralError
struct GeneralError: Codable {
    let errors: [CustomError]
}

// MARK: - Error
struct CustomError: Codable {
    let message: String
    let extensions: Extensions?
}

// MARK: - Extensions
struct Extensions: Codable {
    let code, reason: String?
}
