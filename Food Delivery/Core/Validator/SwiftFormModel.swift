//
//  SwiftFormModel.swift
//  SwiftFormHost
//
//  Created by ezen on 19/08/2023.
//

import Foundation

struct SFValidatorField {
	var name: String
	var rules: [SwiftFormRule] = []
	var valid: Bool = false
	var error: String = ""
}
