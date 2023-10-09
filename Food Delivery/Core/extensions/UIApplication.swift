//
//  UIApplication.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 09/10/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
