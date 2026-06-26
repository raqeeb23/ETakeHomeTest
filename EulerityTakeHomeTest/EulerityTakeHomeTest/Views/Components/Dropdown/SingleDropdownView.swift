//
//  SingleDropdownView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
// SingleDropdownView.swift
//

import SwiftUI

struct SingleDropdownView: View {

    let model: DropdownFieldModel

    @Binding
    var selection: String

    let error: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(model.label)
                .font(.headline)

            Picker("", selection: $selection) {

                Text("Select")
                    .tag("")

                ForEach(model.options) { option in

                    Text(option.label)
                        .tag(option.id)

                }

            }
            .pickerStyle(.menu)

            if let error {

                Text(error)
                    .foregroundStyle(.red)
                    .font(.caption)

            }

        }

    }

}