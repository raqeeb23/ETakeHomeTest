//
//  SecureTextInput.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct SecureTextInput: View {

    let model: TextFieldModel

    @Binding
    var text: String
    let hasError: Bool


    var body: some View {

        InputContainer(hasError: hasError) {
            SecureField(
                model.placeholder ?? "",
                text: $text
            )
        }

    }

}
