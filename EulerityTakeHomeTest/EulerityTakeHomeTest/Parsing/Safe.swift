//
//  Safe.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//


//
//  Safe.swift
//

import Foundation

struct Safe<T: Decodable>: Decodable {

    let value: T?

    init(from decoder: Decoder) {
        value = try? T(from: decoder)
    }
}