//
//  DropdownView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

//
// DropdownView.swift
//

import SwiftUI

struct DropdownView: View {

    let model: DropdownFieldModel

    @ObservedObject
    var viewModel: FormViewModel

    let error: String?

    var body: some View {

        if model.allowMultiple {

            MultiDropdownView(
                model: model,
                selection: viewModel.multiSelectionBinding(id: model.id),
                error: error
            )

        } else {

            SingleDropdownView(
                model: model,
                selection: viewModel.singleSelectionBinding(id: model.id),
                error: error
            )

        }

    }
}
