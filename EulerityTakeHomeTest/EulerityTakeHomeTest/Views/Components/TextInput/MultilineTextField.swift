//
//  MultilineTextField.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct MultilineTextField: View {

    let model: TextFieldModel

    @Binding
    var text: String

    let hasError: Bool

    var body: some View {

        TextEditor(text: $text)
            .frame(minHeight: 120)
            .padding(8)
            .overlay {

                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        hasError
                        ? Color.red
                        : Color.gray.opacity(0.35),
                        lineWidth: 1
                    )

            }

    }

}
