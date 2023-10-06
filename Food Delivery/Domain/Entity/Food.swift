//
//  Food.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct Food: Identifiable {
    let imageName: String
    let name: String
    let description: String
    let price: String
    
    var id: String {
        return UUID().uuidString
    }
}
