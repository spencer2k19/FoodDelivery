//
//  IsStrongPassword.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsStrongPassword: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).*?$"
	}
}
