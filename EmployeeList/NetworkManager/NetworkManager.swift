//
//  NetworkManager.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    
    var baseURL: String = "https://api.equation.consolebit.com/api/v1/"
}

// MARK: - Public Functions
extension NetworkManager {
    
    func sendRequest<T: Codable>(request: BaseRequestModel, completion: @escaping(Result<T, ErrorModel>) -> Void) {

        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = ErrorModel(ErrorType.general.rawValue)
                completion(Result.failure(error))
                return
            }
            switch httpResponse.statusCode {
            case 200:
                do {
                    guard let data = data, let parsedResponse = try JSONDecoder().decode(T?.self, from: data) else {
                        let error: ErrorModel = ErrorModel(ErrorType.parsing.rawValue)
                        completion(Result.failure(error))
                        return
                    }
                    completion(Result.success(parsedResponse))
                } catch (let error){
                    debugPrint(error)
                }
            case 503:
                guard let data = data, let parsedResponse = try? JSONDecoder().decode(ErrorResponseModel.self, from: data) else {
                    let error: ErrorModel = ErrorModel(ErrorType.parsing.rawValue)
                    completion(Result.failure(error))
                    return
                }
                let error = ErrorModel(ErrorType.serviceUnavailable.rawValue, message: parsedResponse.message ?? "")
                completion(Result.failure(error))
            case 401:
                let error = ErrorModel(ErrorType.general.rawValue, message: "401")
                completion(Result.failure(error))
            default:
                let error = ErrorModel(ErrorType.general.rawValue)
                completion(Result.failure(error))
            }
        }.resume()
    }
}
