//
//  EmployeeListViewModel.swift
//  EmployeeList
//
//  Created on 25/07/22.
//  

import Foundation

class EmployeeListViewModel {
    var accessToken: String?
    var refreshToken: String?
    
    var updateEmployeeList: (()->())?
    
    var employees: [Employee]? {
        didSet {
            updateEmployeeList?()
        }
    }
    
    func getEmployees() {
        guard let url = Bundle.main.url(forResource: "employeelist", withExtension: "json") else { return }
        let data = try? JSONDecoder().decode(EmployeeListResponseModel.self, from: Data(contentsOf: url))
//        debugPrint(data)
        if let emps = data?.results, !emps.isEmpty {
            employees = emps
        }
    }
}
