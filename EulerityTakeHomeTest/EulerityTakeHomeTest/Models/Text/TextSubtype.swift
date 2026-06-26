//
//  TextSubtype.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


enum TextSubtype: String, Decodable {

    case plain = "PLAIN"
    case multiline = "MULTILINE"
    case number = "NUMBER"
    case uri = "URI"
    case secure = "SECURE"
}