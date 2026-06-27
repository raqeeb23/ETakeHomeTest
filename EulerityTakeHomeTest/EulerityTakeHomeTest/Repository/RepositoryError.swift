//
//  RepositoryError.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

enum RepositoryError: LocalizedError {

    case fileNotFound

    var errorDescription: String? {

        switch self {

        case .fileNotFound:
            return "form.json not found in bundle."
        }
    }
}
