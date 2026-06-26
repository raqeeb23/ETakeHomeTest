//
//  FieldDecoding.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

protocol FieldDecoding {
    func decode(from decoder: Decoder, type: FieldType) throws -> Field?
}

struct DefaultFieldDecoder: FieldDecoding {

    func decode(from decoder: Decoder, type: FieldType) throws -> Field? {

        switch type {

        case .text:
            return .text(try TextFieldModel(from: decoder))
        case .dropdown:
            return .dropdown(try DropdownFieldModel(from: decoder))
        case .checkbox:
            return .checkbox(try CheckboxFieldModel(from: decoder))
        case .toggle:
            return .toggle(try ToggleFieldModel(from: decoder))
        }
    }

}
