//
//  DropdownFieldModel.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct DropdownFieldModel: Decodable, FormField {

    let id: String
    let order: Int
    let label: String
    let required: Bool
    let errorMessage: String?
    let allowMultiple: Bool
    let defaultValues: [String]
    let options: [DropdownOption]
}

struct DropdownOption: Decodable {

    let id: String
    let label: String
}
