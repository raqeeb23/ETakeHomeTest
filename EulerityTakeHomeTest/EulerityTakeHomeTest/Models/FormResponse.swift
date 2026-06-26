//
//  FormResponse.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

struct FormResponse: Decodable {

    let theme: Theme
    let formTitle: String
    let fields: [Field]

    enum CodingKeys: String, CodingKey {
        case theme
        case formTitle = "form_title"
        case fields
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        theme = try container.decode(Theme.self, forKey: .theme)

        formTitle = try container.decode(String.self, forKey: .formTitle)

        let safeFieldArray = try container.decode(
            SafeFieldArray.self,
            forKey: .fields
        )

        fields = safeFieldArray.fields.sorted {
            $0.order < $1.order
        }
    }
}
