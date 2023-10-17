//
//  ErrorWrapper.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}
