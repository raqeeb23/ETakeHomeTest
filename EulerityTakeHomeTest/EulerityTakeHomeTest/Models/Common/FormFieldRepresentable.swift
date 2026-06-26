//
//  FormFieldRepresentable.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


protocol FormFieldRepresentable {

    var id: String { get }

    var order: Int { get }

    var label: String { get }

    var required: Bool { get }

    var errorMessage: String? { get }
}