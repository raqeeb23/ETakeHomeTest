//
//  FormRepositoryTests.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import XCTest
@testable import EulerityTakeHomeTest

final class FormRepositoryTests: XCTestCase {

    func test_loadForm_successfullyDecodesForm() throws {

        let repository = LocalFormRepository(
            bundle: Bundle(for: Self.self)
        )

        let response = try repository.loadForm()

        XCTAssertEqual(response.formTitle, "Campaign Setup")
        XCTAssertEqual(response.fields.count, 7)
    }
}
