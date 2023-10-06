//
//  UserRepository.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 06/10/2023.
//

import Foundation

protocol UserRepository {
    func fetchFavoritesUserFood() async throws -> [Food]
}
