//
//  IsEmail.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsEmail: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
	}
}
