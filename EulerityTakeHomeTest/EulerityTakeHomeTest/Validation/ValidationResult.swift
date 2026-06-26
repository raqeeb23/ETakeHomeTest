//
//  ValidationResult.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
// ValidationResult.swift
//

import Foundation

struct ValidationResult {

    let errors: [String: String]

    var isValid: Bool {
        errors.isEmpty
    }
}