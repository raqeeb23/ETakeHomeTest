//
//  FieldType.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

enum FieldType: Equatable {

    case text
    case dropdown
    case checkbox
    case toggle

    case unknown
}

extension FieldType: Decodable {

    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()

        let value = (try? container.decode(String.self)) ?? ""

        switch value {

        case "TEXT":
            self = .text

        case "DROPDOWN":
            self = .dropdown

        case "CHECKBOX":
            self = .checkbox

        case "TOGGLE":
            self = .toggle

        default:
            self = .unknown
        }
    }
}
