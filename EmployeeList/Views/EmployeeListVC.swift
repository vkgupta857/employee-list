//
//  EmployeeListViewController.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var employeesTableView: UITableView!
    
    var cellIdentifier = "EmployeesTableViewCell"
    
    lazy var viewModel: EmployeeListViewModel = {
        return EmployeeListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "Hello"
        configNavBar()
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        viewModel.updateEmployeeList = { [weak self] in
            DispatchQueue.main.async {
                self?.employeesTableView.reloadData()
            }
        }
        viewModel.getEmployees()
    }
    
    private func configNavBar() {
        let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonAction))
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        self.navigationItem.rightBarButtonItems = [logoutBtn, addBtn]
    }
    
    @objc func logoutButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonAction() {
        print("add employee action")
    }
}

extension EmployeeListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = tableView.cellForRow(at: indexPath) as? EmployeesTableViewCell {
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeDetailsVC") as? EmployeeDetailsVC, let emp = self.viewModel.employees?[indexPath.row] else {
                print("Cannot cast to EmployeeDetailsVC")
                return
            }
            vc.employee = emp
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension EmployeeListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? EmployeesTableViewCell {
            cell.cellImageView.image = UIImage(systemName: "homekit")
            cell.cellTitleLabel.text = "\( self.viewModel.employees?[indexPath.row].firstName ?? "") \(self.viewModel.employees?[indexPath.row].lastName ?? "")"
            cell.cellDescLabel.text = self.viewModel.employees?[indexPath.row].organizationName
            return cell
        }
        return UITableViewCell()
    }
}
