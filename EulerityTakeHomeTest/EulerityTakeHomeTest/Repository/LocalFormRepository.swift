//
//  LocalFormRepository.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

final class LocalFormRepository: FormRepository {

    private let bundle: Bundle

    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }

    func loadForm() throws -> FormResponse {

        guard let url = bundle.url(
            forResource: "form",
            withExtension: "json"
        ) else {
            throw RepositoryError.fileNotFound
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(
            FormResponse.self,
            from: data
        )
    }
}
