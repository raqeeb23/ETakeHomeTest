//
//  Theme.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI

struct Theme: Decodable {

    let backgroundColor: String
    let textColor: String
    let borderColor: String
    let errorColor: String

    enum CodingKeys: String, CodingKey {

        case backgroundColor = "background_color"
        case textColor = "text_color"
        case borderColor = "border_color"
        case errorColor = "error_color"
    }
}

extension Theme {

    var background: Color {
        Color(backgroundColor)
    }

    var text: Color {
        Color(textColor)
    }

    var border: Color {
        Color(borderColor)
    }

    var error: Color {
        Color(errorColor)
    }
}
