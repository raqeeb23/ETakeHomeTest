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

    var body: some View {

        TextField(
            model.placeholder ?? "",
            text: $text
        )
        .keyboardType(.numberPad)
        .textFieldStyle(.roundedBorder)

    }

}