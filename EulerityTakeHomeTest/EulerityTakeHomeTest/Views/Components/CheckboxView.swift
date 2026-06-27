//
//  CheckboxView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct CheckboxView: View {

    let model: CheckboxFieldModel

    @Binding
    var checked: Bool

    let error: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Button {

                checked.toggle()

            } label: {

                HStack(alignment: .top) {

                    Image(systemName: checked
                          ? "checkmark.square.fill"
                          : "square")

                    Text(model.label)

                    Spacer()

                }

            }
            .buttonStyle(.plain)

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)

            }

        }

    }

}