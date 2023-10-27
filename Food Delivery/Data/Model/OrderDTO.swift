//
//  OrderDTO.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 27/10/2023.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderDTO = try? JSONDecoder().decode(OrderDTO.self, from: jsonData)

import Foundation

// MARK: - OrderDTO
struct OrderDTO: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int?
    let status: String?
    let sort: JSONNull?
    let userCreated, dateCreated: String?
    let userUpdated, dateUpdated: JSONNull?
    let orderStatus: String?
    let foods: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, status, sort
        case userCreated = "user_created"
        case dateCreated = "date_created"
        case userUpdated = "user_updated"
        case dateUpdated = "date_updated"
        case orderStatus = "order_status"
        case foods
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
