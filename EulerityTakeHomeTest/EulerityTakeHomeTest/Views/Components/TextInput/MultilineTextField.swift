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

    var body: some View {

        TextEditor(text: $text)
            .frame(minHeight: 120)
            .overlay {

                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray)

            }

    }

}