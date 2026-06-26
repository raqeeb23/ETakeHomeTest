//
//  Extension+Color.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI

extension Color {

    init(hex: String) {

        let hex = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        var int: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&int)

        let red, green, blue: UInt64

        switch hex.count {

        case 6:

            red = (int >> 16) & 0xff
            green = (int >> 8) & 0xff
            blue = int & 0xff

        default:

            red = 0
            green = 0
            blue = 0
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: 1
        )
    }
}
