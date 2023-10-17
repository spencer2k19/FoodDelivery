//
//  MaxLength.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class MaxLength: SwiftFormCompairRule {
	init(limit: Int) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: "At most %ld characters", limit)
	}
	
	init(limit: Int, message: String) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: message, limit)
	}
	
	override func valid(_ value: String) -> Bool {
		return value.count <= Int(self.limit)
	}
}
