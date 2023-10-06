//
//  Category.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 02/10/2023.
//

import Foundation

struct Category: Identifiable {
    let imageName: String
    let name: String
    
    var id: String {
        return UUID().uuidString
    }
    
    
}
