//
//  TextInputView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI

struct TextInputView: View {

    let model: TextFieldModel

    @Binding
    var text: String

    let error: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(model.label)
                .font(.headline)

            switch model.subtype {

            case .plain:

                PlainTextField(
                    model: model,
                    text: $text
                )

            case .secure:

                SecureTextInput(
                    model: model,
                    text: $text
                )

            case .number:

                NumberTextField(
                    model: model,
                    text: $text
                )

            case .uri:

                URLTextField(
                    model: model,
                    text: $text
                )

            case .multiline:

                MultilineTextField(
                    model: model,
                    text: $text
                )

            case .unknown:

                EmptyView()
            }

            if let max = model.maxLength {

                HStack {

                    Spacer()

                    Text("\(text.count)/\(max)")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                }

            }

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)

            }

        }

    }

}
