//
//  FieldDecoding.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

protocol FieldDecoding {
    func decode(from decoder: Decoder, type: FieldType) throws -> Field?
}

struct DefaultFieldDecoder: FieldDecoding {

    func decode(from decoder: Decoder, type: FieldType) throws -> Field? {

        switch type {

        case .text:

            guard let model = try? TextFieldModel(from: decoder) else {
                return nil
            }

            guard model.subtype != .unknown else {
                return nil
            }

            return .text(model)

        case .dropdown:

            guard let model = try? DropdownFieldModel(from: decoder) else {
                return nil
            }

            return .dropdown(model)

        case .checkbox:

            guard let model = try? CheckboxFieldModel(from: decoder) else {
                return nil
            }

            return .checkbox(model)

        case .toggle:

            guard let model = try? ToggleFieldModel(from: decoder) else {
                return nil
            }

            return .toggle(model)

        case .unknown:

            return nil
        }
    }
}
