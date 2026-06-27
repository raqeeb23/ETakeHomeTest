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
                    text: $text,
                    hasError: hasError
                )

            case .secure:

                SecureTextInput(
                    model: model,
                    text: $text,
                    hasError: hasError
                )

            case .number:

                NumberTextField(
                    model: model,
                    text: $text,
                    hasError: hasError
                )

            case .uri:

                URLTextField(
                    model: model,
                    text: $text,
                    hasError: hasError
                )

            case .multiline:

                MultilineTextField(
                    model: model,
                    text: $text,
                    hasError: hasError
                )
            default:
                EmptyView()
            }

            if let max = model.maxLength {

                HStack {

                    Spacer()

                    Text("\(text.count)/\(max)")
                        .foregroundStyle(text.count >= max ? Color.red : Color.secondary)
                }
            }

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.opacity)

            }

        }
        .onChange(of: text) { (_, newValue) in
            guard let max = model.maxLength else { return }
            if newValue.count > max {
                text = String(newValue.prefix(max))
            }
        }
    }
}


private extension TextInputView {

    var hasError: Bool {
        error != nil
    }
}
