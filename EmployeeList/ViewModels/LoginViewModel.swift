//
//  LoginViewModel.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import Foundation

class LoginViewModel {
    
    var showError: ((String)->())?
    var handleLoginSuccess: ((String)->())?
    
    func sendLoginRequest(email: String, password: String) {
        NetworkManager.shared.sendRequest(request: LoginRequestModel(email: email, password: password)) { [weak self] (result: Result<LoginResponseModel, ErrorModel>) in
            switch result {
            case .success(let response):
                print(response)
                self?.handleLoginSuccess?(response.access)
            case .failure(let error):
                print(error)
                self?.showError?(error.message)
            }
        }
    }
    
    func login(email: String, password: String) {
        guard let url = Bundle.main.url(forResource: "login", withExtension: "json") else { return }
        let data = try? JSONDecoder().decode(LoginResponseModel.self, from: Data(contentsOf: url))
        debugPrint(data ?? "")
        if let accessToken = data?.access, !accessToken.isEmpty {
            self.handleLoginSuccess?(accessToken)
        }
    }
}
