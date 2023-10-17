//
//  ExactSize.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

class ExactSize: SwiftFormCompairRule {
	init(limit: Int) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: "Should be equal to %ld characters", limit)
	}
		
	init(limit: Int, message: String) {
		super.init()
		self.limit = Double(limit)
		self.message = String(format: message, limit)
	}
		
	override func valid(_ value: String) -> Bool {
		return value.count == Int(self.limit)
	}
}
