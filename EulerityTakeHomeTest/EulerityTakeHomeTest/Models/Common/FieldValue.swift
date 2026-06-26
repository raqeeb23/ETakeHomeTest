//
//  FieldValue.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import Foundation

enum FieldValue {

    case text(String)
    case bool(Bool)
    case singleSelection(String)
    case multipleSelection(Set<String>)
}
