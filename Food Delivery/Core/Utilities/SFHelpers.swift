//
//  SFHelpers.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 17/10/2023.
//

import Foundation
public struct SFHelpers {
    static func isEqual(a: Any, b: Any) -> Bool {
        if a is Character {
            return a as! Character == b as! Character
        } else if a is String {
            return a as! String == b as! String
        } else if a is Int {
            return a as! Int == b as! Int
        } else if a is Float {
            return a as! Float == b as! Float
        } else if a is Double {
            return a as! Double == b as! Double
        } else if a is Bool {
            return a as! Bool == b as! Bool
        } else {
            return false
        }
    }
}
