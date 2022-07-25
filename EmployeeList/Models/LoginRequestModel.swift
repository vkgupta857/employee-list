//
//  LoginRequestModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

class LoginRequestModel: BaseRequestModel {
    
    private var email: String?
    private var password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    override var path: String {
        return EndPoints.login.rawValue
    }
    
    override var method: RequestHTTPMethod {
        return RequestHTTPMethod.post
    }
    
    override var parameters: [String : Any?] {
        return [
            "email": email,
            "password": password
        ]
    }
}
