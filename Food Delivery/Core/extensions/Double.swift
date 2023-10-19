//
//  Double.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 19/10/2023.
//

import Foundation
extension Double {
    
    /// Converts a Double into a  string representation
    ///```
    /// Convert 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
