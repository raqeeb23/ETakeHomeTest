//
//  Field.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

enum Field {

    case text(TextFieldModel)
    case dropdown(DropdownFieldModel)
    case checkbox(CheckboxFieldModel)
    case toggle(ToggleFieldModel)
}

extension Field: Identifiable {

    var id: String {
        field.id
    }
}

extension Field {

    var field: any FormFieldRepresentable {

        switch self {
        case .text(let model):
            return model
        case .dropdown(let model):
            return model
        case .checkbox(let model):
            return model
        case .toggle(let model):
            return model
        }
    }

    var order: Int {
        field.order
    }

    var label: String {
        field.label
    }

    var required: Bool {
        field.required
    }
}
