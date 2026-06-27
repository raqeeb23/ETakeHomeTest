//
//  ToggleView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct ToggleView: View {

    let model: ToggleFieldModel

    @Binding
    var isOn: Bool

    let error: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Toggle(
                model.label,
                isOn: $isOn
            )

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)

            }

        }

    }

}