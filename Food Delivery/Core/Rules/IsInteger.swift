//
//  IsInteger.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsInteger: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^[1-9][0-9]*$"
	}
}
