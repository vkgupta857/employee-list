//
//  EmployeeListResponseModel.swift
//  EmployeeList
//
//  Created on 25/07/22.
//  

import Foundation

// MARK: - EmployeeListResponseModel
struct EmployeeListResponseModel: Codable {
    let count: Int
    let next, previous: JSONNull?
    let results: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let id: Int
    let firstName, lastName, email, dob: String
    let hireDate, address, city, zipCode: String
    let country, phone: String
    let photo: JSONNull?
    let salary, designation, organizationName, status: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, dob
        case hireDate = "hire_date"
        case address, city
        case zipCode = "zip_code"
        case country, phone, photo, salary, designation
        case organizationName = "organization_name"
        case status
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

