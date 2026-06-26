//
//  MultiDropdownView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
// MultiDropdownView.swift
//

import SwiftUI

struct MultiDropdownView: View {

    let model: DropdownFieldModel

    @Binding
    var selection: Set<String>

    let error: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(model.label)
                .font(.headline)

            Menu {

                ForEach(model.options) { option in

                    Button {

                        toggle(option.id)

                    } label: {

                        HStack {

                            Text(option.label)

                            if selection.contains(option.id) {

                                Image(systemName: "checkmark")

                            }

                        }

                    }

                }

            } label: {

                HStack {

                    Text(selectedText)

                    Spacer()

                    Image(systemName: "chevron.down")

                }
                .padding()
                .overlay {

                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray)

                }

            }

            if let error {

                Text(error)
                    .foregroundStyle(.red)
                    .font(.caption)

            }

        }

    }

}

private extension MultiDropdownView {

    func toggle(_ id: String) {

        if selection.contains(id) {

            selection.remove(id)

        } else {

            selection.insert(id)

        }

    }

    var selectedText: String {

        let values = model.options
            .filter {

                selection.contains($0.id)

            }
            .map(\.label)

        return values.isEmpty
            ? "Select"
            : values.joined(separator: ", ")

    }

}