//
//  BaseRequestModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class BaseRequestModel {
    
    // MARK: - Properties
    var path: String {
        return ""
    }
    var parameters: [String: Any?] {
        return [:]
    }
    var headers: [String: String] {
        return [:]
    }
    var method: RequestHTTPMethod {
        return body.isEmpty ? RequestHTTPMethod.get : RequestHTTPMethod.post
    }
    var body: [String: Any?] {
        return [:]
    }
    
    func urlRequest() -> URLRequest {
        var endpoint: String = NetworkManager.shared.baseURL.appending(path)
        
        if !parameters.isEmpty {
            endpoint += "?"
        }
        
        for parameter in parameters {
            if let value = parameter.value {
                endpoint.append("&\(parameter.key)=\(value)")
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
        
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method == RequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                debugPrint("Request body parse error: \(error.localizedDescription)")
            }
        }
        return request
    }
}
