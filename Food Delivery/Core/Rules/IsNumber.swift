//
//  IsNumber.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsNumber: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$"
	}
}
