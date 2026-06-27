//
//  UnknownSubtypeTests.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import XCTest
@testable import EulerityTakeHomeTest

final class UnknownSubtypeTests: XCTestCase {

    func test_unknown_text_subtype_is_skipped() throws {

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
                    "id":"name",
                    "order":1,
                    "type":"TEXT",
                    "subtype":"EMAIL",
                    "label":"Name",
                    "required":true
                }

            ]
        }
        """

        let response = try JSONDecoder().decode(FormResponse.self, from: Data(json.utf8))
        XCTAssertEqual(response.fields.count,0)
    }
}
