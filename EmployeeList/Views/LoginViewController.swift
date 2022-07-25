//
//  ViewController.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        emailTextField.becomeFirstResponder()
        passwordTextField.delegate = self
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        gesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(gesture)
        
        viewModel.handleLoginSuccess = { [unowned self] accessToken in
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeListVC") as? EmployeeListVC {
                vc.viewModel.accessToken = accessToken
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        viewModel.showError = { [unowned self] msg in
            self.showError(title: "Error", msg: msg)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func loginButtonAction(_ sender: Any) {
//        print("email - \(emailTextField.text)")
//        print("password - \(passwordTextField.text)")
//        print("login tapped")
        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeListVC")
//        self.navigationController?.pushViewController(vc, animated: true)
        if let email = emailTextField.text, let password = passwordTextField.text {
//            viewModel.sendLoginRequest(email: email, password: password)
            viewModel.login(email: email, password: password)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        return true
    }
}
