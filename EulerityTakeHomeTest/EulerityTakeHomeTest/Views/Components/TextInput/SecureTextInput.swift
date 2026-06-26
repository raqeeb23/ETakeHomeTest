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

    var body: some View {

        SecureField(
            model.placeholder ?? "",
            text: $text
        )
        .textFieldStyle(.roundedBorder)

    }

}