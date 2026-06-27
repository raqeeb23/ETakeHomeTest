//
//  FormResponseTests.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import XCTest
@testable import EulerityTakeHomeTest

final class FormResponseTests: XCTestCase {

    func test_form_decodes_successfully() throws {

        let bundle = Bundle(for: Self.self)

        guard let url = bundle.url(forResource: "form", withExtension: "json") else {
            XCTFail("Missing form.json")
            return
        }

        let data = try Data(contentsOf: url)

        let response = try JSONDecoder().decode(FormResponse.self, from: data)
        XCTAssertEqual(response.formTitle, "Campaign Setup")
        XCTAssertEqual(response.fields.count, 7)
    }
}
