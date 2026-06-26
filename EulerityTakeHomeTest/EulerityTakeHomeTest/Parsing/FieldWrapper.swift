//
//  FieldWrapper.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct FieldWrapper: Decodable {

    let field: Field?

    enum CodingKeys: String, CodingKey {
        case type
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let type = try container.decode(
            FieldType.self,
            forKey: .type
        )

        field = try DefaultFieldDecoder()
            .decode(from: decoder, type: type)
    }
}
