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

    @Environment(\.openURL)
    private var openURL

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack(alignment: .top, spacing: 12) {

                Button {

                    checked.toggle()

                } label: {

                    Image(systemName: checked
                          ? "checkmark.square.fill"
                          : "square")
                        .font(.title3)

                }
                .buttonStyle(.plain)

                checkboxText

                Spacer()

            }

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(.red)

            }

        }

    }
}

private extension CheckboxView {

    @ViewBuilder
    var checkboxText: some View {

        if let metadata = model.metadata,
           let (title, url) = metadata.first {

            let components = model.label.components(separatedBy: title)

            if components.count == 2 {

                (
                    Text(components[0])
                    + Text(title)
                        .foregroundStyle(
                            Color(hex: model.clickableTextColor ?? "#2563EB")
                        )
                        .underline()
                    + Text(components[1])
                )
                .onTapGesture {
                    openURL(url)
                }

            } else {

                Text(model.label)

            }

        } else {

            Text(model.label)

        }
    }
}
