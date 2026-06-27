//
//  DynamicFieldView.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
//  DynamicFieldView.swift
//

import SwiftUI

struct DynamicFieldView: View {
    
    let field: Field
    
    @ObservedObject
    var viewModel: FormViewModel
    
    var body: some View {
        
        switch field {
        case .text(let model):
            TextInputView(model: model,
                          text: viewModel.textBinding(id: model.id),
                          error: viewModel.validationErrors[model.id])
        case .dropdown(let model):
            DropdownView(
                model: model,
                viewModel: viewModel,
                error: viewModel.validationErrors[model.id]
            )
        case .checkbox(let model):
            CheckboxView(model: model,
                         checked: viewModel.boolBinding(id: model.id),
                         error: viewModel.validationErrors[model.id])
        case .toggle(let model):
            ToggleView(model: model,
                       isOn: viewModel.boolBinding(id: model.id),
                       error: viewModel.validationErrors[model.id])
        }
    }
}
