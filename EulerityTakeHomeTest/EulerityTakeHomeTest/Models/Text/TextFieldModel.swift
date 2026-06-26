//
//  TextFieldModel.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct TextFieldModel: Codable, FormFieldRepresentable {

    let id: String
    let order: Int
    let label: String
    let subtype: TextSubtype
    let placeholder: String?
    let defaultValue: String?
    let maxLength: Int?
    let required: Bool
    let errorMessage: String?
    let regex: String?

    enum CodingKeys: String, CodingKey {

        case id
        case order
        case label
        case subtype
        case placeholder
        case defaultValue = "default_value"
        case maxLength = "max_length"
        case required
        case errorMessage = "error_message"
        case regex
    }
}
