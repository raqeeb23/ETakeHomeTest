//
//  ValidationTests.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


import XCTest
@testable import EulerityTakeHomeTest

final class ValidationTests: XCTestCase {

    func test_requiredTextField_returnsError() {

        let field = TextFieldModel(
            id: "name",
            order: 1,
            label: "Name",
            subtype: .plain,
            placeholder: nil,
            defaultValue: nil,
            maxLength: nil,
            required: true,
            errorMessage: "Required",
            regex: nil
        )

        let validator = FormValidator()

        let result = validator.validate(
            fields: [.text(field)],
            values: [:]
        )

        XCTAssertFalse(result.isValid)
        XCTAssertEqual(result.errors["name"], "Required")
    }
    
    func test_requiredCheckbox_returnsError() {

        let field = CheckboxFieldModel(
            id: "terms",
            order: 1,
            label: "Terms",
            required: true,
            errorMessage: "Accept Terms",
            metadata: nil,
            clickableTextColor: nil
        )

        let validator = FormValidator()

        let result = validator.validate(
            fields: [.checkbox(field)],
            values: [
                "terms": .bool(false)
            ]
        )

        XCTAssertFalse(result.isValid)
    }
    
    func test_unknownField_isSkipped() throws {

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
              "id":"1",
              "order":1,
              "type":"DATE_PICKER"
            },
            {
              "id":"2",
              "order":2,
              "type":"CHECKBOX",
              "label":"Accept",
              "required":false
            }
          ]
        }
        """

        let form = try JSONDecoder().decode(
            FormResponse.self,
            from: Data(json.utf8)
        )

        XCTAssertEqual(form.fields.count, 1)
    }
}
