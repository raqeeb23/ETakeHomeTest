//
//  InputContainer.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import SwiftUI

struct InputContainer<Content: View>: View {

    let hasError: Bool

    @ViewBuilder
    let content: Content

    var body: some View {

        content
            .padding(.horizontal, 12)
            .frame(height: 44)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemBackground))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        hasError ? .red : .gray.opacity(0.35),
                        lineWidth: 1
                    )
            }
    }
}
