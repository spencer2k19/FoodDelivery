//
//  IsEqualTo.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsEqualTo: SwiftFormRule {
	var match: Any? = nil
	
	var message : String = "Field not matching"
	
	init() {}
	
	init(match: Any) {
		self.match = match
	}
	
	init(match: Any, message: String) {
		self.match = match
		self.message = message
	}
	
	func valid(_ value: String) -> Bool {
		if self.match is String {
			return value == self.match as! String
		} else {
			return false
		}
	}
	
	func valid(_ value: Any) -> Bool {
		if let safeMatch = self.match {
			return SFHelpers.isEqual(a: safeMatch, b: value)
		} else {
			return false
		}
	}
	
	func error() -> String {
		return message
	}
}
