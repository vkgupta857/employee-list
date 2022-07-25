//
//  EmployeesTableViewCell.swift
//  EmployeeList
//
//  Created on 22/07/22.
//  

import UIKit

class EmployeesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
