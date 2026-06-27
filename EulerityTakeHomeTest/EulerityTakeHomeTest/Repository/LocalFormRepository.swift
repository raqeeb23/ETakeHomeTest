//
//  LocalFormRepository.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

final class LocalFormRepository: FormRepository {

    func loadForm() throws -> FormResponse {

        guard let url = Bundle.main.url(
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
