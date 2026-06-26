//
//  ToggleFieldModel.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct ToggleFieldModel: Codable, FormFieldRepresentable {

    let id: String
    let order: Int
    let label: String
    let defaultValue: Bool
    let required: Bool
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {

        case id
        case order
        case label
        case defaultValue = "default_value"
        case required
        case errorMessage = "error_message"
    }
}
