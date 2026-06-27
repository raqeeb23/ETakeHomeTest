//
//  FieldValue.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

enum FieldValue {

    case text(String)

    case bool(Bool)

    case singleSelection(String)

    case multipleSelection(Set<String>)
}

extension FieldValue {

    var submissionValue: SubmissionValue {

        switch self {

        case .text(let value):
            return .string(value)

        case .bool(let value):
            return .bool(value)

        case .singleSelection(let value):
            return .string(value)

        case .multipleSelection(let value):
            return .array(Array(value).sorted())
        }
    }
}
