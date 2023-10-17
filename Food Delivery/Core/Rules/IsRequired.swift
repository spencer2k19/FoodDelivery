//
//  IsRequired.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsRequired: SwiftFormRule {
	var message : String = "Required field"
	
	init() {}
	
	init(message: String) {
		self.message = message
	}
	
	func valid(_ value: String) -> Bool {
		return !value.isEmpty
	}
	
	func valid(_ value: Any) -> Bool {
		return true
	}
	
	func error() -> String {
		return message
	}
}
