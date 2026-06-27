//
//  UnknownFieldTests.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import XCTest
@testable import EulerityTakeHomeTest

final class UnknownFieldTests: XCTestCase {

    func test_unknown_field_is_skipped() throws {

        let json = """
        {
            "theme": {
                "background_color":"#fff",
                "text_color":"#000",
                "border_color":"#111",
                "error_color":"#f00"
            },
            "form_title":"Demo",
            "fields":[

                {
                    "id":"abc",
                    "order":1,
                    "type":"DATE_PICKER"
                },

                {
                    "id":"name",
                    "order":2,
                    "type":"TEXT",
                    "subtype":"PLAIN",
                    "label":"Name",
                    "required":true
                }

            ]
        }
        """

        let response = try JSONDecoder().decode(FormResponse.self, from: Data(json.utf8))
        XCTAssertEqual(response.fields.count, 1)
    }
}
