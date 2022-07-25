//
//  LoginResponseModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let access, refresh: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName, email: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}
