//
//  FormRepository.swift
//  EulerityTakeHomeTest
//
//  Created by Rakib on 27/06/26.
//

import Foundation

protocol FormRepository {

    func loadForm() throws -> FormResponse

}
