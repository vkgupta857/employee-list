//
//  ErrorResponseModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

// MARK: - ErrorResponseModel
struct ErrorResponseModel: Codable {
    let code, message, reference: String?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case reference = "Reference"
    }
}
