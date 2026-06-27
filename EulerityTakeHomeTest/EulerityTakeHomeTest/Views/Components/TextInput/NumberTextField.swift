//
//  NumberTextField.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct NumberTextField: View {

    let model: TextFieldModel

    @Binding
    var text: String
    let hasError: Bool

    var body: some View {

        InputContainer(hasError: hasError) {
            TextField(
                model.placeholder ?? "",
                text: $text
            )
            .keyboardType(.numberPad)
        }

    }

}
