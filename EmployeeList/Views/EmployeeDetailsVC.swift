//
//  EmployeeDetailsVC.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import UIKit

class EmployeeDetailsVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    
    var employee: Employee?
    
    var profileImage: UIImage?
    var name: String?
    var designation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        profileImageView.image = profileImage
        nameLabel.text = name
        designationLabel.text = designation
        
        profileImageView.image = profileImage
        nameLabel.text = "\(employee?.firstName ?? "") \(employee?.lastName ?? "")"
        designationLabel.text = employee?.organizationName
    }
}
