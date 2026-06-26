//
//  TextSubtype.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

enum TextSubtype: Equatable {

    case plain
    case multiline
    case number
    case uri
    case secure

    case unknown
}

extension TextSubtype: Codable {

    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()

        let value = (try? container.decode(String.self)) ?? ""

        switch value {

        case "PLAIN":
            self = .plain

        case "MULTILINE":
            self = .multiline

        case "NUMBER":
            self = .number

        case "URI":
            self = .uri

        case "SECURE":
            self = .secure

        default:
            self = .unknown
        }
    }
}
