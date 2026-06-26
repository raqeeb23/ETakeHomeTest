//
//  FormValidator.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
// FormValidator.swift
//

import Foundation

struct FormValidator {

    func validate(
        fields: [Field],
        values: [String: FieldValue]
    ) -> ValidationResult {

        var errors: [String: String] = [:]

        for field in fields {

            switch field {

            case .text(let model):

                guard model.required else { continue }

                guard case .text(let text)? = values[model.id],
                      !text.trimmingCharacters(in: .whitespaces).isEmpty
                else {

                    errors[model.id] =
                    model.errorMessage ?? "Required"

                    continue
                }

                if let max = model.maxLength,
                   text.count > max {

                    errors[model.id] =
                    "Maximum \(max) characters allowed."
                }

            case .dropdown(let model):

                guard model.required else { continue }

                if model.allowMultiple {

                    guard case .multipleSelection(let value)? =
                            values[model.id],
                          !value.isEmpty
                    else {

                        errors[model.id] =
                        model.errorMessage ?? "Required"

                        continue
                    }

                } else {

                    guard case .singleSelection(let value)? =
                            values[model.id],
                          value != nil
                    else {

                        errors[model.id] =
                        model.errorMessage ?? "Required"

                        continue
                    }
                }

            case .checkbox(let model):

                guard model.required else { continue }

                guard case .bool(let checked)? =
                        values[model.id],
                      checked
                else {

                    errors[model.id] =
                    model.errorMessage ?? "Required"

                    continue
                }

            case .toggle:

                break
            }
        }

        return ValidationResult(errors: errors)
    }
}