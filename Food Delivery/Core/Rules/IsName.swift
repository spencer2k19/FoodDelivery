//
//  IsName.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsName: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "[^0-9]+$"
	}
}
