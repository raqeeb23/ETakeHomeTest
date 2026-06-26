//
//  URLTextField.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import SwiftUI

struct URLTextField: View {

    let model: TextFieldModel

    @Binding
    var text: String

    var body: some View {

        TextField(
            model.placeholder ?? "",
            text: $text
        )
        .keyboardType(.URL)
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .textFieldStyle(.roundedBorder)

    }

}