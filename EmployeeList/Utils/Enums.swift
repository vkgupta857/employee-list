//
//  Enums.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

enum ErrorType: String {
    case general = "Error_general"
    case parsing = "Error_parsing"
    case serviceUnavailable = "Service Unavailable!"
}

enum ErrorTitle: String {
    case generalError = "Error!"
    case currentLocationError = "Cannot detect location!"
    case serviceUnavailable = "Service Unavailable"
}

enum ErrorMessage: String {
    case badLink = "No/bad link given"
    case currentLocation = "Using default location of Nagpur, Maharashtra, India"
    case search = "Please enter 3 or more characters"
    case invalidCity = "Invalid city selected"
}
