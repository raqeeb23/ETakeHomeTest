//
//  SubmissionPayload.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct SubmissionPayload: Encodable {

    let values: [String: SubmissionValue]

    func prettyPrintedJSON() throws -> String {

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

        let data = try encoder.encode(values)

        return String(decoding: data, as: UTF8.self)
    }
}

enum SubmissionValue: Encodable {

    case string(String)
    case bool(Bool)
    case array([String])

    func encode(to encoder: Encoder) throws {

        var container = encoder.singleValueContainer()

        switch self {

        case .string(let value):
            try container.encode(value)

        case .bool(let value):
            try container.encode(value)

        case .array(let value):
            try container.encode(value)
        }
    }
}
