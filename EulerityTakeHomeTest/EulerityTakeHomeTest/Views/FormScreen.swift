//
//  FormScreen.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI

struct FormScreen: View {

    @StateObject
    private var viewModel = FormViewModel()

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Text(viewModel.title)
                    .font(.largeTitle.bold())

                ForEach(viewModel.fields) { field in

                    DynamicFieldView(
                        field: field,
                        viewModel: viewModel
                    )
                }

                Button("Save") {
                    viewModel.save()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)

            }
            .padding()
        }
        .background(viewModel.theme?.background ?? .white)
    }
}

#Preview {
    FormScreen()
}
