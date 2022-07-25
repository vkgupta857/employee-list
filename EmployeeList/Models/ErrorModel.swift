//
//  ErrorModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

struct ErrorModel: Error {
    
    // MARK: - Properties
    var messageKey: String
    var message: String
    
    init(_ messageKey: String, message: String = "") {
        self.messageKey = messageKey
        self.message = message
    }
    
    static func generalError() -> ErrorModel {
        return ErrorModel(ErrorType.general.rawValue)
    }
}
