//
//  SafeFieldArray.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct SafeFieldArray: Decodable {

    let fields: [Field]

    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()

        var result: [Field] = []

        while !container.isAtEnd {

            if let wrapper = try? container.decode(FieldWrapper.self),
               let field = wrapper.field {

                result.append(field)

            } else {

                _ = try? container.decode(EmptyDecodable.self)
            }

        }
        self.fields = result
    }
}
