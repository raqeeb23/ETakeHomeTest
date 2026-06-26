//
//  ValidationError.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
// ValidationError.swift
//

import Foundation

enum ValidationError: LocalizedError {

    case required(String)

    case regex(String)

    case maxLength(String)

    var errorDescription: String? {

        switch self {

        case .required(let message):
            return message

        case .regex(let message):
            return message

        case .maxLength(let message):
            return message
        }
    }
}