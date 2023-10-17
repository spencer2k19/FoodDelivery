//
//  IsDate.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class IsDate: SwiftFormRegexRule {
	override init() {
		super.init()
		self.regex = "^(19|20)[0-9][0-9][- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
	}
}
