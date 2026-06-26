//
//  CheckboxFieldModel.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct CheckboxFieldModel: Codable, FormFieldRepresentable {

    let id: String
    let order: Int
    let label: String
    let required: Bool
    let errorMessage: String?
    let metadata: [String: URL]?
    let clickableTextColor: String?

    enum CodingKeys: String, CodingKey {
        case id
        case order
        case label
        case required
        case errorMessage = "error_message"
        case metadata
        case clickableTextColor = "clickable_text_color"
    }
}
