//
//  SwiftFormRule.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

protocol SwiftFormRule {
	func valid(_ value: String) -> Bool
	
	/**
	 For custom validations
	 */
	func valid(_ value: Any) -> Bool
	
	func error() -> String
}

class SwiftFormRegexRule: SwiftFormRule {
	var regex: String = "^(?=.*?[A-Z]).{8,}$"
	
	var message: String = "Field invalid"
	
	init() {}
	
	init(regex: String) {
		self.regex = regex
	}
	
	init(message: String) {
		self.message = message
	}
	
	init(regex: String, message: String) {
		self.regex = regex
		self.message = message
	}
	
	func valid(_ value: String) -> Bool {
		let test = NSPredicate(format: "SELF MATCHES %@", self.regex)
		return test.evaluate(with: value)
	}
	
	func valid(_ value: Any) -> Bool {
		return true
	}
	
	func error() -> String {
		return message
	}
}

class SwiftFormCompairRule: SwiftFormRule {
	var limit: Double = 0
	
	var message: String = ""
	
	init() {}
	
	func valid(_ value: String) -> Bool {
		return value.count >= Int(limit)
	}
	
	func valid(_ value: Any) -> Bool {
		return true
	}
	
	func error() -> String {
		return message
	}
}

struct SFRule {
	static let isRequired = IsRequired()
	static let isName = IsName()
	static let isStrongPassword = IsStrongPassword()
	static let isInteger = IsInteger()
	static let isEmail = IsEmail()
	static let isDate = IsDate()
	
	static func minLength(_ limit: Int) -> SwiftFormRule {
		return MinLength(limit: limit)
	}
	
	static func maxLength(_ limit: Int) -> SwiftFormRule {
		return MaxLength(limit: limit)
	}
	
	static func minVal(_ limit: Int) -> SwiftFormRule {
		return MinValue(limit: limit)
	}
	static func minVal(_ limit: Float) -> SwiftFormRule {
		return MinValue(limit: limit)
	}
	static func minVal(_ limit: Double) -> SwiftFormRule {
		return MinValue(limit: limit)
	}
	
	static func maxVal(_ limit: Int) -> SwiftFormRule {
		return MaxValue(limit: limit)
	}
	static func maxVal(_ limit: Float) -> SwiftFormRule {
		return MaxValue(limit: limit)
	}
	static func maxVal(_ limit: Double) -> SwiftFormRule {
		return MaxValue(limit: limit)
	}
	
	static func exactSize(_ limit: Int) -> SwiftFormRule {
		return ExactSize(limit: limit)
	}
	
	static func equalsTo(_ value: Any) -> SwiftFormRule {
		return IsEqualTo(match: value)
	}
}
