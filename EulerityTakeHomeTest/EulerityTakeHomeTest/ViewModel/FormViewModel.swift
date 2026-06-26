//
//  FormViewModel.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI
import Combine

@MainActor
final class FormViewModel: ObservableObject {

    @Published private(set) var theme: Theme?
    @Published private(set) var title: String = ""
    @Published private(set) var fields: [Field] = []
    @Published var values: [String: FieldValue] = [:]
    @Published var validationErrors: [String: String] = [:]

    private let validator = FormValidator()

    init() {
        loadForm()
    }
}

// MARK: - Load JSON

private extension FormViewModel {

    func loadForm() {

        guard let url = Bundle.main.url(forResource: "form",withExtension: "json") else {
            print("form.json not found.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(
                FormResponse.self,
                from: data
            )

            theme = response.theme
            title = response.formTitle
            fields = response.fields
            populateDefaultValues()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Default Values

private extension FormViewModel {

    func populateDefaultValues() {

        values.removeAll()

        for field in fields {

            switch field {

            case .text(let model):
                values[model.id] = .text(model.defaultValue ?? "")
                
            case .dropdown(let model):
                if model.allowMultiple {
                    values[model.id] = .multipleSelection(Set(model.defaultValues ?? []))
                } else {
                    values[model.id] = .singleSelection(model.defaultValues?.first ?? "")
                }

            case .checkbox(let model):
                values[model.id] = .bool(false)

            case .toggle(let model):
                values[model.id] = .bool(model.defaultValue)
            }
        }
    }
}

// MARK: - Validation

extension FormViewModel {

    func validate() -> Bool {
        let result = validator.validate(fields: fields, values: values)
        validationErrors = result.errors
        return result.isValid
    }
}

// MARK: - Save

extension FormViewModel {

    func save() {
        guard validate() else {
            print(validationErrors)
            return
        }

        print(values)
    }
}


// MARK: - Bindings

extension FormViewModel {

    func textBinding(id: String) -> Binding<String> {

        Binding {
            guard case .text(let value)? = self.values[id] else { return "" }
            return value
        } set: {
            self.values[id] = .text($0)
        }
    }

    func boolBinding(id: String) -> Binding<Bool> {

        Binding {
            guard case .bool(let value)? = self.values[id] else { return false }
            return value
        } set: {
            self.values[id] = .bool($0)
        }
    }

    func singleSelectionBinding(id: String) -> Binding<String> {

        Binding {
            guard case .singleSelection(let value)? = self.values[id] else { return "" }
            return value
        } set: {
            self.values[id] = .singleSelection($0)
        }
    }

    func multiSelectionBinding(id: String) -> Binding<Set<String>> {

        Binding {
            guard case .multipleSelection(let value)? = self.values[id] else { return [] }
            return value
        } set: {
            self.values[id] = .multipleSelection($0)
        }
    }
}
